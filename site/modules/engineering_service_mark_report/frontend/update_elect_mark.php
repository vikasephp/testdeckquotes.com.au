<?php

$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');


	$sql5 = "Update business set  bsn_esmr_service_mark   = ".$value." where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql5);


 exit;