<?php


$id = $fwRequest->getParam('dt_id', '');
$value = $fwRequest->getparam('value', '');

$value = str_replace('%20',' ',$value);
if(!empty($id))
{
	$sql = "Update task_designer_tracker set  tdt_priority  = ".$value." where tdt_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit;