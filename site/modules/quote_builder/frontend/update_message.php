<?php


$id = $fwRequest->getParam('qb_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($id))
{
	$sql = "Update quote_builder set  qb_message   = '".$value."' where qb_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit;