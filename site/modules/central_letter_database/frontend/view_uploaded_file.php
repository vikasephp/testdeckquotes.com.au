<?php
/*
 * Central Letter Database - Review uploaded file (preview first, then optional download).
 * Upload as: site/modules/central_letter_database/frontend/view_uploaded_file.php
 */

$fwMainView = 'file:' . getcwd() . '/view_uploaded_file.tpl';

$file_name = trim($fwRequest->getParam('file_name', ''));
if ($file_name === '' && !empty($_GET['file_name'])) {
	$file_name = trim($_GET['file_name']);
}

$fwViewData['title'] = ($file_name !== '') ? $file_name : 'Review Uploaded File';

$module_name = trim($fwRequest->getParam('module_name', $BASEFOLDER . '.home'));
if ($module_name === '' && !empty($_GET['module_name'])) {
	$module_name = trim($_GET['module_name']);
}
if ($module_name === '') {
	$module_name = $BASEFOLDER . '.home';
}

$fwViewData['file_name'] = $file_name;
$fwViewData['module_name'] = $module_name;
$fwViewData['error'] = '';

if ($file_name === '') {
	$fwViewData['error'] = 'No file was selected.';
	$fwViewData['preview_type'] = 'none';
	$fwViewData['stream_url'] = '';
	$fwViewData['download_url'] = '';
	$fwViewData['file_ext'] = '';
	return;
}

$ext = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));
$fwViewData['file_ext'] = $ext;

$stream_url = rtrim(BASE_URL, '/') . '/' . $BASEFOLDER . '.download_content?file_name=' . rawurlencode($file_name)
	. '&module_name=' . rawurlencode($module_name) . '&view=1';
$download_url = rtrim(BASE_URL, '/') . '/' . $BASEFOLDER . '.download_content?file_name=' . rawurlencode($file_name)
	. '&module_name=' . rawurlencode($module_name);

$fwViewData['stream_url'] = $stream_url;
$fwViewData['download_url'] = $download_url;

$imageExt = array('jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp');
$videoExt = array('mp4', 'webm', 'ogg', 'ogv');
$audioExt = array('mp3', 'wav', 'ogg', 'm4a');
$textExt = array('txt', 'csv', 'log');
$htmlExt = array('html', 'htm');
$officeDocx = array('docx');
$officeSheet = array('xlsx', 'xls');

if (in_array($ext, $imageExt)) {
	$fwViewData['preview_type'] = 'image';
} elseif ($ext === 'pdf') {
	$fwViewData['preview_type'] = 'pdf';
} elseif (in_array($ext, $videoExt)) {
	$fwViewData['preview_type'] = 'video';
} elseif (in_array($ext, $audioExt)) {
	$fwViewData['preview_type'] = 'audio';
} elseif (in_array($ext, $htmlExt)) {
	$fwViewData['preview_type'] = 'html';
} elseif (in_array($ext, $textExt)) {
	$fwViewData['preview_type'] = 'text';
} elseif (in_array($ext, $officeDocx)) {
	$fwViewData['preview_type'] = 'docx';
} elseif (in_array($ext, $officeSheet)) {
	$fwViewData['preview_type'] = 'sheet';
} elseif ($ext === 'doc') {
	$fwViewData['preview_type'] = 'office_limited';
} else {
	$fwViewData['preview_type'] = 'other';
}
