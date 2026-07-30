<?php

$id = $fwRequest->getParam('wc_id', '');
$value = $fwRequest->getparam('value', '');

if(!empty($id))
{
	$sql = "Update warranty_checklist_admin set  wc_order  = ".$value." where wc_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit;