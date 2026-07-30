<?php


$id = $fwRequest->getParam('td_id', '');
$value = $fwRequest->getparam('value', '');

if(!empty($value))
{
	$sql = "Update 30_days_rec_report set  td_last_email_date  = '".$value."' where td_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit;