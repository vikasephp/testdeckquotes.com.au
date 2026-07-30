<?php

$id = $fwRequest->getParam('wa_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($value))
{
	$sql = "Update warranty set  wa_qualiy_inspecter_con  = ".$value." where wa_id = ".$id;	 
	$fwDb -> queryOne($sql);
}


 exit;