<?php

$start = $_GET["start"];
$end = $_GET["end"];

$query = 'SELECT wa_id, wa_project, wa_problem, wa_is_inspection_fee_required_scheduled_date, wa_is_inspection_fee_required_scheduled_day, wa_is_inspection_fee_required_scheduled_actual_start_time, wa_is_inspection_fee_required_scheduled_actual_end_time FROM warranty_log WHERE wa_is_inspection_fee_required_inspection_completed = 0 AND wa_status != "Closed" AND wa_is_inspection_fee_required_scheduled_date BETWEEN "' . $start . '" AND "' . $end . '" AND wa_is_inspection_fee_required_scheduled_actual_start_time IS NOT NULL AND wa_is_inspection_fee_required_scheduled_actual_end_time IS NOT NULL ORDER BY wa_is_inspection_fee_required_scheduled_date ASC, wa_is_inspection_fee_required_scheduled_actual_start_time ASC';
$records = $fwDb->query($query);
$wa_project_array = [];
foreach($records as $row) {
    $wa_project_array[] = $row['wa_project'];
}

$query = 'SELECT B.bsn_name, BC.bcust_fname, BC.bcust_lname, BC.bcust_misc_email1, BC.bcust_misc_moble FROM business AS B INNER JOIN business_sellers AS BS ON BS.bs_business_id = B.bsn_id INNER JOIN bus_customers AS BC ON BC.bcust_id = BS.bs_customers_id WHERE B.bsn_name IN ("' . implode('","', $wa_project_array) . '")';
$result = $fwDb->query($query);
$customer_array = [];
foreach($result as $row) {
    if(!isset($customer_array[$row['bsn_name']])) {
        $customer_array[$row['bsn_name']] = '
            <strong>Name:</strong> ' . trim($row['bcust_fname'] . ' ' . $row['bcust_lname']) . '
            <br>
            <strong>Email:</strong> ' . $row['bcust_misc_email1'] . '
            <br>
            <strong>Phone:</strong> ' . $row['bcust_misc_moble'] . '
        ';
    }
}

class Event {
    public $id;
    public $text;
    public $start;
    public $end;
    public $barColor;
    public $note;
}
$events = array();

foreach($records as $row) {
    $e = new Event();
    $e->id = $row['wa_id'];
    $e->text = 'Rec. #' . $row['wa_id'];
    $e->start = $row['wa_is_inspection_fee_required_scheduled_date'] . ' ' . $row['wa_is_inspection_fee_required_scheduled_actual_start_time'];
    $e->end = $row['wa_is_inspection_fee_required_scheduled_date'] . ' ' . $row['wa_is_inspection_fee_required_scheduled_actual_end_time'];
    $note = '<h2>Record No. ' . $row['wa_id'] . '</h2>';
    $text = 'Record No. ' . $row['wa_id'] . '
    Project Address: ' . $row['wa_project'] . '
    Problem: ' . $row['wa_problem'] . '
    Inspection Schedule: ' . setInspectionDatetime($row, false);
    $note .= '<table class="alert-table">';
        $note .= '<tr>';
            $note .= '<th>Project Address</th>';
            $note .= '<td>' . $row['wa_project'] . '</td>';
        $note .= '</tr>';
        $note .= '<tr>';
            $note .= '<th>Problem</th>';
            $note .= '<td>' . $row['wa_problem'] . '</td>';
        $note .= '</tr>';
        $note .= '<tr>';
            $note .= '<th>Inspection Schedule</th>';
            $note .= '<td>' . setInspectionDatetime($row) . '</td>';
        $note .= '</tr>';
        $note .= '<tr>';
            $note .= '<th>Customer Information</th>';
            $note .= '<td>' . $customer_array[$row['wa_project']] . '</td>';
        $note .= '</tr>';
    $note .= '</table>';
    // $e->barColor = '#cc4125';
    $e->note = $note;
    $e->text = $text;
    $events[] = $e;
}

header('Content-Type: application/json');
echo json_encode($events);
// db($events);
exit;