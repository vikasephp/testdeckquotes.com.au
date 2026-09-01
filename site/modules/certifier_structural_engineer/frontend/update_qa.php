<?php

$id = $fwRequest->getParam('cse_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];

if(!empty($id))
{
	$sql_1 = "Update certifier_structural_engineer set  cse_qa  = '".$value."' where cse_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	$sql_2 = "Update certifier_structural_engineer set   cse_qa_date  = '".$dt."' where cse_id = ".$id;	 
	$fwDb -> queryOne($sql_2);
	
	$sql_3 = "Update certifier_structural_engineer set   cse_qa_user  = '".$usr."' where cse_id = ".$id;	 
	$fwDb -> queryOne($sql_3);
	
	$sql = "select cse_qa_user, cse_qa_date from certifier_structural_engineer where  cse_id = ".$id;
	$detail = $fwDb -> queryOne($sql);
	
	echo $detail['cse_qa_user'].'<br>'.$detail['cse_qa_date'];
	
	
	
}



 exit;