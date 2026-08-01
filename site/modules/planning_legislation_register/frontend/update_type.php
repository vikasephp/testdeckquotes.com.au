<?php

$id = $fwRequest->getParam('plr_id', '');
$value = $fwRequest->getparam('value', '');

$val = explode("|",$value);
$value1 = $val[0];
$value2 = $val[1];

$sql_1 = "Update planning_legislation_register set plr_doc_type = ".$value1." where plr_id = ".$id;	 
$fwDb -> queryOne($sql_1);

$sql_2 = "Update planning_legislation_register set plr_hierarchy = ".$value2." where plr_id = ".$id;	 
$fwDb -> queryOne($sql_2);

exit;