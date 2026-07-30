<?php

// doc root
define('BASE_DIR', realpath(__DIR__ . '/../../../..'));

// site root
define('SITE_DIR', BASE_DIR . '/site/');

// lib root
define('LIB_DIR', SITE_DIR . 'lib/');

// tmp dir
define('MODULES_DIR', SITE_DIR . 'modules/');

// tmp dir
define('TMP_DIR', LIB_DIR . 'tmp/');

/* load configuration */
require_once(SITE_DIR . 'site.config.php');
/* database layer initialization */
require_once(LIB_DIR . 'Fw/Db.php');
/* load table model */
require_once(LIB_DIR . 'Fw/Db/Table.php');

$cronFWDB 	= Fw_Db::getInstance();
$sql 		= "select * from s3bucket where s_id = 1";
$s3data 	= $cronFWDB->queryOne($sql);

define('ACCESS_KEY',  $s3data['s_acc_k']);
define('SECRET_KEY',  $s3data['s_sec_k']);
define('BUCKET_NAME', $s3data['s_bucket_name']);

$sql2 		= "select * from s3bucket_test_video where s_id = 1";
$s3dataV 	= $cronFWDB->queryOne($sql2);

define('ACCESS_KEY_V',  $s3dataV['s_acc_k']);
define('SECRET_KEY_V',  $s3dataV['s_sec_k']);
define('BUCKET_NAME_V', $s3dataV['s_bucket_name']);


$sqlsm 	= "select * from smtp_logins where sm_id = 1";
$smdata = $cronFWDB->queryOne($sqlsm);

define('SMTP_USER',  $smdata['sm_user']);
define('SMTP_PASS',  $smdata['sm_password']);

$tablePoincc3MergePoFiles = new Fw_Db_Table('poincc3_merge_po_files');
$tableCronJobs 		= new Fw_Db_Table('cron_jobs');
$tableCronJobs->setWhere("status = 'pending' AND module = 'poincc3'");
$pendingJobs 		= $tableCronJobs->getRows();

if(!count($pendingJobs)) {
	echo 'poincc3 : No pending jobs found!'; exit;	
}

foreach($pendingJobs as $job) {
	
	$action = $job['action'];
	updateJobRecord($job['id'], array('status' => 'in_progress'));
	
	switch ($action) {
		case "download_files_and_assign_po_number":
			downloadFilesAndAssignPoNumber($job);
			break;
			
		case "other_action":
			// do some logic here
			break;
		
		default:
			echo "Invalid job action";
			break;
	}
	
}
		
function downloadFilesAndAssignPoNumber($job)
{
	$jobID = $job['id'];
	try {
		$records 	= fetchPoRecords($job);
		$recordCount= count($records);
		$invStageId = getValueByKeyFromPayload($job, 'po_invoice_stage');

		$logMessage = 'poincc3 - DownloadFilesAndAssignPoNumber : No records found for po_invoice_stage = '.$invStageId;
		if(!$recordCount) {
			echo $logMessage;
			updateJobRecord($jobID, array('status' => 'failed', 'error_logs' => $logMessage));
			return false;
		}
		
		clearDatabaseForPoFiles($job);
		downloadFilesForPoNumber($job);
		assignPoNumber($job);
		updateJobRecord($jobID, array('status' => 'completed'));
	} catch(ErrorException $ex) {
		updateJobRecord($jobID, array('status' => 'failed', 'error_logs' => $ex->getMessage()));
	}
}

function clearDatabaseForPoFiles($job)
{
	$thisTable = new Fw_Db_Table("poincc3_merge_po_files");
	$thisTable->setWhere("`is_downloaded` = 'YES'");
	$thisTable->deleteRows();
	
	$files_list = glob(BASE_DIR . "/files/poincc3/po_files_list/*");
	foreach ($files_list as $file) {
		if (is_file($file)) {
			unlink($file);
		}
	}

	$fileName = 'poincc3_po_pdf_list_' . date("d-m-y") . '.zip';
	$zip_file_path = BASE_DIR . '/site/modules/poincc3/frontend/' . $fileName;
	if (is_file($zip_file_path)) {
		unlink($zip_file_path);
	}	
}

function downloadFilesForPoNumber($job)
{
	global $cronFWDB;
	global $tablePoincc3MergePoFiles;
		
	$records 	= fetchPoRecords($job);
	$recordCount= count($records);
	$invStageId = getValueByKeyFromPayload($job, 'po_invoice_stage');

	$logMessage = 'poincc3 - DownloadFilesForPoNumber : No records found for po_invoice_stage = '.$invStageId;
	if(!$recordCount) {
		echo $logMessage;
		updateJobRecord($jobID, array('status' => 'failed', 'error_logs' => $logMessage));
		return false;
	}

	foreach ($records as $key => $row) {

		$mergeFetchQuery = "SELECT * FROM `poincc3_merge_po_files` WHERE `file_name` LIKE '" . $row['po_invoice_doc'] . "'";
		$data = $cronFWDB->query($mergeFetchQuery);
		if (!empty($data) && count($data) > 0) {
			// do nothing here.
		} else {
			$folderPath = "files/purchase_order_invoice/";
			$source = fetchS3FileAsRawData($folderPath, $row['po_invoice_doc']);
			if ($source) {
				$insertData = ["file_name" => $row['po_invoice_doc'], "is_downloaded" => "YES"];
				$tablePoincc3MergePoFiles->insertRow($insertData);
			}
		}
	}
}		
		
function assignPoNumber($job)
{
	global $cronFWDB;
	global $tablePoincc3MergePoFiles;
	
	$records 	= fetchPoRecords($job);
	$recordCount= count($records);
	$invStageId = getValueByKeyFromPayload($job, 'po_invoice_stage');

	$logMessage = 'poincc3 - AssignPoNumber : No records found for po_invoice_stage = '.$invStageId;
	if(!$recordCount) {
		echo $logMessage;
		updateJobRecord($jobID, array('status' => 'failed', 'error_logs' => $logMessage));
		return false;
	}

	foreach ($records as $key => $row) {
		
		$mergeFetchQuery= "SELECT * FROM `poincc3_merge_po_files` WHERE `file_name` = '" . $row['po_invoice_doc'] . "' and is_po_number_assigned='NO'";
		$data 			= $cronFWDB->query($mergeFetchQuery);

		if (!empty($data) && count($data) > 0) {

			$printText = "NO PO";
			if (!empty($row['po_purchase_order_no'])) {
				$printText = "HAVE PO  - " . $row['po_purchase_order_no'];
			}
			
			$source 	= BASE_DIR . '/files/poincc3/po_files_list/' . $row['po_invoice_doc'];
			$response 	= assignPoNumberToPdfApi($row['po_invoice_doc'], $printText);
						 
			if ($response->status == 200 || $response->status == "200") {

				file_put_contents($source, file_get_contents($response->url));

				$updatePoData = ['is_po_number_assigned' => "YES"];
				$tablePoincc3MergePoFiles->setWhere("`file_name` LIKE '" . $row['po_invoice_doc'] . "' and is_po_number_assigned='NO'");
				$tablePoincc3MergePoFiles->updateRow($updatePoData);
			}
		}
	}
}

function fetchPoRecords($job)
{
	global $cronFWDB;
	
	$payload 	= json_decode($job['payload']);
	$where 		= " WHERE 1=1 ";
	
	// invoice stage search starts
	$invStageId = $payload->po_invoice_stage ? $payload->po_invoice_stage : null;
	if(empty($invStageId) || is_null($invStageId)) $invStageId = '';
	if (!empty($invStageId)) $where .= " AND po_invoice_stage = '$invStageId'";
	// invoice stage search ends
	
	// invoice approver search starts
	$invApproverId = $payload->po_inv_approver ? $payload->po_inv_approver : null;
	if(empty($invApproverId) || is_null($invApproverId)) $invApproverId = '';
	if (!empty($invApproverId)) $where .= " AND po_inv_approver = '$invApproverId'";
	// invoice approver search ends

	$fetchQuery = "SELECT SQL_CALC_FOUND_ROWS null as row_name, poincc3.* FROM poincc3 " . $where . " ORDER BY STR_TO_DATE(poincc3.po_invoice_date,'%d-%m-%Y') DESC";
	echo $fetchQuery;

	$fetchQuery = stripslashes($fetchQuery);
	$records 	= $cronFWDB->query($fetchQuery);
	
	return $records;
}

function getValueByKeyFromPayload($job, $key)
{
	$payload = json_decode($job['payload']);
	return $payload->$key ? $payload->$key : null;
}

function updateJobRecord($id, $data)
{
	$tableCronJobs = new Fw_Db_Table('cron_jobs');
	$tableCronJobs->setWhere("id = ".$id);
	$data['updated_at'] = date('Y-m-d H:i:s');
	$tableCronJobs->updateRow($data);
}

function fetchS3FileAsRawData($folderPath,$objectName)
{
    include_once BASE_DIR.'/file_upload/server/s3/S3.php'; 
    $bucketName = "deckquote";   
	$s3 		= new S3(ACCESS_KEY, SECRET_KEY);
	
    try {
		
		$file_data 		= $s3->getObject($bucketName, $folderPath.$objectName, $saveTo = false); 
		$file_raw_data 	= $file_data->body;  $file = $objectName;
		file_put_contents(BASE_DIR.'/files/poincc3/po_files_list/'.$file, $file_raw_data);
		return BASE_DIR.'/files/poincc3/po_files_list/'.$file;
     
    } catch (ErrorException $ex) {
		return false;
    }
    
}

function assignPoNumberToPdfApi($po_invoice_doc_name,$print_text)
{
    $curl = curl_init();
    
	curl_setopt_array($curl, array(
		CURLOPT_URL => 'https://api.pdf.co/v1/pdf/edit/add',
		CURLOPT_RETURNTRANSFER => true,
		CURLOPT_ENCODING => '',
		CURLOPT_MAXREDIRS => 10,
		CURLOPT_TIMEOUT => 0,
		CURLOPT_FOLLOWLOCATION => true,
		CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		CURLOPT_CUSTOMREQUEST => 'POST',
		CURLOPT_POSTFIELDS =>'{
			"async": false,
			"encrypt": false,
			"inline": true,
			"name": "'.$po_invoice_doc_name.'", 
			"url": "https://testdeckquotes.com.au/files/poincc3/po_files_list/'.$po_invoice_doc_name.'",
			"annotationsString": "430;5;0-;'.$print_text.';12+bold;Arial;FF0000;",
			"imagesString": "",
			"fieldsString": ""
		}',
		CURLOPT_HTTPHEADER => array(
			'Content-Type: application/json',
			'x-api-key: vickygondia1@gmail.com_a5DbQRX6qNN6LQ001ZTNghW6Uo0qceSo5GYiyJQp8b3z8324pZmmXzWm4SD3ROvA'
		),
	));
	
	$response = json_decode(curl_exec($curl)); 
	curl_close($curl);
	return $response;
}

function dd($dump)
{
	echo '<pre>'.print_r($dump).'</pre>'; die;	
}
