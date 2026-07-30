<?php

$id = $fwRequest->getParam('wa_id', '');
$value = $fwRequest->getparam('value', '');

$sql = "Update warranty_log set wa_invoices_paid  = ".$value." where wa_id = ".$id;	 
$fwDb -> queryOne($sql);


 exit;