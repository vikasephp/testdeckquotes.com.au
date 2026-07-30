<?php

$id = $fwRequest->getParam('de_id', '');
$value = $fwRequest->getparam('value', '');

if(!empty($id))
{	
	$sql_1 = "Update development_log set  de_type  = ".$value." where de_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
}
 exit;