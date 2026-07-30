<?php

$id = $fwRequest->getParam('np_id', '');
$value = $fwRequest->getparam('value', '');

if(!empty($id))
{
	$sql = "Update net_position_report set  np_asset  = '".$value."' where np_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
}


 exit;