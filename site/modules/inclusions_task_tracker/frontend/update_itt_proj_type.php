<?php

$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');

if(!empty($id))
{
	$sql1 = "Update business set bsn_itt_proj_type = ".$value." where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql1);	
}

 exit;