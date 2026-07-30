<?php


$id = $fwRequest->getParam('td_id', '');
$value = $fwRequest->getparam('value', '');


	$sql = "Update 30_days_rec_report set  td_last_audited  = '".$value."' where td_id = ".$id;	 
	$fwDb -> queryOne($sql);



 exit;