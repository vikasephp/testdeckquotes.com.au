<?php

$id = $fwRequest->getParam('plr_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];


$sql_1 = "Update planning_legislation_register set plr_qa = ".$value." where plr_id = ".$id;	 
$fwDb -> queryOne($sql_1);

$sql_2 = "Update planning_legislation_register set plr_qa_user = '".$usr."' where plr_id = ".$id;	 
$fwDb -> queryOne($sql_2);

$sql_3 = "Update planning_legislation_register set plr_qa_date = '".$dt."' where plr_id = ".$id;	 
$fwDb -> queryOne($sql_3);


	$sql4 = "Select plr_qa_user, plr_qa_date from planning_legislation_register where plr_id = ".$id;
	$data = $fwDb->queryOne($sql4);
	
	if($value == 1) {
		echo $data['plr_qa_user'].'<br>'.$data['plr_qa_date'];
	} else {
		echo '';	
	}

exit;