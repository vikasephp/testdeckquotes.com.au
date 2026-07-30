<?php


$id = $fwRequest->getParam('po_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($id))
{
	$sql = "Update purchase_order set  po_delivery_event   = ".$value." where po_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit;