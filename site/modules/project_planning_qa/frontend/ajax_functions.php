<?php

$servername = "localhost";
$username = "deckquotescom_deckquote";
$password = "DOG&fI#QQ3g!";
$dbname = "deckquotescom_deckquot8thFeb";

// Create a new MySQLi instance
$mysqli = new mysqli($servername, $username, $password, $dbname);

// Check for connection errors
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: " . $mysqli->connect_error;
    exit();
}

$postedData = $_REQUEST; //echo "<pre>"; print_r($postedData);
if ($postedData['action'] == "manageStaffMember" && !empty($postedData['divId']) && !empty($postedData['staffMemberId']) && !empty($postedData['staffMemberName'])) {
    $div_id = $postedData['divId'];
    $staffMemberId = $postedData['staffMemberId'];
    $staffMemberName = trim($postedData['staffMemberName']);
    $bsn_id = trim($postedData['bsnId']);
    $qa_id = trim($postedData['questionId']);

    $table_name = "wp_business_meta";
    $key = 'calendear_events';
    $query = "SELECT business_value FROM $table_name WHERE business_id = '" . $bsn_id . "' AND business_key = '" . $key . "'";
    $sub_result = $mysqli->query($query);
    if ($sub_result->num_rows > 0) {
        while ($sub_row = $sub_result->fetch_assoc()) {
            $data = unserialize($sub_row['business_value']);
            $key_index = 0;
            foreach ($data['project_enquiry'] as $key => $value) {
                $key_index = $key;
                break;
            }
            foreach ($data['project_enquiry'][$key_index]['enquiry_questions'] as $key => $event) { {
                    //  echo "<pre>";print_r($event);  echo "ques id:: ".$event['question_id'] ."==". $qa_id;
                    if (trim($event['question_id']) == $qa_id) {

                        $data['project_enquiry'][$key_index]['enquiry_questions'][$key]['staff_member_name'] = $staffMemberName;
                        $data['project_enquiry'][$key_index]['enquiry_questions'][$key]['staff_member_id'] = $staffMemberId;

                        $business_value = serialize($data);
                        $sql = "UPDATE wp_business_meta SET business_value = '" . $business_value . "' WHERE business_id = '" . $bsn_id . "' AND business_key = 'calendear_events'";

                        if ($mysqli->query($sql) === TRUE) {
                            $result = ["status" => "true", "block_no" => "2na", "div_id" => $div_id, "error" => "", "data" => []];
                        } else {
                            $result = ["status" => "false", "block_no" => "1ab", "div_id" => $div_id, "error" => "Something went wrong. Please try again.", "data" => []];
                        }

                        $mysqli->close();
                        break;
                    } else {
                        $result = ["status" => "false", "block_no" => "1a", "div_id" => $div_id, "error" => "Something went wrong. Please try again.", "data" => []];
                    }
                }
            }
        }
    } else {
        $result = ["status" => "false", "block_no" => "1b", "div_id" => $div_id, "error" => "Something went wrong. Please try again.", "data" => []];
    }
    header('Content-type: application/json');
    echo json_encode($result);
}
exit();
