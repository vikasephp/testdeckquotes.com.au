<?php
$fwMainView = 'file:' . getcwd() . '/productpage_edit.tpl';

$this_table = new Fw_Db_Table('project_item');
$docs_table = new Fw_Db_Table('project_item_documents');
$pi_id = (int)$fwRequest->getParam('pi_id', '');
$submit = $fwRequest->getParam('subAddDetail', '');
$fwViewData['error'] = '';
$fwViewData['max_documents'] = 6;

$imageDirRel = 'files/project_item_images/';
$imageDirAbs = BASE_DIR . (defined('FILE_PATH') ? FILE_PATH : '') . $imageDirRel;

function productpage_sanitize_image_name($name)
{
	$name = preg_replace('/[^A-Z0-9._]/i', '_', (string)$name);
	return trim($name, '._') ?: 'image.jpg';
}

function productpage_is_allowed_image($tmpPath, $origName)
{
	$allowedExt = array('jpg', 'jpeg', 'png', 'gif', 'webp');
	$ext = strtolower(pathinfo($origName, PATHINFO_EXTENSION));
	if (!in_array($ext, $allowedExt, true)) {
		return false;
	}
	if (!is_uploaded_file($tmpPath)) {
		return false;
	}
	$info = @getimagesize($tmpPath);
	if ($info === false) {
		return false;
	}
	return true;
}

function productpage_normalize_documents($docsInput, $max = 6)
{
	$normalized = array();
	if (!is_array($docsInput)) {
		return $normalized;
	}

	foreach ($docsInput as $row) {
		if (!is_array($row)) {
			continue;
		}
		$name = isset($row['name']) ? trim((string)$row['name']) : '';
		$link = isset($row['link']) ? trim((string)$row['link']) : '';
		if ($name === '' && $link === '') {
			continue;
		}
		$normalized[] = array(
			'pid_name' => $name,
			'pid_link' => $link,
		);
		if (count($normalized) >= $max) {
			break;
		}
	}

	return $normalized;
}

function productpage_load_documents($docs_table, $pi_id)
{
	$pi_id = (int)$pi_id;
	$docs_table->setWhere('pid_pi_id = ' . $pi_id);
	$docs_table->setOrderBy('pid_sort ASC, pid_id ASC');
	$rows = $docs_table->getRows();
	return is_array($rows) ? $rows : array();
}

function productpage_save_documents($docs_table, $pi_id, $docs)
{
	$pi_id = (int)$pi_id;
	$docs_table->setWhere('pid_pi_id = ' . $pi_id);
	$docs_table->deleteRows();

	$sort = 1;
	foreach ($docs as $doc) {
		$docs_table->insertRow(array(
			'pid_pi_id' => $pi_id,
			'pid_name' => $doc['pid_name'],
			'pid_link' => $doc['pid_link'],
			'pid_sort' => $sort,
		));
		$sort++;
	}
}

if ($pi_id > 0 && !empty($submit)) {
	$detail = $fwRequest->getParam('data', array());
	$removeImage = $fwRequest->getParam('remove_image', '');
	$docsInput = $fwRequest->getParam('documents', array());
	$docs = productpage_normalize_documents($docsInput, 6);

	// Keep warrantyreport compatible: sync first document into old columns.
	$detail['pi_document_name'] = !empty($docs[0]['pid_name']) ? $docs[0]['pid_name'] : '';
	$detail['pi_document_link'] = !empty($docs[0]['pid_link']) ? $docs[0]['pid_link'] : '';

	// Load current row so we can replace/delete old image file.
	$current = $fwDb->queryOne('SELECT pi_image FROM project_item WHERE pi_id = ' . $pi_id);
	$currentImage = !empty($current['pi_image']) ? $current['pi_image'] : '';

	if (!empty($removeImage) && $currentImage !== '') {
		$oldPath = $imageDirAbs . $currentImage;
		if (is_file($oldPath)) {
			@unlink($oldPath);
		}
		$detail['pi_image'] = '';
		$currentImage = '';
	}

	if (!empty($_FILES['pi_image']['name']) && (int)$_FILES['pi_image']['error'] === UPLOAD_ERR_OK) {
		$origName = $_FILES['pi_image']['name'];
		$tmpName = $_FILES['pi_image']['tmp_name'];

		if (!productpage_is_allowed_image($tmpName, $origName)) {
			$fwViewData['error'] = 'Please upload a valid image (jpg, jpeg, png, gif, webp).';
		} else {
			if (!is_dir($imageDirAbs)) {
				@mkdir($imageDirAbs, 0777, true);
			}

			$safeName = productpage_sanitize_image_name($origName);
			$ext = strtolower(pathinfo($safeName, PATHINFO_EXTENSION));
			$base = pathinfo($safeName, PATHINFO_FILENAME);
			$finalName = $pi_id . '_' . date('Ymd_His') . '_' . $base . '.' . $ext;
			$destination = $imageDirAbs . $finalName;

			if (!move_uploaded_file($tmpName, $destination)) {
				$fwViewData['error'] = 'Image upload failed. Please try again.';
			} else {
				@chmod($destination, 0664);
				if ($currentImage !== '' && $currentImage !== $finalName) {
					$oldPath = $imageDirAbs . $currentImage;
					if (is_file($oldPath)) {
						@unlink($oldPath);
					}
				}
				$detail['pi_image'] = $finalName;
			}
		}
	}

	if ($fwViewData['error'] === '') {
		$this_table->setWhere('pi_id = ' . $pi_id);
		$opr = $this_table->updateRow($detail);
		productpage_save_documents($docs_table, $pi_id, $docs);
		$fwViewData['opr'] = $opr;
	}
}

if ($pi_id > 0) {
	$query = 'SELECT PI.*, IL.il_name FROM project_item AS PI LEFT JOIN item_list AS IL ON IL.il_id = PI.pi_il_id WHERE PI.pi_id = ' . $pi_id . ';';
	$result = $fwDb->queryOne($query);
	$documents = productpage_load_documents($docs_table, $pi_id);

	// Fallback if migration missed a row but old columns still have values.
	if (empty($documents) && (!empty($result['pi_document_name']) || !empty($result['pi_document_link']))) {
		$documents = array(array(
			'pid_name' => isset($result['pi_document_name']) ? $result['pi_document_name'] : '',
			'pid_link' => isset($result['pi_document_link']) ? $result['pi_document_link'] : '',
			'pid_sort' => 1,
		));
	}

	if (empty($documents)) {
		$documents = array(array('pid_name' => '', 'pid_link' => '', 'pid_sort' => 1));
	}

	$fwViewData['detail'] = $result;
	$fwViewData['documents'] = $documents;
	$fwViewData['page_title'] = isset($result['il_name']) ? $result['il_name'] : 'Product Item';
	$fwViewData['image_url_base'] = BASE_URL . (defined('FILE_PATH') ? FILE_PATH : '') . $imageDirRel;
}
