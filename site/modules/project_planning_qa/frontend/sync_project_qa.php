<?php

$paeTbl = new Fw_Db_Table('planning_approval_enquiries');
$busQaTbl = new Fw_Db_Table('business_qa');

$insertSQL = 'INSERT INTO business_qa (bqa_unique_id, bqa_bsn_id, bqa_cust_id, bqa_que, bqa_ans, bqa_ans_plain, bqa_ans_date, bqa_created_date, bqa_from_pae) VALUES ';
$insertCount = 0;
$updateSQL = 'INSERT INTO business_qa (bqa_id, bts_task_name) VALUES ';
$updateCount = 0;
$sqlmx = "SELECT MAX(bqa_unique_id) AS bqa_unique_id FROM business_qa";
$uni = $fwDb->queryOne($sqlmx);
$bqa_unique_id = $uni['bqa_unique_id'] + 1;
foreach($paeTbl->getAllRows() as $row){
    if($row['is_synced'] == 0){
        // Insert record
        $insertSQL .= '("'
            . (int)$bqa_unique_id . '", "'
            . (int)$row['project_id'] . '", "'
            . (int)$row['user_id']. '", "'
            . $row['enquiry'] . '", "'
            . $row['solution'] . '", "'
            . $row['solution'] . '", "'
            . $row['updated_at'] . '", "'
            . $row['created_at'] . '", "'
            . (int)$row['id']
        . '"),';

        $bqa_unique_id++;
        $insertCount++;
    }
    else{
        // Update record
    }
}

if($insertCount > 0){
    $insertSQL = substr($insertSQL, 0, strlen($insertSQL) - 1) . ';';
    echo "<br><br>$insertCount Insert.<br>$insertSQL";
    // $fwDb = new Fw_Db();
    // $fwDb->query($insertSQL);
    mysqli_multi_query($MySqliCon, $insertSQL);
}

// db($paeTbl->getAllRows());

exit;