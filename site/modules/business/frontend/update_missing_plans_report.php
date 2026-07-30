<?php
$id = $fwRequest->getParam('pc_id', '');
$value = $fwRequest->getparam('value', '');
$dt = date('Y-m-d H:i:s');
$usr = $_SESSION['user']['user_name'];

$sql_1 = "UPDATE project_planning_checklist SET pc_missing_plans_report = $value WHERE pc_id = $id ";
$fwDb->queryOne($sql_1);
$sql_2 = "UPDATE project_planning_checklist SET pc_missing_plans_report_user  = '$usr' WHERE pc_id = $id";
$fwDb->queryOne($sql_2);
$sql_3 = "UPDATE project_planning_checklist SET pc_missing_plans_report_date  = '$dt' WHERE pc_id = $id";
$fwDb->queryOne($sql_3);
$sqlT = "SELECT pc_missing_plans_report, pc_missing_plans_report_user, pc_missing_plans_report_date FROM project_planning_checklist WHERE pc_id = $id";
$dataT = $fwDb->queryOne($sqlT);
$output = $dataT['pc_missing_plans_report_user'] . "<br>" . date('d-m-Y');
if ($dataT['pc_missing_plans_report'] == 1) {
    echo $output;
} else {
    echo "";
}
exit;
