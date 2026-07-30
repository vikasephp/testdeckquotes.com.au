<?php
/**
 * Prospect List API Endpoint (Secured with Token Auth)
 * Purpose: Handles authenticated POST requests to insert new prospects.
 */

// 1. Set headers for RESTful JSON response and CORS
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// 2. Guard Clause: Enforce POST requests only

print_r($_SERVER['REQUEST_METHOD']);

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405); // Method Not Allowed
    echo json_encode([
        "status" => "error", 
        "message" => "Method Not Allowed. This endpoint requires a POST request."
    ]);
    exit;
}

// 3. Bootstrapping/Configuration
// Adjust this path so it successfully loads your global config, autoloader, and Fw_Db_Table class
//require_once 'config.php'; 

// --- START TOKEN VALIDATION ---
// Define your secure static token (ideally, move this constant to your config.php)
define('API_ACCESS_TOKEN', 'apibtoICccyerjvjaud52RFSbPti7BxaBE2');

$headers = apache_request_headers();
$authHeader = isset($headers['Authorization']) ? trim($headers['Authorization']) : '';

// If apache_request_headers() isn't supported on your server setup, fallback to $_SERVER
if (empty($authHeader) && isset($_SERVER['HTTP_AUTHORIZATION'])) {
    $authHeader = trim($_SERVER['HTTP_AUTHORIZATION']);
}

$token = '';
// Extract token from "Bearer <token>" format
if (!empty($authHeader) && preg_match('/Bearer\s(\S+)/', $authHeader, $matches)) {
    $token = $matches[1];
}

// Check if token exists and matches your secret key
if (empty($token) || $token !== API_ACCESS_TOKEN) {
    http_response_code(401); // Unauthorized
    echo json_encode([
        "status" => "error",
        "message" => "Unauthorized access. Invalid or missing API access token."
    ]);
    exit;
}
// --- END TOKEN VALIDATION ---

// 4. Handle Incoming Payload (Hybrid approach for raw JSON or standard Form Data)
$input = json_decode(file_get_contents("php://input"), true);
if (empty($input)) {
    $input = $_POST; 
}

// 5. Extract and Sanitize Input Data
$pl_owner_name     = isset($input['pl_owner_name']) ? trim($input['pl_owner_name']) : '';
$pl_email_address  = isset($input['pl_email_address']) ? trim($input['pl_email_address']) : '';
$pl_contact_number = isset($input['pl_contact_number']) ? trim($input['pl_contact_number']) : '';
$pl_message        = isset($input['pl_message']) ? trim($input['pl_message']) : '';

// 6. Server-Side Validation Logic
$errors = [];

if (empty($pl_owner_name)) {
    $errors['pl_owner_name'] = "Name is required.";
}

if (empty($pl_email_address)) {
    $errors['pl_email_address'] = "Email address is required.";
} elseif (!filter_var($pl_email_address, FILTER_VALIDATE_EMAIL)) {
    $errors['pl_email_address'] = "Invalid email address format.";
}

if (empty($pl_contact_number)) {
    $errors['pl_contact_number'] = "Contact number is required.";
} else {
    // Regex allows: optional '+', followed by 7 to 15 digits. 
    // It also allows spaces, dashes, or parentheses for clean formatting.
    $phone_pattern = '/^\+?[0-9\s\-()]{7,15}$/';
    
    if (!preg_match($phone_pattern, $pl_contact_number)) {
        $errors['pl_contact_number'] = "Invalid contact number format. Use digits, spaces, dashes, or +.";
    }
}

if (empty($pl_message)) {
    $errors['pl_message'] = "Message cannot be empty.";
}

// If there are validation errors, halt and return a 400 Bad Request
if (!empty($errors)) {

    http_response_code(400); 
    echo json_encode([
        "status" => "error", 
        "errors" => $errors
    ]);
    exit;
}

// 7. Database Persistence Layer
try {
    // Structure the data payload for your framework's ORM layer
    $detail = [
        'pl_owner_name'     => $pl_owner_name,
        'pl_email_address'  => $pl_email_address,
        'pl_contact_number' => $pl_contact_number,
        'pl_message'        => $pl_message
    ];

    // Instantiate your framework's table utility
    $tableTask = new Fw_Db_Table('prospect_list');               
    $opr = $tableTask->insertRow($detail); 
    
    // Check framework operation result
    if ($opr) {
        http_response_code(201); // 201 Created
        echo json_encode([
            "status" => "success", 
            "message" => "Prospect successfully created.",
            "data" => [
                "result" => $opr 
            ]
        ]);
    } else {
        throw new Exception("The framework database layer failed to write the row.");
    }

} catch (Exception $e) {
    // Capture unexpected server/database issues safely
    http_response_code(500); // Internal Server Error
    echo json_encode([
        "status" => "error", 
        "message" => "Database operation failed.",
        "debug"   => $e->getMessage() // You can omit this line on live production servers
    ]);
}
exit;	

?>