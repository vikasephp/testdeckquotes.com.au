<?php

$docqa_id = (int)$fwRequest->getParam('docqa_id', 0);
//$value = rawurldecode($fwRequest->getparam('value', 0));
$value = $fwRequest->getparam('value', 0);

$date = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if ($docqa_id > 0) {
    $sql = "UPDATE dual_occupancy_canberra_qanda SET docqa_audience = '$value', docqa_audience_updated_by = '$user', docqa_audience_updated_at = '$date' WHERE docqa_id = $docqa_id";
    $fwDb->queryOne($sql);
	
	$sql_data_get = "select docqa_audience_updated_by, docqa_audience_updated_at from dual_occupancy_canberra_qanda where docqa_id = $docqa_id";
	$data_get = $fwDb->queryOne($sql_data_get);
	echo $data_get['docqa_audience_updated_by']."<br/>".$data_get['docqa_audience_updated_at'];
}

exit;