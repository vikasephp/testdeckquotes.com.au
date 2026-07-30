<?php

$ar_id = $fwRequest->getParam('ar_id', '');

$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status_date from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id";
		
$fwViewData['projdetail2'] = $fwDb->query($sql);

$psubmit = $fwRequest->getParam('psub', '');
if(!empty($psubmit)) {
	
	$prda = $fwRequest->getParam('projname1', 0);

	$s = explode('|',$prda);
	$pid = $s[0];
	$su  = $s[1];
	//$su = str_replace('Customer Granny Flat -','',$su);
    //db($su);
	$fwViewData['pid'] = $pid;
	$fwViewData['project'] = $su;
	
	$docsql = "select document_check_list.*, admin_document_check_list.*  from document_check_list 
			   Inner join admin_document_check_list on document_check_list.doc_name_id = admin_document_check_list.admin_doc_id
			   where document_check_list.doc_bsn_id =  ".$pid . " and substr( document_check_list.doc_file_name , -3 ) = 'pdf' " ;
	
	$fwViewData['docdata'] =  $fwDb->query($docsql);			
	
	$docsql_p = "select document_check_list_mini.*, admin_document_check_list_mini.*, document_proposal_name.dpn_unique_id from document_check_list_mini 
			   Inner join admin_document_check_list_mini on document_check_list_mini.doc_name_id = admin_document_check_list_mini.admin_doc_id
			   Inner join document_proposal_name On document_check_list_mini.doc_checklist_number = document_proposal_name.dpn_proposal_number AND document_proposal_name.dpn_bsn_id = ".$pid . "
			   where document_check_list_mini.doc_bsn_id =  ".$pid . " and substr( document_check_list_mini.doc_file_name , -3 ) = 'pdf' " ;
	
	$fwViewData['docdata_p'] =  $fwDb->query($docsql_p);
	
	$docsql_f = "select business_documents_finance.* from business_documents_finance
			   where business_documents_finance.bd_bsi_id =  ".$pid . " and substr( business_documents_finance.bd_doc_name , -3 ) = 'pdf' " ;
	
	$fwViewData['docdata_f'] =  $fwDb->query($docsql_f);
	
	$docsql_c = "select business_documents.* from business_documents
			   where business_documents.bd_bsi_id =  ".$pid . " and substr( business_documents.bd_doc_name , -3 ) = 'pdf' " ;
	
	$fwViewData['docdata_c'] =  $fwDb->query($docsql_c);
	
}

$fwViewData['title'] = "Merge Report";

$docsubmit = $fwRequest->getParam('test', '');

if(!empty($docsubmit))
{
  $detail = $fwRequest->getParam('doc', array());
  $detail2 = $fwRequest->getParam('doc2', array());
  $id= $fwRequest->getParam('id', 0);
  
  //db($fwViewData['pid']);
  //db($detail);
  //db($detail2);
  //exit;
 
  $html = '';
  $i=1;
  foreach($detail as $k => $v)
  {
		
	$docsql = "select document_check_list.*, admin_document_check_list.* from document_check_list 
			   Inner join admin_document_check_list on document_check_list.doc_name_id = admin_document_check_list.admin_doc_id
			   where document_check_list.doc_bsn_id =  ".$id . " and document_check_list.doc_id = " .$k  ;
	
    $data = $fwDb->queryOne($docsql);

	$docdetail[$k]['admin_doc_name'] = $data['admin_doc_name'];
	$docdetail[$k]['doc_file_name'] = $data['doc_file_name'];
	$docdetail[$k]['type'] = 'documentchecklist';
  }
  
  foreach($detail2 as $k => $v)
  {
		
	$docsql_p = "select document_check_list_mini.*, admin_document_check_list_mini.*, document_proposal_name.dpn_unique_id from document_check_list_mini 
			   Inner join admin_document_check_list_mini on document_check_list_mini.doc_name_id = admin_document_check_list_mini.admin_doc_id
			   Inner join document_proposal_name On document_check_list_mini.doc_checklist_number = document_proposal_name.dpn_proposal_number AND document_proposal_name.dpn_bsn_id = ".$id . "
			   where document_check_list_mini.doc_bsn_id =  ".$id . " and document_check_list_mini.doc_id = " .$k ;
	
    $data2 = $fwDb->queryOne($docsql_p);

	$docdetail[$k]['admin_doc_name'] = $data2['admin_doc_name'];
	$docdetail[$k]['doc_file_name'] = $data2['doc_file_name'];
	$docdetail[$k]['type'] = 'proposalchecklist';
  }
  
  
  $fwViewData['docdetail'] =  $docdetail;
 // db($fwViewData['docdetail']);
}


$submitdoc = $fwRequest->getParam('submitdoc', '');
if(!empty($submitdoc))
{
	$detail = $fwRequest->getParam('docs', array());
	
				//error_reporting(E_ALL ^ E_NOTICE);
				//ini_set('display_errors', 'Off');
	
	require_once(MODULES_DIR . 'PDFMerger.php');
	$pdf = new PDFMerger;;
	
	$fn = "ephp5.pdf";
	
	db(BASE_DIR);
	

	foreach($detail as $k => $v)
	{
		foreach($v as $k1=>$v1)
		{
			
			//db($v1 . $k1 );	
			if($k1 == 'documentchecklist')
			{
				$sql_1 = "Select document_check_list.doc_file_name from document_check_list  where document_check_list.doc_id = ". $k;
				$data1 = $fwDb->queryOne($sql_1);
				db($data1);
				//db($sql_1);
			}
			elseif($k1 == 'proposalchecklist')
			{
				$sql_1 = "Select document_check_list_mini.doc_file_name from document_check_list_mini where document_check_list_mini.doc_id = ". $k;
				$data1 = $fwDb->queryOne($sql_1);
				db($data1);
				//db($sql_2);
			}
			$docfile = BASE_DIR.'files/document_check_list_files/'.$data1['doc_file_name'];
					
			
			//$newfile = BASE_DIR.'files/document_check_list_files/'."new_".$data1['doc_file_name'];
			$newfile = "new_".$data1['doc_file_name'];
			shell_exec('gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -sOutputFile='.$newfile.' '.$docfile);	
			//shell_exec('gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -o '.$newfile.''. $docfile. "'");	
			sleep(5);
			
			rename($newfile, BASE_DIR.'files/merged/'.$newfile);
			sleep(5);
			
			$newfile2 = BASE_DIR.'files/merged/'.$newfile;
			//$pdf->addPDF($docfile);
			$pdf->addPDF($newfile2);
			
		}
	}
	//shell_exec('gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile="new.pdf" "old.pdf"');
	//shell_exec( "gswin32 -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=".$new_pdf." ".$old_pdf."");
	
	
	
	
   $pdf->merge('file',BASE_DIR.'files/merged/'.$fn);	
   //$pdf->merge('file','/home/admin3/public_html/ephp/'.$fn);
	

	
	
}