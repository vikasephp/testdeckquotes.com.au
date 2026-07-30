<?php

$id = $fwRequest->getparam('po_id', '');
$value = $fwRequest->getparam('value', '');

if($id > 0){
	$sql = "Update poincc2 set po_inv_approver = ".$value." where po_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

exit('Success');