<?php
$postedData = $_GET; //echo "<pre>"; print_r($postedData); 
$folder_path = "";

if (!empty($postedData['file_name']) && !empty($postedData['module_name'])) {
    require_once(LIB_DIR . 'CloudEphpClass.php');
    $obj = new CloudEphpClass($postedData['module_name']);
    // return $obj->download($postedData['file_name']);
    header("location:" . $obj->download($postedData['file_name'], false) . "");
    exit;
} else {
    echo "file_name or module name is missing";
}