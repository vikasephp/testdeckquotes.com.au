<?php


$id = $fwRequest->getParam('su_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($value))
{
	$sql = "Update support_list set su_capicity  = ".$value." where su_id = ".$id;	 
	$fwDb -> queryOne($sql);
}



 exit;