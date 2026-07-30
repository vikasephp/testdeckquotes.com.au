<?php

$id = $fwRequest->getParam('bst_task_id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace("%20", " ",$value);

if(!empty($id))
{
	$sql = "Update busness_status_task set  bst_ptt_summary   = '".$value."' where bst_task_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit;