<?php

$id = $fwRequest->getParam('po_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];

if(!empty($id))
{
	$sql = "Update poincc3 set  po_invoice_stage  = ".$value." where po_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sqlA = "Update poincc3 set  po_inv_stage_user   = '".$usr."' where po_id = ".$id;	 
	$fwDb -> queryOne($sqlA);
	
	$sqlB = "Update poincc3 set  po_inv_stage_date  = '".$dt."' where po_id = ".$id;	 
	$fwDb -> queryOne($sqlB);
	
	$sql2 = "select is_color from poincc3_invoice_stage where is_id = ".$value;
	$colr = $fwDb->queryOne($sql2);
	
	echo $colr['is_color'];
	
	
}




 exit;