<?php

$id = $fwRequest->getParam('mv_id', '');
$value = $fwRequest->getparam('value', '');
	
$sql = "Update missing_variation_invoice set mv_hide = '".$value."' where mv_id = ".$id;	 
$fwDb -> queryOne($sql);

exit;