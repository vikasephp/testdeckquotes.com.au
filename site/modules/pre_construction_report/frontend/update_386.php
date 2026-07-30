<?php


$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($value))
{
	$sql = "Update pre_construction_report set  pcr_uid386   = '".$value."'";	 
	$fwDb -> queryOne($sql);
}



 exit;