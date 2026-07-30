<?php

$id = $fwRequest->getParam('vd_id', '');
$value = $fwRequest->getparam('value', '');
	
	$sql_1 = "Update variation_design_agreement set  vd_status  = ".$value." where vd_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	
	
 exit;