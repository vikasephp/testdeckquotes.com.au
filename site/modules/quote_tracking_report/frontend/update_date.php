<?php

$bsn_id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');
$col = $fwRequest->getparam('col', '');

$value = str_replace('%20',' ',$value);

if(!empty($bsn_id))
{
	$sql = "Update quote_tracking_report_delivery set  ".$col."  = '".$value."' where qt_bsn_id = ".$bsn_id;	 
	$fwDb -> queryOne($sql);
	
	
}



 exit;