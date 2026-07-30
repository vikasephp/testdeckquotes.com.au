<?php
$fwMainView = 'file:' . getcwd() . '/view_downloads.tpl';

$bsn_id = $fwRequest->getParam('bsn_id', 0);
$dpn_unique_id = $fwRequest->getParam('dpn_unique_id', 0);

	$sql= "SELECT document_check_list_mini.doc_file_name, document_check_list_mini.doc_name_id, document_proposal_name.dpn_unique_id
				FROM document_check_list_mini
				INNER JOIN document_proposal_name ON document_check_list_mini.doc_bsn_id = document_proposal_name.dpn_bsn_id
				WHERE document_check_list_mini.doc_name_id In (31, 10, 144, 38, 110)
				AND document_proposal_name.dpn_bsn_id =  " .$bsn_id . "
				AND document_proposal_name.dpn_unique_id =" .$dpn_unique_id;
				 
		$data = $fwDb->query($sql);

					
$fwViewData['doc_data'] = $data;

$fwViewData['title'] = 'Downloads Documents';
