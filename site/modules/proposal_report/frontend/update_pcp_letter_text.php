<?php


$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');

$value2 = str_replace('%20',' ',$value);

if(!empty($value))
{
	$sql = "Update business set   	bsn_pcp_letter_text  = '".$value2."' where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql);
}



 exit;