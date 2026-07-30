<?php


$id = $fwRequest->getParam('wp_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($id))
{
	
	
	$sql_1 = "Update work_in_progress_report set  wp_cog_percented  = ".$value." where wp_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
}



 exit;