<?php
/**
 * Dual Occupancy Canberra Search With AI API Endpoint (Secured with Token Auth)
 * Purpose: Handles authenticated POST requests to insert Search Query and Result.
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

define('API_ACCESS_TOKEN', 'apixbadc82b5ffcc3c64ec0b4ee11b708f2');

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

$docs_question     = isset($input['docs_question']) ? trim($input['docs_question']) : '';
$docs_answer  = isset($input['docs_answer']) ? trim($input['docs_answer']) : '';
$docs_confidence = isset($input['docs_confidence']) ? trim($input['docs_confidence']) : '';


$errors = [];

if (empty($docs_question)) {
    $errors['docs_question'] = "Question is required.";
}

if (empty($docs_answer)) {
    $errors['docs_answer'] = "Answer is required.";
}

if (empty($docs_confidence)) {
    $errors['docs_confidence'] = "Confidence is required.";
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
        'docs_question'     => $docs_question,
        'docs_answer'  => $docs_answer,
        'docs_confidence' => $docs_confidence
    ];

    $tableTask = new Fw_Db_Table('dual_occupancy_canberra_search');               
    $opr = $tableTask->insertRow($detail); 
    
    if ($opr) {
        http_response_code(201);
        echo json_encode([
            "status" => "success", 
            "message" => "Dual Occupancy Canberra Search Query and Answer successfully inserted.",
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