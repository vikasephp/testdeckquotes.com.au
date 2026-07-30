<?php

$bsn_id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');
$col = $fwRequest->getparam('col', '');

$value = str_replace('%20',' ',$value);

if(!empty($bsn_id))
{
	$sql = "Update quote_tracking_report_po set  ".$col."  = '".$value."' where qt_bsn_id = ".$bsn_id;	 
	$fwDb -> queryOne($sql);
	
	if($value =='Complete') {
		$sql3 = "Update quote_tracking_report_delivery set  ".$col."  = 'PO Sent' where qt_bsn_id = ".$bsn_id;	 
		$fwDb -> queryOne($sql3);	
	}
	
	$sql2 = "select qs_color from quote_tracking_status_po where qs_name = '".$value."'";
	$coldata = $fwDb->queryOne($sql2);
	echo $coldata['qs_color'];
}



 exit;