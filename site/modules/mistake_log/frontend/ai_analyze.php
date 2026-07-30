<?php
// Clear all output buffers to prevent any prior output
while (ob_get_level()) {
    ob_end_clean();
}

error_reporting(0);
ini_set('display_errors', 0);

// Set JSON content type header
header('Content-Type: application/json; charset=utf-8');

// Read input JSON from request body
$input = json_decode(file_get_contents('php://input'), true);

if (!$input || empty(trim($input['mistake_log']))) {
    echo json_encode([
        'status' => 'failed',
        'message' => 'mistake_log is required'
    ]);
    exit;
}

$mistakeLog = $input['mistake_log'];
$stream = $input['stream'] ?? 'Operations';
$date = $input['date'] ?? date('Y-m-d');

// API endpoint and token
$apiUrl = 'https://ai.deckquotes.com.au/api/v1/analyze';
$apiToken = 'A9fK2LmP4QX7ZbR3';

$postData = json_encode([
    'mistake_log' => $mistakeLog,
    'stream' => $stream,
    'date' => $date
]);

$ch = curl_init($apiUrl);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    'Content-Type: application/json',
    'Authorization: Bearer ' . $apiToken
]);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);

$response = curl_exec($ch);
$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
curl_close($ch);

// Decode API response JSON
$apiResponse = json_decode($response, true);

// Check response and output JSON accordingly
if ($httpCode === 200 && isset($apiResponse['data'])) {

    // Join ai_solution array elements into a string, each prefixed with "- "
    $aiSolution = '';
    if (isset($apiResponse['data']['ai_solution']) && is_array($apiResponse['data']['ai_solution'])) {
        $aiSolution = "- " . implode("\n- ", $apiResponse['data']['ai_solution']);
    }

    echo json_encode([
        'status' => 'success',
        'analysis_output' => $aiSolution,
        'root_cause_insight' => $apiResponse['data']['ai_root_cause_insight'] ?? ''
    ]);
} else {
    // Return failure JSON with raw response for debugging
    echo json_encode([
        'status' => 'failed',
        'message' => 'AI service error',
        'raw_response' => $response
    ]);
}

// Exit immediately after outputting JSON to prevent any trailing output
exit;
