<?php

$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');



if(!empty($id))
{
	//$sql = "Update construction_scheduler_report set  cs_comm_notice  = ".$value_1." where cs_id = ".$id;	 
	//$fwDb -> queryOne($sql);
	
	
	$sql = "Update document_check_list set doc_not_required  = ".$value. " where doc_bsn_id = " .$id ." and doc_name_id = 653 ";
	$fwDb -> queryOne($sql);
}




 exit;