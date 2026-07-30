<?php
$fwMainView = 'file:' . getcwd() . '/viewstep_31.tpl';
$bsn_id = $fwRequest->getParam('bsn_id', '');
$pcn = $fwRequest->getParam('pcn', '');

$sql5 = "SELECT document_check_list_mini. doc_date_uploaded 
	FROM document_check_list_mini
	WHERE document_check_list_mini.doc_name_id = 5
	AND document_check_list_mini.doc_checklist_number = " .$pcn . " and document_check_list_mini.doc_bsn_id = ".$bsn_id;
				 
$data5 = $fwDb->queryOne($sql5);

$fwViewData['data5'] =  changedate_d_m_y($data5['doc_date_uploaded']);

$sql37 = "SELECT document_check_list_mini. doc_date_uploaded 
	FROM document_check_list_mini
	WHERE document_check_list_mini.doc_name_id = 37
	AND document_check_list_mini.doc_checklist_number = " .$pcn . " and document_check_list_mini.doc_bsn_id = ".$bsn_id;
				 
$data37 = $fwDb->queryOne($sql37);

$fwViewData['data37'] =  changedate_d_m_y($data37['doc_date_uploaded']);


$sql31 = "SELECT document_check_list_mini. doc_date_uploaded 
	FROM document_check_list_mini
	WHERE document_check_list_mini.doc_name_id = 31
	AND document_check_list_mini.doc_checklist_number = " .$pcn . " and document_check_list_mini.doc_bsn_id = ".$bsn_id;
				 
$data31 = $fwDb->queryOne($sql31);

$fwViewData['data31'] =  changedate_d_m_y($data31['doc_date_uploaded']);

