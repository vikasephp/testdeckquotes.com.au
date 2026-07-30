<?php


$id = $fwRequest->getParam('pst_id', '');
$value = $fwRequest->getparam('value', '');

if(!empty($id))
{
	$sql =  "Update ptt_sub_type set  pst_ave_days  = ".$value." where pst_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	
}



 exit;