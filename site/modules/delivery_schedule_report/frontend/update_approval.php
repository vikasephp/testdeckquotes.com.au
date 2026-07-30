<?php


$id = $fwRequest->getParam('po_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($value))
{
	$sql = "Update purchase_order set  po_approval  = '".$value."' where po_id = ".$id;	 
	$fwDb -> queryOne($sql);
}



 exit;