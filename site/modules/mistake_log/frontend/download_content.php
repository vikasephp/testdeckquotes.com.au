<?php
require_once(LIB_DIR . 'CloudEphpClass.php');
$postedData = $_GET; //echo "<pre>"; print_r($postedData); 
$folder_path = "";

if (!empty($postedData['file_name'])) {
    $cloudObj = new CloudEphpClass('mistake_log.home');
    $cloudObj->download($postedData['file_name'], true);
    exit;
} else {
    echo "file_name is missing";
}