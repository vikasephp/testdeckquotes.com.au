<?php
$fwMainView = 'file:' . getcwd() . '/viewstep_62.tpl';
$bsn_id = $fwRequest->getParam('bsn_id', '');
$pcn = $fwRequest->getParam('pcn', '');

$sql90 = "SELECT document_check_list_mini. doc_date_uploaded 
	FROM document_check_list_mini
	WHERE document_check_list_mini.doc_name_id = 90
	AND document_check_list_mini.doc_checklist_number = " .$pcn . " and document_check_list_mini.doc_bsn_id = ".$bsn_id;
				 
$data90 = $fwDb->queryOne($sq90);

$fwViewData['data90'] =  changedate_d_m_y($data90['doc_date_uploaded']);

$sql8 = "SELECT document_check_list_mini. doc_date_uploaded 
	FROM document_check_list_mini
	WHERE document_check_list_mini.doc_name_id = 8
	AND document_check_list_mini.doc_checklist_number = " .$pcn . " and document_check_list_mini.doc_bsn_id = ".$bsn_id;
				 
$data8 = $fwDb->queryOne($sql8);

$fwViewData['data8'] =  changedate_d_m_y($data8['doc_date_uploaded']);

//
$sql_62 = "SELECT dpn_unique_id, dpn_render_due_dt62 from document_proposal_name where dpn_proposal_number = " .$pcn . " and dpn_bsn_id = ".$bsn_id;
$data_a62 = $fwDb->queryOne($sql_62);
$fwViewData['dpn_unique_id'] = $data_a62['dpn_unique_id'];
$fwViewData['dpn_render_due_dt62'] = $data_a62['dpn_render_due_dt62'];