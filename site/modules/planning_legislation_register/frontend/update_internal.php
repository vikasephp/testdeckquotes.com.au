<?php

$id = $fwRequest->getParam('plr_id', '');
$value = $fwRequest->getparam('value', '');



$sql_1 = "Update planning_legislation_register set plr_int_html_status = ".$value." where plr_id = ".$id;	 
$fwDb -> queryOne($sql_1);



exit;