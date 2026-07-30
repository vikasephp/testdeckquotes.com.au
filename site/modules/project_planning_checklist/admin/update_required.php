<?php

$id = $fwRequest->getParam('ppc_id', '');
$value = $fwRequest->getparam('value', '');

	$sql_1 = "Update planning_project_checklist_admin set  ppc_required  = '".$value."' where ppc_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
		
 exit;