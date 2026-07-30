<?php
require_once(MODULES_DIR . 'PDFMerger.php');

use PDFMerger\PDFMerger;


$ar_id = $fwRequest->getParam('ar_id', '');

$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status_date from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id";

$fwViewData['projdetail2'] = $fwDb->query($sql);

$fwViewData['pbox'] = 'true';
$fwViewData['download'] = 'false';

$psubmit = $fwRequest->getParam('psub', '');
if (!empty($psubmit)) {

	$prda = $fwRequest->getParam('projname1', 0);

	$s = explode('|', $prda);
	$pid = $s[0];
	$su  = $s[1];

	$fwViewData['pid'] = $pid;
	$fwViewData['project'] = $su;
	$_SESSION['project'] = $su;

	$docsql = "select document_check_list.*, admin_document_check_list.*  from document_check_list 
			   Inner join admin_document_check_list on document_check_list.doc_name_id = admin_document_check_list.admin_doc_id
			   where document_check_list.doc_bsn_id =  " . $pid . " and substr( document_check_list.doc_file_name , -3 ) = 'pdf' ";

	$fwViewData['docdata'] =  $fwDb->query($docsql);

	$docsql_p = "select document_check_list_mini.*, admin_document_check_list_mini.*, document_proposal_name.dpn_unique_id 
	from document_check_list_mini 
	Inner join admin_document_check_list_mini on document_check_list_mini.doc_name_id =  admin_document_check_list_mini.admin_doc_id
	Inner join document_proposal_name On document_check_list_mini.doc_checklist_number = document_proposal_name.dpn_proposal_number
    AND document_proposal_name.dpn_bsn_id = " . $pid . "
			   where document_check_list_mini.doc_bsn_id =  " . $pid . " and substr( document_check_list_mini.doc_file_name , -3 ) = 'pdf' ";

	$fwViewData['docdata_p'] =  $fwDb->query($docsql_p);

	$docsql_f = "select business_documents_finance.* from business_documents_finance
		     where business_documents_finance.bd_bsi_id =  " . $pid . " and substr( business_documents_finance.bd_doc_name , -3 ) = 'pdf' ";

	$fwViewData['docdata_f'] =  $fwDb->query($docsql_f);

	$docsql_c = "select business_documents.* from business_documents
			     where business_documents.bd_bsi_id =  " . $pid . " and substr( business_documents.bd_doc_name , -3 ) = 'pdf' ";

	$fwViewData['docdata_c'] =  $fwDb->query($docsql_c);
}

$fwViewData['title'] = "Merge Report";

$docsubmit = $fwRequest->getParam('test', '');

if (!empty($docsubmit)) {
	$detail = $fwRequest->getParam('doc', array());
	$detail2 = $fwRequest->getParam('doc2', array());
	$detail3 = $fwRequest->getParam('doc3', array());
	$detail4 = $fwRequest->getParam('doc4', array());
	$id = $fwRequest->getParam('id', 0);
	$fwViewData['pid'] = $id;
	$fwViewData['pbox'] = 'false';
	$fwViewData['project'] = $_SESSION['project'];
	$html = '';
	$i = 1;
	foreach ($detail as $k => $v) {

		$docsql = "select document_check_list.*, admin_document_check_list.* from document_check_list 
			   Inner join admin_document_check_list on document_check_list.doc_name_id = admin_document_check_list.admin_doc_id
			   where document_check_list.doc_bsn_id =  " . $id . " and document_check_list.doc_id = " . $k;

		$data = $fwDb->queryOne($docsql);

		$docdetail[$k]['admin_doc_name'] = $data['admin_doc_name'];
		$docdetail[$k]['doc_file_name'] = $data['doc_file_name'];
		$docdetail[$k]['type'] = 'documentchecklist';
	}

	foreach ($detail2 as $k => $v) {

		$docsql_p = "select document_check_list_mini.*, admin_document_check_list_mini.*, document_proposal_name.dpn_unique_id from document_check_list_mini 
			   Inner join admin_document_check_list_mini on document_check_list_mini.doc_name_id = admin_document_check_list_mini.admin_doc_id
			   Inner join document_proposal_name On document_check_list_mini.doc_checklist_number = document_proposal_name.dpn_proposal_number AND document_proposal_name.dpn_bsn_id = " . $id . "
			   where document_check_list_mini.doc_bsn_id =  " . $id . " and document_check_list_mini.doc_id = " . $k;

		$data2 = $fwDb->queryOne($docsql_p);

		$docdetail[$k]['admin_doc_name'] = $data2['admin_doc_name'];
		$docdetail[$k]['doc_file_name'] = $data2['doc_file_name'];
		$docdetail[$k]['type'] = 'proposalchecklist';
	}


	foreach ($detail3 as $k => $v) {
		$docsql_f = "select business_documents_finance.* from business_documents_finance
			   where business_documents_finance.bd_bsi_id =  " . $id . " and business_documents_finance.bd_id = " . $k;
		$data3 = $fwDb->queryOne($docsql_f);

		$docdetail[$k]['admin_doc_name'] = $data3['bd_type'];
		$docdetail[$k]['doc_file_name'] = $data3['bd_doc_name'];
		$docdetail[$k]['type'] = 'financial';
	}

	foreach ($detail4 as $k => $v) {
		$docsql_c = "select business_documents.* from business_documents
			   where business_documents.bd_bsi_id =  " . $id . " and business_documents.bd_id = " . $k;
		$data4 = $fwDb->queryOne($docsql_c);

		$docdetail[$k]['admin_doc_name'] = $data4['bd_type'];
		$docdetail[$k]['doc_file_name'] = $data4['bd_doc_name'];
		$docdetail[$k]['type'] = 'Custom';
	}

	$fwViewData['docdetail'] =  $docdetail;
}


$submitdoc = $fwRequest->getParam('submitdoc', '');
if (!empty($submitdoc)) {
	$detail = $fwRequest->getParam('docs', array());
	$fwViewData['wait'] = 'true';

	$fwViewData['download'] = 'true';
	//echo MODULES_DIR . 'PDFMerger.php'; exit;
	/*	require_once(MODULES_DIR . 'PDFMerger.php');
	
	use PDFMerger\PDFMerger;
   */
	$pdf = new PDFMerger;

	$user_id = $_SESSION['user']['user_id'];

	//$fn = "merged_report.pdf";

	$fn = "merged_report_" . $user_id . ".pdf";
	$fwViewData['download'] = 'false';

	if (!is_dir(BASE_DIR . 'files/merged/')) {
		mkdir(BASE_DIR . 'files/merged/', 0777, TRUE);
	}

	foreach ($detail as $k => $v) {
		foreach ($v as $k1 => $v1) {

			if ($k1 == 'documentchecklist') {
				$sql_1 = "Select document_check_list.doc_file_name from document_check_list  where document_check_list.doc_id = " . $k;
				$data1 = $fwDb->queryOne($sql_1);

				if (!is_dir(BASE_DIR . FILE_PATH . 'files/document_check_list_files/')) {
					mkdir(BASE_DIR . FILE_PATH . 'files/document_check_list_files/', 0777, TRUE);
				}


				if (!empty($data1['doc_file_name'])) {
					$destination = BASE_DIR . FILE_PATH . "files/document_check_list_files/" . $data1['doc_file_name'];
					$folder_path = "files/document_check_list_files/";
					$source = get_file_raw_data($folder_path, $data1['doc_file_name']);
					copy($source, $destination);

					$docfile = BASE_DIR . 'files/document_check_list_files/' . $data1['doc_file_name'];
					$newfile = "new_" . $data1['doc_file_name'];
				}
			} elseif ($k1 == 'proposalchecklist') {
				$sql_1 = "Select document_check_list_mini.doc_file_name from document_check_list_mini where document_check_list_mini.doc_id = " . $k;
				$data1 = $fwDb->queryOne($sql_1);

				if (!is_dir(BASE_DIR . FILE_PATH . 'files/document_check_list_files/')) {
					mkdir(BASE_DIR . FILE_PATH . 'files/document_check_list_files/', 0777, TRUE);
				}

				//	$source = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/".$data1['doc_file_name'];
				$destination = BASE_DIR . FILE_PATH . "files/document_check_list_files/" . $data1['doc_file_name'];

				$folder_path = "files/document_check_list_files/";
				$source = get_file_raw_data($folder_path, $data1['doc_file_name']);
				copy($source, $destination);

				$docfile = BASE_DIR . 'files/document_check_list_files/' . $data1['doc_file_name'];
				$newfile = "new_" . $data1['doc_file_name'];
			} elseif ($k1 == 'financial') {
				$sql_1 = "Select business_documents_finance.bd_doc_name from business_documents_finance where business_documents_finance.bd_id = " . $k;
				$data1 = $fwDb->queryOne($sql_1);

				if (!is_dir(BASE_DIR . 'files/business_documents/')) {
					mkdir(BASE_DIR . 'files/business_documents/', 0777, TRUE);
				}

				$docfile = BASE_DIR . 'files/business_documents/' . $data1['bd_doc_name'];
				$newfile = "new_" . $data1['bd_doc_name'];
				//db($data1);
			}

			//$docfile = BASE_DIR.'files/document_check_list_files/'.$data1['doc_file_name'];
			//$newfile = BASE_DIR.'files/document_check_list_files/'."new_".$data1['doc_file_name'];
			//$newfile = "new_".$data1['doc_file_name'];
			$command = 'gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=' . $newfile . ' ' . $docfile;
			$exec = shell_exec($command);
			// var_dump($exec);
			// exit;
			//sleep(1);

			rename($newfile, BASE_DIR . 'files/merged/' . $newfile);
			//sleep(1);

			$newfile2 = BASE_DIR . 'files/merged/' . $newfile;
			//$pdf->addPDF($docfile);
			$pdf->addPDF($newfile2);
		}
	}

	$pdf->merge('file', BASE_DIR . 'files/merged/' . $fn);
	//$pdf->merge('file','/home/admin3/public_html/ephp/'.$fn);
	$fwViewData['download'] = 'true';
	$fwViewData['fn'] = $fn;
}

$tablebuttons = new Fw_Db_Table('merge_report_buttons');
$fwViewData['buttons'] = $tablebuttons->getRows();
