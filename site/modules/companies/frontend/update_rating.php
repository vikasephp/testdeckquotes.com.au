<?php


$id = $fwRequest->getParam('co_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($value))
{
	$sql = "Update companies set  co_rating  = '".$value."' where co_id = ".$id;	 
	$fwDb -> queryOne($sql);
}



 exit;