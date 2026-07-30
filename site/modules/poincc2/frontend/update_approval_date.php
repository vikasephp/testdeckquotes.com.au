<?php

$id = $fwRequest->getparam('po_id', '');
$column = $fwRequest->getParam('column', '');
$value = urldecode($fwRequest->getparam('value', ''));

if($id > 0 && $column === 'po_inv_approval_date' ){
	$sql = "Update poincc2 set po_inv_approval_date = '".$value."' where po_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

exit('Success');