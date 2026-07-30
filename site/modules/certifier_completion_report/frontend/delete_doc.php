<?php
$bsn_id_683 = (int)$fwRequest->getparamget('bsn_id_683', 0);
$bsn_id_663 = (int)$fwRequest->getparamget('bsn_id_663', 0);
$bsn_id_699 = (int)$fwRequest->getparamget('bsn_id_699', 0);
$thisTable = new Fw_Db_Table('document_check_list');

if(!empty($bsn_id_683))
{
    
    $thisTable->setWhere("doc_bsn_id = ".$bsn_id_683. " and doc_name_id = 683");
    $pData['doc_date_uploaded'] = "0000-00-00 00:00:00";
	$pData['doc_file_name'] = '';
	$pData['doc_user_name'] = 0;
    $thisTable->updateRow($pData);		
}

if(!empty($bsn_id_663))
{
    
    $thisTable->setWhere("doc_bsn_id = ".$bsn_id_663. " and doc_name_id = 663");
    $fsData['doc_date_uploaded'] = "0000-00-00 00:00:00";
	$fsData['doc_file_name'] = '';
	$fsData['doc_user_name'] = 0;
    $thisTable->updateRow($fsData);		
}

if(!empty($bsn_id_699))
{
    
    $thisTable->setWhere("doc_bsn_id = ".$bsn_id_699. " and doc_name_id = 699");
    $finalData['doc_date_uploaded'] = "0000-00-00 00:00:00";
	$finalData['doc_file_name'] = '';
	$finalData['doc_user_name'] = 0;
    $thisTable->updateRow($finalData);		
}


Location(BASE_URL . 'certifier_completion_report.home');
exit;