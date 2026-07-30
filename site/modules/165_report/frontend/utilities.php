<?php
$fwMainView = 'file:' . getcwd() . '/utilities.tpl';
$os_id = (int)$fwRequest->getParam('os_id', 0);
$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);


	$sql_627 = "Select doc_file_name from document_check_list where  doc_bsn_id  = ". $bsn_id. " And doc_name_id = 627 ";
	$data627 = $fwDb->queryOne($sql_627);
    $fwViewData['link_627'] = $data627['doc_file_name'];

    $sql_629 = "Select doc_file_name from document_check_list where  doc_bsn_id  = ". $bsn_id. " And doc_name_id = 629 ";
	$data629 = $fwDb->queryOne($sql_629);
    $fwViewData['link_629'] = $data629['doc_file_name'];
	
	$sql_628 = "Select doc_file_name from document_check_list where  doc_bsn_id  = ". $bsn_id. " And doc_name_id = 628 ";
	$data628 = $fwDb->queryOne($sql_628);
    $fwViewData['link_628'] = $data628['doc_file_name'];

    $sql_630 = "Select doc_file_name from document_check_list where  doc_bsn_id  = ". $bsn_id. " And doc_name_id = 630 ";
	$data630 = $fwDb->queryOne($sql_630);
    $fwViewData['link_630'] = $data630['doc_file_name'];

    $sql = "Select os_icon_water , os_evo_gas , os_evo_energy , os_storm_water from 165_report where os_id = ".$os_id;
	$data = $fwDb->queryOne($sql);
   
   

$fwViewData['os_id'] = $os_id;
$fwViewData['data'] = $data; 
