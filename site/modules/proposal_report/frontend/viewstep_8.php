<?php
$fwMainView = 'file:' . getcwd() . '/viewstep_8.tpl';
$bsn_id = $fwRequest->getParam('bsn_id', '');
$pcn = $fwRequest->getParam('pcn', '');

$sql2 = "SELECT document_check_list_mini. doc_date_uploaded 
	FROM document_check_list_mini
	WHERE document_check_list_mini.doc_name_id = 2
	AND document_check_list_mini.doc_checklist_number = " .$pcn . " and document_check_list_mini.doc_bsn_id = ".$bsn_id;
				 
$data2 = $fwDb->queryOne($sql2);

$fwViewData['data2'] =  changedate_d_m_y($data2['doc_date_uploaded']);

$sql8 = "SELECT document_check_list_mini. doc_date_uploaded 
	FROM document_check_list_mini
	WHERE document_check_list_mini.doc_name_id = 8
	AND document_check_list_mini.doc_checklist_number = " .$pcn . " and document_check_list_mini.doc_bsn_id = ".$bsn_id;
				 
$data8 = $fwDb->queryOne($sql8);

$fwViewData['data8'] =  changedate_d_m_y($data8['doc_date_uploaded']);

//
$sql = "SELECT dpn_unique_id, dpn_render_due_dt8 from document_proposal_name where dpn_proposal_number = " .$pcn . " and dpn_bsn_id = ".$bsn_id;
$data_a8 = $fwDb->queryOne($sql);
$fwViewData['dpn_unique_id'] = $data_a8['dpn_unique_id'];
$fwViewData['dpn_render_due_dt8'] = $data_a8['dpn_render_due_dt8'];