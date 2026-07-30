<?php

$id = $fwRequest->getParam('ph_id', '');
$value = $fwRequest->getparam('value', '');
	
	$sql_1 = "Update post_hia_design_report set  ph_urgency  = ".$value." where ph_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	
	
 exit;