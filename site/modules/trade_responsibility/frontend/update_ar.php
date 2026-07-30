<?php

$id = $fwRequest->getParam('sa_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($id))
{
	$sql = "Update supplier_warranty set  sa_tr_accepted_res  = '".$value."' where sa_id = ".$id;	 
	$fwDb -> queryOne($sql);
}


 exit;