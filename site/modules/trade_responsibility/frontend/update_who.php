<?php

$id = $fwRequest->getParam('wa_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($id))
{
	$sql = "Update trade_responsibility set  wa_who  = '".$value."' where wa_id = ".$id;	 
	$fwDb -> queryOne($sql);
}


 exit;