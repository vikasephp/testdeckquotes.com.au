<?php

$id = $fwRequest->getParam('np_id', '');
$value = $fwRequest->getparam('value', '');

if(!empty($id))
{
		
	$sql_1 = "Update new_product_report set  np_progress  = ".$value." where np_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
}



 exit;