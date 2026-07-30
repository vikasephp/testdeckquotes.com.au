<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);
$table = new Fw_Db_Table('planning_defination_database');
$where = " where 1 = 1 ";

$sync = $fwRequest->getParam('sync', '');
if($sync)
{
	$keys_2 = array_keys($sync);
	$ky_2 = $keys_2[0];
	$val_2 = $sync[$ky_2];

	$detail['pdd_sync'] = $val_2;
	$detail['pdd_sync_date'] = date('d-m-Y');
	$detail['pdd_sync_user'] = $_SESSION['user']['user_name'];  

	$table->setWhere("pdd_id = ".$ky_2);
	if($table->rowExists())
	{
		$this_id = $table->updateRow($detail);
		
		//Code for Webhook that will trigger when the Planning Definitions is synced/unsynced
		$sqlpd = "SELECT pdd_id, pdd_defination, pdd_source, TRIM( REPLACE( REPLACE( REPLACE( REGEXP_REPLACE(pdd_meaning, '<[^>]*>', ''), '&nbsp;', ' ' ), CHAR(13), '' ), CHAR(10), '' ) ) AS pdd_meaning, TRIM( REPLACE( REPLACE( REPLACE( REGEXP_REPLACE(pdd_plain_english, '<[^>]*>', ''), '&nbsp;', ' ' ), CHAR(13), '' ), CHAR(10), '' ) ) AS pdd_plain_english, pdd_sync, pdd_icon, pdd_image, pdd_image_description, pdd_image_note FROM planning_defination_database WHERE pdd_id = " . intval($ky_2);

		$pdwh = $fwDb->queryOne($sqlpd);

		if (!empty($pdwh)) {
			
			$media_folder_path = 'files/planning_definations_database/';
			if (!empty($pdwh['pdd_icon'])){
				$media_icon = $pdwh['pdd_icon'];
				$icon = showUrl($media_folder_path, $media_icon);
			} else {
				$icon = '';
			}
			
			if (!empty($pdwh['pdd_image'])){
				$media_image = $pdwh['pdd_image'];
				$image = showUrl($media_folder_path, $media_image);
			} else {
				$image = '';
			}

			$payload = array(
				"pdd_id" => $pdwh['pdd_id'],
				"pdd_defination" => $pdwh['pdd_defination'],
				"pdd_source" => $pdwh['pdd_source'],
				"pdd_meaning" => $pdwh['pdd_meaning'],
				"pdd_plain_english" => $pdwh['pdd_plain_english'],
				"pdd_synced_at" => date("Y-m-d H:i:s"),
				"pdd_icon" => $icon,
				"pdd_image" => $image,
				"pdd_image_description" => $pdwh['pdd_image_description'],
				"pdd_image_note" => $pdwh['pdd_image_note'],
				"pdd_status" => ($pdwh['pdd_sync'] == 1) ? "synced" : "unsynced"
			);

			$jsonPayload = json_encode($payload);

			if ($jsonPayload === false) {
				error_log('Webhook JSON Error: ' . json_last_error_msg());
			} else {

				$ch = curl_init();

				curl_setopt_array($ch, array(
					CURLOPT_URL => "https://dualoccupancycanberra.com.au/wp-json/doc_definition/v1/webhook",
					CURLOPT_POST => true,
					CURLOPT_RETURNTRANSFER => true,
					CURLOPT_TIMEOUT => 10,
					CURLOPT_HTTPHEADER => array(
						"Content-Type: application/json",
						"Accept: application/json"
					),
					CURLOPT_POSTFIELDS => $jsonPayload
				));

				$response = curl_exec($ch);
				$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

				if (curl_errno($ch)) {
					error_log('Webhook cURL Error: ' . curl_error($ch));
				} else {
					error_log("Webhook HTTP {$httpCode}: " . $response);
				}

				curl_close($ch);
			}
		}
	}	
	$redirectUrl = $_SERVER['REQUEST_URI'];
	header("Location: $redirectUrl");
	exit;
}

$qaed_approval_1 = $fwRequest->getParam('qaed_approval_1', '');
if($qaed_approval_1)
{
	$keys_a1 = array_keys($qaed_approval_1);
	$ky_a1 = $keys_a1[0];
	$val_a1 = $qaed_approval_1[$ky_a1];

	$detail_a1['pdd_qaed_approval_1'] = $val_a1;
	$detail_a1['pdd_qaed_approval_1_at'] = date('d-m-Y');
	$detail_a1['pdd_qaed_approval_1_by'] = $_SESSION['user']['user_id'];  

	$table->setWhere("pdd_id = ".$ky_a1);
	if($table->rowExists())
	{
		$this_id = $table->updateRow($detail_a1);
	}	
	$redirectUrl = $_SERVER['REQUEST_URI'];
	header("Location: $redirectUrl");
	exit;
}

$qaed_approval_2 = $fwRequest->getParam('qaed_approval_2', '');
if($qaed_approval_2)
{
	$keys_a2 = array_keys($qaed_approval_2);
	$ky_a2 = $keys_a2[0];
	$val_a2 = $qaed_approval_2[$ky_a2];

	$detail_a2['pdd_qaed_approval_2'] = $val_a2;
	$detail_a2['pdd_qaed_approval_2_at'] = date('d-m-Y');
	$detail_a2['pdd_qaed_approval_2_by'] = $_SESSION['user']['user_id'];  

	$table->setWhere("pdd_id = ".$ky_a2);
	if($table->rowExists())
	{
		$this_id = $table->updateRow($detail_a2);
	}	
	$redirectUrl = $_SERVER['REQUEST_URI'];
	header("Location: $redirectUrl");
	exit;
}


$clear = $fwRequest->getParam('clear', '');
if (!empty($clear)) {
	
	unset($_SESSION['pdd_defination']);
	$fwViewData['pdd_defination'] = '';
	$defination = '';
	
	unset($_SESSION['term']);
	$fwViewData['term'] = '';
    $term = '';
}

$defination = $fwRequest->getParam('defination', '');

if (!empty($defination)) {
	$where .= " AND pdd_defination Like '%" . $defination."%'";
	$_SESSION['pdd_defination'] = $fwViewData['pdd_defination'] = $defination;
} elseif ($_SESSION['pdd_defination']) {

	$where .= " AND pdd_defination Like '%" . $_SESSION['pdd_defination']."%'";
}

$term = $fwRequest->getParam('term', '');

if (!empty($term)) {
	$where .= " AND ( pdd_source Like '%" . $term."%' OR  pdd_meaning Like '%" . $term."%' OR pdd_plain_english Like '%" . $term."%' )";
	$_SESSION['term'] = $fwViewData['pdd_defination'] = $term;
} elseif ($_SESSION['term']) {

	$where .= " AND pdd_source Like '%" . $_SESSION['term']."%' OR  pdd_meaning Like '%" . $_SESSION['term']."%' OR pdd_plain_english Like '%" . $_SESSION['term']."%' ) ";
}

$sql_user = "SELECT user_id, user_name FROM users";
$data_user = $fwDb->query($sql_user);

$users = [];
foreach ($data_user as $user) {
    $users[$user['user_id']] = $user['user_name'];
}

$matsql = "SELECT $TABLE.* FROM $TABLE  " .$where ." Order by pdd_defination";
//db($matsql);

$resultData = $fwDb->query($matsql);

if (!empty($resultData)) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}
	$rows = count($resultData);
	$page_rows = 300;
	$last = ceil($rows / $page_rows);
	if ($pagenum <= 1) {
		$pagenum = 1;
	} elseif ($pagenum > $last) {
		$pagenum = $last;
	}
	$fwViewData['last'] = $last;
	$fwViewData['lastone'] = $last - 1;
	$fwViewData['lasttow'] = $last - 2;
	$fwViewData['pagenum'] = $pagenum;
	$pagenatedatanext = $pagenum;
	$pagenatedataprev = $pagenum;
	for ($i = 0; $i < 9; $i++) {
		$paginate[$pagenatedatanext] = $pagenatedatanext;
		$pagenatedatanext++;
	}
	$fwViewData['paginatenext'] = $paginate;
	$pagenatedataprev = $pagenum;
	for ($i = 0; $i < 9; $i++) {
		$paginateprev[$pagenatedataprev] = $pagenatedataprev;
		$pagenatedataprev--;
	}
	$fwViewData['paginateprev'] = array_reverse($paginateprev);

	$max = 'limit ' . ($pagenum - 1) * $page_rows . ',' . $page_rows;

	$sql2 =  $matsql . " " . $max;
	if ($sql2) {
		$lists = $fwDb->query($sql2);

		foreach ($lists as $list):
			$list['link'] =  $BASE_URL . "business.detail/bsn_id/" . $list['va_bsn_id'];

			$list['pdd_qaed_approval_1_by_name'] = $users[$list['pdd_qaed_approval_1_by']] ?? '';

			$list['pdd_qaed_approval_2_by_name'] = $users[$list['pdd_qaed_approval_2_by']] ?? '';			
			
			$listsnew[] = $list;
		endforeach;

		$fwViewData['list'] = $listsnew;
		//echo "<pre>"; print_r($lists); exit();
	}
}


$fwViewData['list'] = $listsnew;	

//$sql_type = "SELECT * FROM insurance_manager_type";
//$fwViewData['typeData'] = $fwDb->query($sql_type);

$fwViewData['title'] = $MODULE_PLURAL;

$sql_count_record = "SELECT COUNT(*) AS total_records, COUNT(CASE WHEN pdd_sync = 1 THEN 1 END) AS synced_records FROM planning_defination_database";
$data_count_record = $fwDb->queryOne($sql_count_record);

$fwViewData['total_records'] = $data_count_record['total_records'];
$fwViewData['synced_records'] = $data_count_record['synced_records'];
