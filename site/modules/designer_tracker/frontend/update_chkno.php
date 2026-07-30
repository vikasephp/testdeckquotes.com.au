<?php


$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($value))
{
	$sql = "Update designer_tracker set dt_checklist_no  = ".$value ." where dt_id = ".$id;	 
	$fwDb -> queryOne($sql);
}



 exit;