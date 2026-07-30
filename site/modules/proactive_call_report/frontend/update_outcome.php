<?php


$id = $fwRequest->getParam('pr_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($id))
{
	$sql = "Update proactive_call_report set pr_outcome  = ".$value." where pr_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit;