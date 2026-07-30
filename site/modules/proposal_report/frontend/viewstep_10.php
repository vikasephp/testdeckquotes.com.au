<?php
$fwMainView = 'file:' . getcwd() . '/viewstep_10.tpl';
$bsn_id = $fwRequest->getParam('bsn_id', '');
$pcn = $fwRequest->getParam('pcn', '');

$sql36 = "SELECT document_check_list_mini. doc_date_uploaded 
	FROM document_check_list_mini
	WHERE document_check_list_mini.doc_name_id = 36
	AND document_check_list_mini.doc_checklist_number = " .$pcn . " and document_check_list_mini.doc_bsn_id = ".$bsn_id;
				 
$data36 = $fwDb->queryOne($sql36);
$fwViewData['data36'] =  changedate_d_m_y($data36['doc_date_uploaded']);

$sql40 = "SELECT document_check_list_mini. doc_date_uploaded 
	FROM document_check_list_mini
	WHERE document_check_list_mini.doc_name_id = 40
	AND document_check_list_mini.doc_checklist_number = " .$pcn . " and document_check_list_mini.doc_bsn_id = ".$bsn_id;
$data40 = $fwDb->queryOne($sql40);
$fwViewData['data40'] =  changedate_d_m_y($data40['doc_date_uploaded']);


$sql6 = "SELECT document_check_list_mini. doc_date_uploaded 
	FROM document_check_list_mini
	WHERE document_check_list_mini.doc_name_id = 6
	AND document_check_list_mini.doc_checklist_number = " .$pcn . " and document_check_list_mini.doc_bsn_id = ".$bsn_id;
				 
$data6 = $fwDb->queryOne($sql6);
$fwViewData['data6'] =  changedate_d_m_y($data6['doc_date_uploaded']);

$sql7 = "SELECT document_check_list_mini. doc_date_uploaded 
	FROM document_check_list_mini
	WHERE document_check_list_mini.doc_name_id = 7
	AND document_check_list_mini.doc_checklist_number = " .$pcn . " and document_check_list_mini.doc_bsn_id = ".$bsn_id;
				 
$data7 = $fwDb->queryOne($sql7);
$fwViewData['data7'] =  changedate_d_m_y($data7['doc_date_uploaded']);

$sql10 = "SELECT document_check_list_mini. doc_date_uploaded 
	FROM document_check_list_mini
	WHERE document_check_list_mini.doc_name_id = 10
	AND document_check_list_mini.doc_checklist_number = " .$pcn . " and document_check_list_mini.doc_bsn_id = ".$bsn_id;
				 
$data10 = $fwDb->queryOne($sql10);
$fwViewData['data10'] =  changedate_d_m_y($data10['doc_date_uploaded']);

