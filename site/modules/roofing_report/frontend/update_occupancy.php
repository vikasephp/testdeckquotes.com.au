<?php


$id = $fwRequest->getParam('rr_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($id))
{
	$sql = "Update roofing_report set  rr_occupancy  = ".$value." where rr_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit;