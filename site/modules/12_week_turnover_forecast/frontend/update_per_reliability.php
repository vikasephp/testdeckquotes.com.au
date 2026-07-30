<?php

$id = (int)$fwRequest->getParam('start_ts', 0);
$value = (int)$fwRequest->getparam('value', 0);

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];

if($id > 0){
	
	// 1. Check if the record exists
    $check_record = "SELECT * FROM 12_week_turnover_forecasts WHERE week_period_id = $id";
    $existing = $fwDb->queryOne($check_record);
	
	if ($existing) {
		$sql = "Update 12_week_turnover_forecasts set week_reliability_per_week = ".$value." where week_period_id = ".$id;	 
		$fwDb -> queryOne($sql);
		
		$sql_usr = "Update 12_week_turnover_forecasts set week_reliability_user = '".$usr."' where week_period_id = ".$id;	 
		$fwDb -> queryOne($sql_usr);
		
		$sql_dt = "Update 12_week_turnover_forecasts set week_reliability_date = '".$dt."' where week_period_id = ".$id;	 
		$fwDb -> queryOne($sql_dt);
	} 
	else {
		$insertSql = "
            INSERT INTO 12_week_turnover_forecasts
                (week_period_id, week_reliability_per_week, week_reliability_user, week_reliability_date)
            VALUES
                ($id, $value, '$usr', '$dt')
        ";
        $fwDb->queryOne($insertSql);		
	}
	
	$sql_fetch = "SELECT * FROM 12_week_turnover_forecasts WHERE week_period_id = $id";
    $result = $fwDb->queryOne($sql_fetch);
	
    header('Content-Type: application/json');
    echo json_encode($result);
    exit;
}

 exit('');