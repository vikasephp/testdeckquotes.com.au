<?php

$id = $fwRequest->getParam('cdcn_id', '');
$value = $fwRequest->getparam('value', '');

$sql = "Update warranty_log_cgfbdirectcosts_notes set cdcn_add_to_main_notes  = ".$value." where cdcn_id = ".$id;	 
$fwDb -> queryOne($sql);

 exit;