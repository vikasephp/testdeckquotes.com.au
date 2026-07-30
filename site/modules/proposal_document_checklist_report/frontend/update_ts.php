<?php

$id = $fwRequest->getParam('bst_task_id', '');
$value = $fwRequest->getparam('value', '');

if(!empty($id))
{
	$sql = "Update proposal_task_list set  bst_ptt_summary   = '".$value."' where bst_task_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit;