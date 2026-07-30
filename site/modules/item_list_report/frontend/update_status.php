<?php

$id = $fwRequest->getParam('pi_id', '');
$value = $fwRequest->getparam('value', '');

//$dt = date('d-m-Y');
//$user = $_SESSION['user']['user_name'];

if(!empty($id))
{
	$sql1 = "Update purchase_order_items set  pi_status  = '".$value."' where pi_id = ".$id;	 
	$fwDb -> queryOne($sql1);	
}

 exit;