<?php

$id = $fwRequest->getParam('bac_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];

$sql_1 = "Update buyers_agent_canberra set bac_status = ".$value." where bac_id = ".$id;	 
$fwDb -> queryOne($sql_1);

$sql_2 = "Update buyers_agent_canberra set bac_status_updated_by = '".$usr."' where bac_id = ".$id;	 
$fwDb -> queryOne($sql_2);

$sql_3 = "Update buyers_agent_canberra set bac_status_updated_at = '".$dt."' where bac_id = ".$id;	 
$fwDb -> queryOne($sql_3);

$sql_data_get = "select bac_status, bac_status_updated_by, bac_status_updated_at from buyers_agent_canberra where bac_id = ".$id;
$data_get = $fwDb->queryOne($sql_data_get);

if($data_get['bac_status'] != '' && $data_get['bac_status'] != -1){
	$output = "<br>".$data_get['bac_status_updated_by'] ."<br>".$data_get['bac_status_updated_at'];
}

echo $output;

exit;