<?php


$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($id))
{
	$sql = "Update business set  bsn_ccf_app_date  = '".$value."' where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	
}

 exit;