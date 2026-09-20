<?php


$id = $fwRequest->getParam('bsn_id', '');
$id2 = $fwRequest->getParam('bsn_id_2', '');
$id3 = $fwRequest->getParam('bsn_id_3', '');

$value = $fwRequest->getparam('value', '');

$user = $_SESSION['user']['user_name'];
$dt = date("d-m-Y");

if(!empty($id))
{
	$sql1 = "Update business set  bsn_proj_salu   = '".$value."' where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql1);
}

if(!empty($id2))
{
	$sql1 = "Update business set  bsn_proj_salu_who   = '".$value."' where bsn_id = ".$id2;	 
	$fwDb -> queryOne($sql1);
}

if(!empty($id3))
{
	$sql1 = "Update business set  bsn_proj_salu_date   = '".$value."' where bsn_id = ".$id3;	 
	$fwDb -> queryOne($sql1);
}

 exit;