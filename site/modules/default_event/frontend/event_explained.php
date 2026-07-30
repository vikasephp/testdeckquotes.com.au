<?php


$id = $fwRequest->getParam('de_id', '');
$value = $fwRequest->getparam('value', '');

$value = str_replace('%20',' ',$value);

if(!empty($id))
{
	$sql = "Update default_event set  de_event_explained  = '".$value."' where de_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit;