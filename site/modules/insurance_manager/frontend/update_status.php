<?php

$id = $fwRequest->getParam('im_id', '');
$value = $fwRequest->getparam('value', '');


$sql_1 = "Update insurance_manager set im_status = ".$value." where im_id = ".$id;	 
$fwDb -> queryOne($sql_1);


exit;