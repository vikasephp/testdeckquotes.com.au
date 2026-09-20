<?php
/**
 * Prospect List API Endpoint (Secured with Token Auth)
 * Purpose: Handles authenticated POST requests to insert new prospects.
**/

header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode([
        "status" => "error", 
        "message" => "Method Not Allowed. This endpoint requires a POST request."
    ]);
    exit;
}

define('API_ACCESS_TOKEN', 'doc_7Hk9Pz4xR2mV8nQ6sT1wL9aB3cD5eF8gH2jK7');

$headers = apache_request_headers();
$authHeader = isset($headers['Authorization']) ? trim($headers['Authorization']) : '';

if (empty($authHeader) && isset($_SERVER['HTTP_AUTHORIZATION'])) {
    $authHeader = trim($_SERVER['HTTP_AUTHORIZATION']);
}

$token = '';
if (!empty($authHeader) && preg_match('/Bearer\s(\S+)/', $authHeader, $matches)) {
    $token = $matches[1];
}

if (empty($token) || $token !== API_ACCESS_TOKEN) {
    http_response_code(401);
    echo json_encode([
        "status" => "error",
        "message" => "Unauthorized access. Invalid or missing API access token."
    ]);
    exit;
}

$input = json_decode(file_get_contents("php://input"), true);
if (empty($input)) {
    $input = $_POST; 
}

$dolr_project_address = isset($input['dolr_project_address']) ? trim($input['dolr_project_address']) : '';
$dolr_customer_name = isset($input['dolr_customer_name']) ? trim($input['dolr_customer_name']) : '';
$dolr_customer_email = isset($input['dolr_customer_email']) ? trim($input['dolr_customer_email']) : '';
$dolr_phone_number = isset($input['dolr_phone_number']) ? trim($input['dolr_phone_number']) : '';
$dolr_webpage = isset($input['dolr_webpage']) ? trim($input['dolr_webpage']) : '';


$errors = [];

if (empty($dolr_customer_name)) {
    $errors['dolr_customer_name'] = "Customer Name is required.";
}

if (empty($dolr_customer_email)) {
    $errors['dolr_customer_email'] = "Email address is required.";
} elseif (!filter_var($dolr_customer_email, FILTER_VALIDATE_EMAIL)) {
    $errors['dolr_customer_email'] = "Invalid email address format.";
}

if (empty($dolr_phone_number)) {
    $errors['dolr_phone_number'] = "Contact number is required.";
} else {
    $phone_pattern = '/^\+?[0-9\s\-()]{7,15}$/';
    
    if (!preg_match($phone_pattern, $dolr_phone_number)) {
        $errors['dolr_phone_number'] = "Invalid contact number format. Use digits, spaces, dashes, or +.";
    }
}

if (empty($dolr_project_address)) {
    $errors['dolr_project_address'] = "Project Address cannot be empty.";
}

if (empty($dolr_webpage)) {
    $errors['dolr_webpage'] = "Mention Landing Page.";
}

if (!empty($errors)) {

    http_response_code(400); 
    echo json_encode([
        "status" => "error", 
        "errors" => $errors
    ]);
    exit;
}

try {
    $detail = [
        'dolr_customer_name' => $dolr_customer_name,
        'dolr_customer_email' => $dolr_customer_email,
        'dolr_phone_number' => $dolr_phone_number,
        'dolr_project_address' => $dolr_project_address,
		'dolr_webpage' => $dolr_webpage,
		'dolr_enquiry_date' => date('d-m-Y'),
		'dolr_source' => 'Website',
    ];

    $tableTask = new Fw_Db_Table('dual_occupancy_lead_report');               
    $opr = $tableTask->insertRow($detail); 
    
    if ($opr) {
        http_response_code(201);
        echo json_encode([
            "status" => "success", 
            "message" => "Record Inserted in Dual Occupancy Lead Report successfully.",
            "data" => [
                "result" => $opr 
            ]
        ]);
    } else {
        throw new Exception("The framework database layer failed to write the row.");
    }

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        "status" => "error", 
        "message" => "Database operation failed.",
        "debug"   => $e->getMessage()
    ]);
}
exit;	

?>