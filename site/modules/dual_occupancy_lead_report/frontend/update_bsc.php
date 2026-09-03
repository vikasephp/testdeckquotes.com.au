<?php

$dolr_id = (int)$fwRequest->getParam('dolr_id', 0);
$value = (int)$fwRequest->getparam('value', 0);

$date = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if ($dolr_id > 0) {
    $sql = "UPDATE dual_occupancy_lead_report SET dolr_block_sizeclass = $value, dolr_block_sizeclass_updated_by = '$user', dolr_block_sizeclass_updated_at = '$date' WHERE dolr_id = $dolr_id";
    $fwDb->queryOne($sql);
	
	$sql_data_get = "select dolr_block_sizeclass_updated_by, dolr_block_sizeclass_updated_at from dual_occupancy_lead_report where dolr_block_sizeclass > 0 AND dolr_id = $dolr_id";
	$data_get = $fwDb->queryOne($sql_data_get);
	echo $data_get['dolr_block_sizeclass_updated_by']."<br/>".$data_get['dolr_block_sizeclass_updated_at'];
}

exit;
