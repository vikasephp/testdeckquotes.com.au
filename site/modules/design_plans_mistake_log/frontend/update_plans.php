<?php

$id = $fwRequest->getParam('dpml_id', '');
$value = $fwRequest->getparam('value', '');

	
	$sql_1 = "Update design_plans_mistake_log set  dpml_plan  = ".$value." where dpml_id = ".$id;	 
	$fwDb -> queryOne($sql_1);

	
	
 exit;