<?php

$pagenum = $fwRequest->getparam('pagenum', '');
$tablePages = new Fw_Db_Table($TABLE);
$tableMi = new Fw_Db_Table('poincc3_merged_invoice');
$table_poincc3_merge_po_files = new Fw_Db_Table('poincc3_merge_po_files');

$export = $fwRequest->getParam('export', 0);
$short = $fwRequest->getParam('s', '');

$fwViewData['ran'] =  rand(100000, 999999);
$user_name = $_SESSION['user']['user_name'];
$date = date("d-m-Y");

//require_once($_SERVER['DOCUMENT_ROOT'].'/pdf-merge/jurosh-pdf-merge/vendor/autoload.php');
//$pdf_jurosh = new \Jurosh\PDFMerge\PDFMerger;


require_once(MODULES_DIR . 'PDFMerger.php');

use PDFMerger\PDFMerger;

$where = " WHERE 1=1 ";
$dt = strtotime(date('d-m-Y h:i:s'));
// Set date for Entered in Myob
$sub_myob = $fwRequest->getParam('po_enter_myob', '');
if (!empty($sub_myob)) {
	$savetorm1 = $fwRequest->getParam('po_enter_myob', '');
	foreach ($savetorm1 as $k => $v) {
		$rmDetail['po_myob_date'] = $v;
		$tablerm = new Fw_Db_Table('poincc3');
		$tablerm->setWhere('po_id = ' . $k);
		$detail = $tablerm->updateRow($rmDetail);
	}
}
//

$sub_podate = $fwRequest->getParam('po_app_date', '');
if (!empty($sub_podate)) {
	$savetorm2 = $fwRequest->getParam('po_app_date', '');
	foreach ($savetorm2 as $k => $v) {
		$rmDetail['po_appoved_date'] = $v;
		$tablerm = new Fw_Db_Table('poincc3');
		$tablerm->setWhere('po_id = ' . $k);
		$detail = $tablerm->updateRow($rmDetail);
	}
}

//

$sub_poinvdate = $fwRequest->getParam('po_invoice_date', '');
if (!empty($sub_poinvdate)) {
	$savetorm3 = $fwRequest->getParam('po_invoice_date', '');
	foreach ($savetorm3 as $k => $v) {
		$rmDetail['po_in_payed_date'] = $v;
		$tablerm = new Fw_Db_Table('poincc3');
		$tablerm->setWhere('po_id = ' . $k);
		$detail = $tablerm->updateRow($rmDetail);
	}
}


$submitrm = $fwRequest->getParam('savetorm', '');
if (!empty($submitrm)) {
	$savetorm = $fwRequest->getParam('savetorm', '');

	foreach ($savetorm as $k => $v) {
		$rmDetail['po_enter_in_myob'] = $v;
		$rmDetail['po_myob_user'] = $user_name;
		$tablerm = new Fw_Db_Table('poincc3');
		$tablerm->setWhere('po_id = ' . $k);
		$detail = $tablerm->updateRow($rmDetail);
	}
}

$submitrm2 = $fwRequest->getParam('savetorm2', '');
if (!empty($submitrm2)) {
	$savetorm2 = $fwRequest->getParam('savetorm2', '');

	foreach ($savetorm2 as $k => $v) {
		$apDetail['po_in_approved_payment'] = $v;
		$apDetail['po_approved_user'] = $user_name;
		$tablerm = new Fw_Db_Table('poincc3');
		$tablerm->setWhere('po_id = ' . $k);
		$detail = $tablerm->updateRow($apDetail);
	}
}


$submitrm3 = $fwRequest->getParam('savetorm3', '');
if (!empty($submitrm3)) {
	$savetorm3 = $fwRequest->getParam('savetorm3', '');

	foreach ($savetorm3 as $k => $v) {
		$apDetail['po_invoice_payed'] = $v;
		$apDetail['po_in_payed_user'] = $user_name;
		$tablerm = new Fw_Db_Table('poincc3');
		$tablerm->setWhere('po_id = ' . $k);
		$detail = $tablerm->updateRow($apDetail);
	}
}

$sub_firstqa = $fwRequest->getParam('po_first_qa', '');
if (!empty($sub_firstqa)) {
	$firstqa = $fwRequest->getParam('po_first_qa', '');
	foreach ($firstqa as $k => $v) {
		$rmDetail['po_first_qa'] = $v;
		$tablerm = new Fw_Db_Table('poincc3');
		$tablerm->setWhere('po_id = ' . $k);
		$detail = $tablerm->updateRow($rmDetail);
	}
}


$approvedpay = $fwRequest->getParam('po_in_approved_payment', '');
if (!empty($approvedpay)) {
	$appdata = $fwRequest->getParam('po_in_approved_payment', '');
	foreach ($appdata as $k => $v) {
		$rmDetail['po_in_approved_payment'] = $v;
		$rmDetail['po_approved_user'] = $user_name;
		$tablerm = new Fw_Db_Table('poincc3');
		$tablerm->setWhere('po_id = ' . $k);
		$detail = $tablerm->updateRow($rmDetail);
	}
}


$sub_po_pornp = $fwRequest->getParam('po_pornp', '');
if (!empty($sub_po_pornp)) {
	$pornp = $fwRequest->getParam('po_pornp', '');
	foreach ($pornp as $k => $v) {
		$pnpDetail['po_pornp'] = $v;
		$tablerm = new Fw_Db_Table('poincc3');
		$tablerm->setWhere('po_id = ' . $k);
		$detail = $tablerm->updateRow($pnpDetail);
	}
}

$submit_coacc = $fwRequest->getParam('po_chartof_acc', '');
if (!empty($submit_coacc)) {
	$chartof_acc = $fwRequest->getParam('po_chartof_acc', '');

	foreach ($chartof_acc as $k => $v) {
		$coaDetail['po_chartof_acc'] = $v;
		$tablerm = new Fw_Db_Table('poincc3');
		$tablerm->setWhere('po_id = ' . $k);
		$detail = $tablerm->updateRow($coaDetail);
	}
}


$search = $fwRequest->getParam('search', '');

$clearall = $fwRequest->getParam('clearall', '');
$sqlvar = 0;

$supplier = $fwRequest->getParam('supplier_search', '');

if (!empty($supplier)):

	$where .= " AND po_supplier  LIKE '%" . $supplier . "%'  ";
	$_SESSION['supplier'] = $supplier;
	$fwViewData['supplier'] = $_SESSION['supplier'];

elseif ($_SESSION['supplier']):

	$where .= " AND po_supplier LIKE  '%" . $_SESSION['supplier'] . "%' ";
	$fwViewData['supplier'] = $_SESSION['supplier'];

endif;

$_SESSION['where'] = $where;


$project = $fwRequest->getParam('project', '');
if (!empty($project)) :
	$sqlvar = 1;
	//$project = $fwRequest->getParam('project', '');
	$_SESSION['project'] = $project;
	$data = '';
	foreach ($project as $k => $v) {
		//$data .= "'" . $v . "'" . ",";
		$data .= $v;
		$data3 .= $v . ",";
	}

	$fwViewData['data3'] = $data3;
	//$data .= "'" . 'X' . "'";

	//$where .= "AND " . $TABLE . ".po_project_number IN (" . $data . ")";
	$where .= " AND (" . $TABLE . ".po_project_number LIKE '%" . $data . "%' OR " . $TABLE . ".po_project_number2 LIKE '%" . $data . "%' OR " . $TABLE . ".po_project_number3 LIKE '%" . $data . "%' OR " . $TABLE . ".po_project_number4 LIKE '%" . $data . "%' OR " . $TABLE . ".po_project_number5 LIKE '%" . $data . "%' OR " . $TABLE . ".po_project_number6 LIKE '%" . $data . "%' OR " . $TABLE . ".po_project_number7 LIKE '%" . $data . "%' OR " . $TABLE . ".po_project_number8 LIKE '%" . $data . "%' OR " . $TABLE . ".po_project_number9 LIKE '%" . $data . "%' OR " . $TABLE . ".po_project_number10 LIKE '%" . $data . "%')";
	$fwViewData['class7'] = 'style="background:#F00!important"';

	$ord =    " ORDER BY poincc3.po_urn DESC";

elseif ($_SESSION['project']):

	$project = $_SESSION['project'];
	$data = '';
	foreach ($project as $k => $v) {
		//$data .= "'" . $v . "'" . ",";
		$data .= $v;
		$data3 .= $v . ",";
	}

	$fwViewData['data3'] = $data3;
	//$data .= "'" . 'X' . "'";

	//$where .= " AND " . $TABLE . ".po_project_number IN (" . $data . ")";
	$where .= " AND (" . $TABLE . ".po_project_number LIKE '%" . $data . "%' OR " . $TABLE . ".po_project_number2 LIKE '%" . $data . "%' OR " . $TABLE . ".po_project_number3 LIKE '%" . $data . "%' OR " . $TABLE . ".po_project_number4 LIKE '%" . $data . "%' OR " . $TABLE . ".po_project_number5 LIKE '%" . $data . "%' OR " . $TABLE . ".po_project_number6 LIKE '%" . $data . "%' OR " . $TABLE . ".po_project_number7 LIKE '%" . $data . "%' OR " . $TABLE . ".po_project_number8 LIKE '%" . $data . "%' OR " . $TABLE . ".po_project_number9 LIKE '%" . $data . "%' OR " . $TABLE . ".po_project_number10 LIKE '%" . $data . "%')";
	$fwViewData['class7'] = 'style="background:#F00!important"';

	$ord =    " ORDER BY poincc3.po_urn DESC";

else :
	$ord =    " ORDER BY STR_TO_DATE(poincc3.po_invoice_date,'%d-%m-%Y') DESC";
endif;

$myboid = $fwRequest->getParam('myboid', '');
if (!empty($myboid)) :
	$sqlvar = 1;

	$data = '';
	foreach ($myboid as $k => $v) {
		$data .= "'" . $v . "'" . ",";
		$data4 .= $v . ",";
	}

	$fwViewData['data4'] = $data4;
	$data .= "'" . 'X' . "'";

	$where .= " AND " . $TABLE . ".po_myobid IN (" . $data . ")";
	$fwViewData['class8'] = 'style="background:#F00!important"';

	$ord =    " ORDER BY poincc3.po_urn DESC";

else :
	$ord =    " ORDER BY STR_TO_DATE(poincc3.po_invoice_date,'%d-%m-%Y') DESC";
endif;

$search_by_approver = $fwRequest->getParam('search_by_approver', '');
if (!empty($search_by_approver)):

	$where .= " AND po_inv_approver = " . $search_by_approver;
	$_SESSION['search_by_approver'] = $search_by_approver;
	$fwViewData['search_by_approver'] = $_SESSION['search_by_approver'];

elseif ($_SESSION['search_by_approver']):

	$where .= " AND po_inv_approver = " . $_SESSION['search_by_approver'];
	$fwViewData['search_by_approver'] = $_SESSION['search_by_approver'];

endif;

$search_by_p_or_np = $fwRequest->getParam('search_by_p_or_np', '');
if (!empty($search_by_p_or_np)):

	$where .= " AND po_pornp = '" . $search_by_p_or_np."'";
	$_SESSION['search_by_p_or_np'] = $search_by_p_or_np;
	$fwViewData['search_by_p_or_np'] = $_SESSION['search_by_p_or_np'];

elseif ($_SESSION['search_by_p_or_np']):

	$where .= " AND po_pornp = '" . $_SESSION['search_by_p_or_np']."'";
	$fwViewData['search_by_p_or_np'] = $_SESSION['search_by_p_or_np'];

endif;

$myobid_broad = $fwRequest->getParam('myobid_broad_search', '');
if (!empty($myobid_broad)):

	$where .= " AND po_myobid  LIKE '%" . $myobid_broad . "%'  ";
	$_SESSION['myobid_broad'] = $myobid_broad;
	$fwViewData['myobid_broad'] = $_SESSION['myobid_broad'];

elseif ($_SESSION['myobid_broad']):

	$where .= " AND po_myobid  LIKE  '%" . $_SESSION['myobid_broad'] . "%' ";
	$fwViewData['myobid_broad'] = $_SESSION['myobid_broad'];

endif;

$_SESSION['where'] = $where;



$type = $fwRequest->getParam('type', '');
if (!empty($type)) :
	$sqlvar = 1;
	//$type = $fwRequest->getParam('type', '');
	$data = '';
	foreach ($type as $k => $v) {
		$data .= "'" . $v . "'" . ",";
		$data5 .= $v . ",";
	}

	$fwViewData['data5'] = $data5;
	$data .= "'" . 'X' . "'";

	unset($_SESSION['keyword']);
	$_SESSION['type'] = $type;

	$where .= "AND " . $TABLE . ".po_type IN (" . $data . ")";
	$fwViewData['class10'] = 'style="background:#F00!important"';

	$ord =    " ORDER BY poincc3.po_urn DESC";

elseif ($_SESSION['type']):

	$type = $_SESSION['type'];


	$data = '';
	foreach ($type as $k => $v) {
		$data .= "'" . $v . "'" . ",";
		$data5 .= $v . ",";
	}

	$fwViewData['data5'] = $data5;
	$data .= "'" . 'X' . "'";

	$where .= " AND " . $TABLE . ".po_type IN (" . $data . ")";
	$fwViewData['class7'] = 'style="background:#F00!important"';

	$ord =    " ORDER BY poincc3.po_urn DESC";


else :
	$ord =    " ORDER BY STR_TO_DATE(poincc3.po_invoice_date,'%d-%m-%Y') DESC";
endif;


$invoice_no = $fwRequest->getParam('inv_no', '');

if (!empty($invoice_no)):

	$where .= " AND po_invoice_number  = '" . $invoice_no . "'  ";
	$_SESSION['invoice_no'] = $myobid;
	$fwViewData['invoice_no'] = $_SESSION['myobid'];

elseif ($_SESSION['invoice_no']):

	$where .= " AND po_invoice_number  =  '" . $_SESSION['invoice_no'] . "' ";
	$fwViewData['invoice_no'] = $_SESSION['invoice_no'];

endif;

$_SESSION['where'] = $where;

$inv_stg = $fwRequest->getParam('inv_stg', '');

if (!empty($inv_stg)) :

	$where .= " AND po_invoice_stage   = " . $inv_stg;
	$fwViewData['inv_stg'] = $inv_stg;
	$_SESSION['inv_stg'] = $inv_stg;

elseif ($_SESSION['inv_stg']):

	$where .= " AND po_invoice_stage   = " . $_SESSION['inv_stg'];
	$fwViewData['inv_stg'] = $inv_stg;
endif;


if ($clearall):
	$where = " WHERE 1=1 ";
	$fwViewData['class9'] = 'style="background:#F00!important"';
	$fwViewData['class1'] = '';
	$sqlvar = 1;
	unset($_SESSION['supplier']);
	unset($_SESSION['project']);
	unset($_SESSION['type']);
	unset($_SESSION['myobid']);
	unset($_SESSION['myobid_broad']);
	unset($_SESSION['keyword']);
	unset($_SESSION['notpayed']);
	unset($_SESSION['inv_stg']);
	
	unset($_SESSION['search_by_approver']);
	$fwViewData['search_by_approver'] = "";
	
	unset($_SESSION['search_by_p_or_np']);
	$fwViewData['search_by_p_or_np'] = "";
	
	$fwViewData['inv_stg'] = "";

endif;


$sql10 = "Select sum(CAST(REPLACE(REPLACE(po_invoice_value, ',', ''), '$', '') AS decimal(15,2))) as inv_val  from poincc3 
	  where po_invoice_stage = 1";
$datanew = $fwDb->queryOne($sql10);

$fwViewData['totval'] = $datanew['inv_val'];

$sql = "SELECT SQL_CALC_FOUND_ROWS null as row_name, " . $TABLE . ".* FROM " . $TABLE . " " . $where . $ord;
$fwViewData['sql'] = $sql;

$expdata = $fwDb->query($sql);

if ($sql) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	} elseif ($pagenum <= 1) {
		$pagenum = 1;
	}
	$page_rows = 100;
	$max = 'limit ' . ($pagenum - 1) * $page_rows . ',' . $page_rows;

	$sql2 =  $sql . " " . $max;


	if ($sql2) {
		$setdata = $fwDb->query($sql2);
	}
	$userData = $setdata;
	$total_rows = $fwDb->query('SELECT FOUND_ROWS() as `rows`');
	$total_rows = $total_rows[0]['rows'];
	//$rows = count($userData);
	$rows = $total_rows;
}


if (!empty($setdata)) {
	$last = ceil($rows / $page_rows);

	if ($pagenum <= 1) {
		$pagenum = 1;
	} elseif ($pagenum > $last) {
		$pagenum = $last;
	}
	$numstartvounter =  $page_rows * ($pagenum - 1) + 1;
	$fwViewData['numstartvounter'] = $numstartvounter;

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


	//$fwViewData['list'] =  $setdata;
}


foreach ($setdata as $k2 => $v2) {
	$sql2 = "select is_color from poincc3_invoice_stage where is_id = " . $v2['po_invoice_stage'];
	$coldata = $fwDb->queryOne($sql2);
	$setdata[$k2]['color_code'] = $coldata['is_color'];
}


$fwViewData['list'] =  $setdata;

$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Purchase orders and invoice clearing centre - POINCC3";

$sql2 = "SELECT distinct po_supplier from poincc3 order by po_supplier ";
if ($sql2) {
	$fwViewData['suplist'] = $fwDb->query($sql2);
}

//$sql3 = "SELECT distinct po_project_number from poincc3 order by po_project_number ";
$sql3 = "SELECT DISTINCT po_project_number AS project_number FROM poincc3
UNION
SELECT DISTINCT po_project_number2 FROM poincc3
UNION
SELECT DISTINCT po_project_number3 FROM poincc3
UNION
SELECT DISTINCT po_project_number4 FROM poincc3
UNION
SELECT DISTINCT po_project_number5 FROM poincc3
UNION
SELECT DISTINCT po_project_number6 FROM poincc3
UNION
SELECT DISTINCT po_project_number7 FROM poincc3
UNION
SELECT DISTINCT po_project_number8 FROM poincc3
UNION
SELECT DISTINCT po_project_number9 FROM poincc3
UNION
SELECT DISTINCT po_project_number10 FROM poincc3
ORDER BY project_number";
if ($sql3) {
	$fwViewData['projlist'] = $fwDb->query($sql3);
}

$sql4 = "SELECT distinct po_myobid from poincc3 order by po_myobid ";
if ($sql4) {
	$fwViewData['myobidlist'] = $fwDb->query($sql4);
}

$sql5 = "SELECT distinct po_type from poincc3 order by po_myobid ";
if ($sql5) {
	$fwViewData['typelist'] = $fwDb->query($sql5);
}

$sql6 = "SELECT  po_invoice_number  from poincc3 order by po_invoice_number  ";
if ($sql6) {
	$fwViewData['invoicelist'] = $fwDb->query($sql6);
}

$credits_response = get_credits();
$fwViewData['remainingCredits'] = number_format($credits_response->remainingCredits, 2);
$mergesub = $fwRequest->getParam('merge', '');

$assign_po_number = $fwRequest->getParam('assign_po_number', '');

$download_files_for_po_number = $fwRequest->getParam('download_files_for_po_number', '');
$merge__po_number_pdf = $fwRequest->getParam('merge__po_number_pdf', '');

$clear_database_for_PO_files = $fwRequest->getParam('clear_database_for_PO_files', '');
$download_all_files_as_zip = $fwRequest->getParam('download_all_files_as_zip', '');

/* insert record to cron jobs table start */

$startDownloadAndAssignPoNumber 	= $fwRequest->getParam('start_download_and_assign_po_number', '');
$fwViewData['cron_job_response'] 	= array('status' => '', 'message' => '');

if (!empty($startDownloadAndAssignPoNumber)) {
	
	$tableCronJobs 		= new Fw_Db_Table('cron_jobs');
	$tableCronJobs->setWhere("status in ('pending', 'in_progress') AND module = 'poincc3'");
	
	if($tableCronJobs->rowExists()) {
		$pendingJob 	= $tableCronJobs->getRow();
		$jobPayload 	= json_decode($pendingJob['payload']);
		$fwViewData['cron_job_response']['status'] 	= 'error';
		$fwViewData['cron_job_response']['message'] = 'A process is already in Queue. Please wait.';
		if($jobPayload->po_invoice_stage == $_SESSION['inv_stg']) {
			$fwViewData['cron_job_response']['message'] = 'Same process is already in Queue. Please wait.';
		}
	} else {
	
		$currentDateTime	= date('Y-m-d H:i:s');
		
		$insertCronJobData 	= [
			'module' => 'poincc3',
			'action' => 'download_files_and_assign_po_number',
			'status' => 'pending',
			'payload' => json_encode(array(
				'po_invoice_stage' => $_SESSION['inv_stg'],
				'po_inv_approver' => $_SESSION['search_by_approver']
				)),
			'created_at' => $currentDateTime,
			'updated_at' => $currentDateTime
		];
		
		$tableCronJobs->insertRow($insertCronJobData);
		$fwViewData['cron_job_response']['status'] 	= 'success';
		$fwViewData['cron_job_response']['message'] = 'Request for download files and assign PO numbers is initiated, <br/>Files will be ready to download once processing completed.';
	}
}

/* insert record to cron jobs table end */

if (!empty($clear_database_for_PO_files)) {
	$thisTable = new Fw_Db_Table("poincc3_merge_po_files");
	$thisTable->setWhere("`is_downloaded` = 'YES'");
	$thisTable->deleteRows();

	// loop through the files one by one
	$files_list = glob($_SERVER['DOCUMENT_ROOT'] . "/files/poincc3/po_files_list/*");
	foreach ($files_list as $file) {
		// check if is a file and not sub-directory
		if (is_file($file)) {
			// delete file
			unlink($file);
		}
	}
	//$fileName = 'po_pdf_list.zip';
	$fileName = 'poincc3_po_pdf_list_' . date("d-m-y") . '.zip';
	$zip_file_path = $_SERVER['DOCUMENT_ROOT'] . '/site/modules/poincc3/frontend/' . $fileName;
	if (is_file($zip_file_path)) {
		unlink($zip_file_path);
	}
}

$fetch_po_r = "SELECT SQL_CALC_FOUND_ROWS null as row_name, poincc3.* FROM poincc3  " . $where . " ORDER BY STR_TO_DATE(poincc3.po_invoice_date,'%d-%m-%Y') DESC";



//$lsql = $fwRequest->getParam('sql', '');  
$sqlmerge = stripslashes($fetch_po_r);

$data_to_assign_po = $fwDb->query($sqlmerge);
$fwViewData['total_files_for_po_records'] = count($data_to_assign_po);

if (!empty($download_files_for_po_number)) {
	/*$lsql = $fwRequest->getParam('sql', '');  $sqlmerge = stripslashes($lsql);
$data = $fwDb->query($sqlmerge);*/ // echo "<pre>";print_r($data); //exit;
	foreach ($data_to_assign_po as $k => $v) {

		$myFetchQ = "SELECT * FROM `poincc3_merge_po_files` WHERE `file_name` LIKE '" . $v['po_invoice_doc'] . "'";
		$data = $fwDb->query($myFetchQ);
		if (!empty($data) && count($data) > 0) {
			//echo "<br>data exists name ::".$v['po_invoice_doc'];
		} else {
			$folder_path = "files/purchase_order_invoice/";
			$source = fetch_file_raw_data2($folder_path, $v['po_invoice_doc']);
			if ($source) {
				//  shell_exec('gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile='."new_".$v['po_invoice_doc'].' '.$source);
				//	 exit("shell executed..");
				$insertData = ["file_name" => $v['po_invoice_doc'], "is_downloaded" => "YES"];
				$table_poincc3_merge_po_files->insertRow($insertData);
			}
		}
	}
}

if (!empty($download_all_files_as_zip)) {
	$zip = new ZipArchive;
	$fileName = 'poincc3_po_pdf_list_' . date("d-m-y") . '.zip';
	$zip->open($fileName, ZipArchive::CREATE);  //echo "<pre>"; print_r($files_list);
	$pathdir = $_SERVER['DOCUMENT_ROOT'] . "/files/poincc3/po_files_list/";
	$dir = opendir($pathdir);
	$file__list = readdir($dir); //echo "<pre>"; print_r($file__list); 
	echo (count(glob("$pathdir/*")) === 0) ? 'Empty' : 'Not empty';

	if (count(glob("$pathdir/*")) > 0) {
		/*while($file = readdir($dir)) { 
		if(is_file($pathdir.$file)) {   $zip -> addFile($pathdir.$file, $file);   } 
	}*/

		$myFetchQ = "SELECT * FROM `poincc3_merge_po_files` WHERE is_po_number_assigned='YES'";
		$data_21 = $fwDb->query($myFetchQ);
		if (!empty($data_21) && count($data_21) > 0) {
			// echo "<pre>";print_r($data_21); echo "</pre>";
			foreach ($data_21 as $key => $value) {
				$file = $value['file_name'];
				$zip->addFile($pathdir . $file, $file);
			}
		}

		$zip->close();
		$zip_file_path = $_SERVER['DOCUMENT_ROOT'] . '/site/modules/poincc3/frontend/' . $fileName;

		header($_SERVER['SERVER_PROTOCOL'] . ' 200 OK');
		header("Content-Type: application/zip");
		header("Content-Transfer-Encoding: Binary");
		header("Content-Length: " . filesize($zip_file_path));
		header("Content-Disposition:attachment;filename=\"" . basename($zip_file_path));

		while (ob_get_level()) {
			ob_end_clean();
		}
		readfile($zip_file_path);
		exit;
		ob_start();
	} else {
		$fwViewData['total_po_files_for_zip'] = "No file";
	}
}

if (!empty($assign_po_number)) {
	//$lsql = $fwRequest->getParam('sql', '');  
	$sqlmerge = stripslashes($fetch_po_r);
	$data = $fwDb->query($sqlmerge); // echo "<pre>";print_r($data); //exit;
	foreach ($data as $k => $v) {
		$myFetchQ = "SELECT * FROM `poincc3_merge_po_files` WHERE `file_name` LIKE '" . $v['po_invoice_doc'] . "' and is_po_number_assigned='NO'";
		$data_21 = $fwDb->query($myFetchQ);
		if (!empty($data_21) && count($data_21) > 0) {

			if (!empty($v['po_purchase_order_no'])) {
				$print_text = "HAVE PO  - " . $v['po_purchase_order_no'];
			} else {
				$print_text = "NO PO";
			}
			$source = $_SERVER['DOCUMENT_ROOT'] . '/files/poincc3/po_files_list/' . $v['po_invoice_doc'];
			$response = assign_po_number_to_pdf($v['po_invoice_doc'], $print_text);

			//  echo "<br> URL: " . $response -> url . "\n";       echo "<br> Page Count: " . $response -> pageCount . "\n"; 
			// echo "<br> Error: " . $response -> error . "\n";   echo "<br> Status: " . $response -> status . "\n"; 
			// echo "<br> Name: " . $response -> name ;
			if ($response->status == 200 || $response->status == "200") {
				file_put_contents($source, file_get_contents($response->url));
				$update_po_data = ['is_po_number_assigned' => "YES"];
				$tablerm = new Fw_Db_Table('poincc3_merge_po_files');
				$tablerm->setWhere("`file_name` LIKE '" . $v['po_invoice_doc'] . "' and is_po_number_assigned='NO'");
				$detail = $tablerm->updateRow($update_po_data);
			}
		} else {
			// echo "<br> PO number already assigned. ";
		}
		//	exit('<br> checking ...');

	}
	$fwViewData['po_number_assign_alert'] = 'true';
}

// COUNT TOTAL DOWNLOADED FILES
$myFetchQ = "SELECT * FROM `poincc3_merge_po_files` WHERE `is_downloaded` = 'YES'";
$data = $fwDb->query($myFetchQ);
$fwViewData['total_po_downloaded_files'] = count($data);

// COUNT TOTAL DOWNLOADED FILES having PO NUMBERS
$myFetchQ = "SELECT * FROM `poincc3_merge_po_files` WHERE `is_downloaded` = 'YES'  and is_po_number_assigned='YES' ";
$data = $fwDb->query($myFetchQ);
$fwViewData['total_po_number_files'] = count($data);

if (!empty($merge__po_number_pdf)) {
	require_once(MODULES_DIR . 'PDFMerger.php');
	$pdf = new PDFMerger;

	// add as many pdfs as you want
	/*$pdf_jurosh->addPDF('path/to/source/file.pdf', 'all', 'vertical')
->addPDF('path/to/source/file1.pdf', 'all')
->addPDF('path/to/source/file2.pdf', 'all', 'horizontal');*/
	$fn = "merged_poincc3_PO_MATCH" . "_" . $dt . ".pdf";
	$fn = "just_checking.pdf";
	//$lsql = $fwRequest->getParam('sql', '');  $sqlmerge = stripslashes($lsql);
	$sqlmerge = "SELECT * FROM `poincc3_merge_po_files`";
	$data = $fwDb->query($sqlmerge); // echo "<pre>";print_r($data); //exit;
	foreach ($data as $k => $v) {
		$po_pdf_newfile = $_SERVER['DOCUMENT_ROOT'] . '/download_files/' . $v['file_name'];
		if (file_exists($po_pdf_newfile)) {

			//$pdf_jurosh->addPDF($po_pdf_newfile, 'all', 'vertical');
			$pdf->addPDF($po_pdf_newfile);
			echo "<br> $k)" . $po_pdf_newfile . "   file size ::" . filesize($po_pdf_newfile);
		}
	}

	// call merge, output format `file`
	$pdf->merge('file', BASE_DIR . 'files/merged_poincc3/' . $fn);
	echo BASE_DIR . 'files/merged_poincc3/' . $fn;

	exit(" checking...");

	//	$pdf->merge('file',BASE_DIR.'files/merged_poincc3/'.$fn);	
	$fwViewData['download'] = 'true';
	$fwViewData['fn'] = $fn;
	$fwViewData['class6'] = 'style="background:#F00!important"';

	date_default_timezone_set('Australia/Melbourne');
	$mdetail['mi_file_name'] = $fn;
	$mdetail['mi_date_time'] = date('d-m-Y h:i A');
	$mdetail['mi_user'] = $_SESSION['user']['user_name'];
	//	$opr = $tableMi->insertRow($mdetail);
	exit("checking");
}

if (!empty($mergesub)) {
	$lsql = $fwRequest->getParam('sql', '');
	$detail = $fwRequest->getParam('docs', array());
	$fwViewData['wait'] = 'true';
	$fwViewData['download'] = 'true';
	require_once(MODULES_DIR . 'PDFMerger.php');
	$pdf = new PDFMerger;

	//$fn = "merged_poincc3.pdf";
	$fn = "merged_poincc3" . "_" . $dt . ".pdf";
	$fwViewData['download'] = 'false';
	$sqlmerge = stripslashes($lsql);
	$data = $fwDb->query($sqlmerge); //echo "<pre>";print_r($data); exit;
	foreach ($data as $k => $v) {

		// $docfile = BASE_DIR.'files/purchase_order_invoice/'.$v['po_invoice_doc'];
		$docfile = 'https://deckquote.s3.amazonaws.com/files/purchase_order_invoice/' . $v['po_invoice_doc'];
		$newfile = "new_" . $v['po_invoice_doc'];

		// $source = "https://deckquote.s3.amazonaws.com/files/purchase_order_invoice/".$v['po_invoice_doc'];
		$destination = BASE_DIR . FILE_PATH . "files/purchase_order_invoice/" . $v['po_invoice_doc'];
		$folder_path = "files/purchase_order_invoice/";
		$source = fetch_file_raw_data($folder_path, $v['po_invoice_doc']);
		copy($source, $destination);
		$docfile = BASE_DIR . 'files/purchase_order_invoice/' . $v['po_invoice_doc'];
		$newfile = "new_" . $v['po_invoice_doc'];

		shell_exec('gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=' . $newfile . ' ' . $docfile);

		rename($newfile, BASE_DIR . 'files/purchase_order_invoice/' . $newfile);
		$newfile3 = BASE_DIR . 'files/purchase_order_invoice/' . $newfile;

		$pdf->addPDF($newfile3);
	}
	$pdf->merge('file', BASE_DIR . 'files/merged_poincc3/' . $fn);
	$fwViewData['download'] = 'true';
	$fwViewData['fn'] = $fn;
	$fwViewData['class6'] = 'style="background:#F00!important"';

	date_default_timezone_set('Australia/Melbourne');
	$mdetail['mi_file_name'] = $fn;
	$mdetail['mi_date_time'] = date('d-m-Y h:i A');
	$mdetail['mi_user'] = $_SESSION['user']['user_name'];
	$opr = $tableMi->insertRow($mdetail);

	//remove all files from folder after pdf merge  
	$purchase_order_invoice = BASE_DIR . FILE_PATH . "files/purchase_order_invoice";
	deleteFiles($purchase_order_invoice);
}

//delete all files from folder 
function deleteFiles($dir)
{
	// loop through the files one by one
	foreach (glob($dir . '/*') as $file) {
		// check if is a file and not sub-directory
		if (is_file($file)) {
			// delete file
			unlink($file);
		}
	}
}


$sql4 = "select co_company_name from companies order by co_company_name";
$fwViewData['companydetail'] = $fwDb->query($sql4);


$sql2 = "select * from poincc3_invoice_stage";
$fwViewData['isdetail'] = $fwDb->query($sql2);

$sql_approver = "SELECT * FROM poincc3_invoice_approver";
$fwViewData['ipapprover'] = $fwDb->query($sql_approver);





// Export to Excel

$export = $fwRequest->getParam('export', 0);

if (!empty($export)) {
	require BASE_DIR . "PHPExcel/SimpleXLSXGen/SimpleXLSXGen.php";
	$my_excel_data = [];
	$title =  ['URN', 'Type', 'P Or NP', 'Project', 'Email Date', 'Invoice No', 'Supplier', 'Invoice Date', 'Invoice Due Date', 'Invoice Value', 'US Invoice Value', 'Invoice Stage', 'MYOBID', 'PO Number', 'Value of PO', 'Chart of Acc'];
	array_push($my_excel_data, $title);

	//foreach($setdata as $k=>$v)
	foreach ($expdata as $k => $v) {
		$sqlis = "select is_option from poincc3_invoice_stage where is_id = " . $v['po_invoice_stage'];
		$isdata = $fwDb->queryOne($sqlis);
		$is = $isdata['is_option'] . "\n" . $v['po_inv_stage_user'] . "-" . $v['po_inv_stage_date'];
		$setdata[$k]['invoice_stage'] = $is;
		$values =	[
			$v['po_urn'],
			$v['po_type'],
			$v['po_pornp'],
			$v['po_project_number'],
			$v['po_email_date'],
			$v['po_invoice_number'],
			$v['po_supplier'],
			$v['po_invoice_date'],
			$v['po_invoice_due_date'],
			$v['po_invoice_value'],
			$v['po_us_invoice_value'],
			$is,
			$v['po_myobid'],
			$v['po_purchase_order_no'],
			$v['po_po_value'],
			$v['po_chartof_acc']
		];
		array_push($my_excel_data, $values);
	}
	$xlsx = Shuchkin\SimpleXLSXGen::fromArray($my_excel_data)->downloadAs('poincc3_file.xlsx');;
	// echo "<pre>"; print_r($my_excel_data);
	exit();

	require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";
	//require BASE_DIR . "PHPExcel/Classes/PHPExcel/Writer/Excel2007.php";

	// Create new PHPExcel object
	$objPHPExcel = new PHPExcel();

	// Set document properties
	$objPHPExcel->getProperties()->setCreator("Deckquotes")
		->setLastModifiedBy("Nick C")
		->setTitle("Office 2007 XLSX Test Document")
		->setSubject("Office 2007 XLSX Test Document")
		->setDescription("Poincc 2 exported to Office 2007 XLSX.")
		->setKeywords("office 2007 openxml php")
		->setCategory("Purchase orders and invoice clearing centre");


	$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);
	$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(30);
	$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('J')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('L')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('M')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('N')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('O')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('P')->setAutoSize(true);


	//Add some data
	$objPHPExcel->setActiveSheetIndex(0)
		->setCellValue('A1', 'URN')
		->setCellValue('B1', 'Type')
		->setCellValue('C1', 'P Or NP')
		->setCellValue('D1', 'Project')
		->setCellValue('E1', 'Email Date')
		->setCellValue('F1', 'Invoice No')
		->setCellValue('G1', 'Supplier')
		->setCellValue('H1', 'Invoice Date')
		->setCellValue('I1', 'Invoice Due Date')
		->setCellValue('J1', 'Invoice Value')
		->setCellValue('K1', 'US Invoice Value')
		->setCellValue('L1', 'Invoice Stage')
		->setCellValue('M1', 'MYOBID')
		->setCellValue('N1', 'PO Number')
		->setCellValue('O1', 'Value of PO')
		->setCellValue('P1', 'Chart of Acc')
	;

	$from = "A1"; // or any value
	$to = "T1"; // or any value
	$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold(true);

	$row = 2;
	$sr = 1;
	foreach ($setdata as $k => $v) {


		$sqlis = "select is_option from poincc3_invoice_stage where is_id = " . $v['po_invoice_stage'];
		$isdata = $fwDb->queryOne($sqlis);

		$is = $isdata['is_option'];

		$objPHPExcel->getActiveSheet()
			->setCellValue('A' . $row, $v['po_urn'])
			->setCellValue('B' . $row, $v['po_type'])
			->setCellValue('C' . $row, $v['po_pornp'])
			->setCellValue('D' . $row, $v['po_project_number'])
			->setCellValue('E' . $row, $v['po_email_date'])
			->setCellValue('F' . $row, $v['po_invoice_number'])
			->setCellValue('G' . $row, $v['po_supplier'])
			->setCellValue('H' . $row, $v['po_invoice_date'])
			->setCellValue('I' . $row, $v['po_invoice_due_date'])
			->setCellValue('J' . $row, $v['po_invoice_value'])
			->setCellValue('K' . $row, $v['po_us_invoice_value'])
			->setCellValue('L' . $row, $is)
			->setCellValue('M' . $row, $v['po_myobid'])
			->setCellValue('N' . $row, $v['po_purchase_order_no'])
			->setCellValue('O' . $row, $v['po_po_value'])
			->setCellValue('P' . $row, $v['po_chartof_acc'])
		;

		$row = $row + 1;
		$sr = $sr + 1;
	}

	// Rename worksheet
	$objPHPExcel->getActiveSheet()->setTitle('Poincc 2');

	// Set active sheet index to the first sheet, so Excel opens this as the first sheet
	$objPHPExcel->setActiveSheetIndex(0);

	header('Content-Type: application/vnd.ms-excel');
	header('Content-Disposition: attachment;filename="poincc3.xls"');
	header('Cache-Control: max-age=0');
	// If you're serving to IE 9, then the following may be needed
	header('Cache-Control: max-age=1');

	// If you're serving to IE over SSL, then the following may be needed
	header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
	header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
	header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
	header('Pragma: public'); // HTTP/1.0

	$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
	$objWriter->save('php://output');
	exit;
}
