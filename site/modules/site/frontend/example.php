<?php

$servername = "localhost";
$username = "admin3_deckuser";
$password = "TMN)xgK#~0Py";
$dbname = "admin3_deckquot8thFeb";

// Create a new MySQLi instance
$mysqli = new mysqli($servername, $username, $password, $dbname);

// Check for connection errors
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: " . $mysqli->connect_error;
    exit();
}

// At first, you need to access all the projects from the business database with the following query
$main_query = "SELECT * FROM business INNER JOIN business_sellers ON business.bsn_id = business_sellers.bs_business_id INNER JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id WHERE business.bsn_status LIKE '%|3|%' AND bus_customers.bcust_cip_hide = 0;";

$result = $mysqli->query($main_query);
if (!$result) {
    echo "Query error: " . $mysqli->error;
    exit();
}
$data_whole = array();
// Fetch data from the result object
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $id = $row['bsn_id'];
        $key ='calendear_events';
        if ($id) {
            $table_name = "wp_business_meta";
            $query = "SELECT business_value FROM $table_name WHERE business_id = '".$id."' AND business_key = '".$key."'";
            $sub_result = $mysqli->query($query);
            if (!$sub_result) {
                echo "Sub-query error: " . $mysqli->error;
                exit();
            }
            if ($sub_result->num_rows > 0) {
                while ($sub_row = $sub_result->fetch_assoc()) {
                    $data = unserialize($sub_row['business_value']);
                    if (is_array($data) || $data instanceof Traversable) {
                   foreach ($data as $key => $value) {
   
                    foreach ($value as $values) {

                        if (isset($values['enquiry_questions'])) {
                            
                            foreach ($values['enquiry_questions'] as $question) {
                           $data_whole[] = array(
                                'bsn_id' => $id,
                                'project_name' => $row['bsn_name'],
                                'event_id' => $values['id'],
                                'start_date' => $values['event_date'],
                                'end_date' => $values['end_date'],
                                'responsible_staff' => $values['responsible_staff'],
                                'question_id' => $question['question_id'],
                                'question' => $question['question'],
                                'answer' => $question['answer']
                            );

                                ?>
                                
                            <?php
                            }
                        }
                    }
                }
            }
                }
            }
            $sub_result->free();
        }
    }
} else {
    echo "No rows found.";
}

foreach($data_whole as $question_data){
   echo "<pre>";
print_r($question_data);
// Free the result set

}
die;
?>
