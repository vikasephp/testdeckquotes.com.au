<?php

$value = $fwRequest->getparam('value', '');

if(!empty($value))
{
	
	$sql = "insert into supplier_temp  (st_supplier) value ('".$value ."')";	 
	$fwDb -> queryOne($sql);	
}

	
 exit;