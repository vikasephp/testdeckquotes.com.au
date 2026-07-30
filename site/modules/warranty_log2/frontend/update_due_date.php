<?php

$id = $fwRequest->getParam('ch_id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20',' ',$value);


if(!empty($value))
{
	$sql_1 = "Update warranty_checklist set  ch_due_date  = '".$value."' where ch_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
		
		
}


 exit;