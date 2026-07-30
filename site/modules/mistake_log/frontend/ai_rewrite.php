<?php
header('Content-Type: application/json');

// Read JSON input
$input = json_decode(file_get_contents('php://input'), true);

if (empty($input['text'])) {
    echo json_encode([
        'status'  => 'failed',
        'message' => 'No text provided'
    ]);
    exit;
}

// Strip HTML coming from CKEditor
$cleanText = trim(strip_tags($input['text']));

$payload = json_encode([
    'text'    => $cleanText,
    'context' => $input['context'] ?? 'mistake log'
], JSON_UNESCAPED_UNICODE);

$ch = curl_init('https://ai.deckquotes.com.au/api/v1/rewrite');

curl_setopt_array($ch, [
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_POST           => true,
    CURLOPT_POSTFIELDS     => $payload,
    CURLOPT_HTTPHEADER     => [
        'Content-Type: application/json',
        'Authorization: Bearer A9fK2LmP4QX7ZbR3',
        'Content-Length: ' . strlen($payload),
        'Expect:' // prevents 30s hang
    ],
    CURLOPT_CONNECTTIMEOUT => 10,
    CURLOPT_TIMEOUT        => 30,
    CURLOPT_HTTP_VERSION   => CURL_HTTP_VERSION_1_1
]);

$response = curl_exec($ch);

if ($response === false) {
    echo json_encode([
        'status'  => 'failed',
        'message' => curl_error($ch)
    ]);
    curl_close($ch);
    exit;
}

curl_close($ch);

// Decode AI response
$apiResponse = json_decode($response, true);

if (
    !$apiResponse ||
    empty($apiResponse['status']) ||
    $apiResponse['status'] !== 'success' ||
    empty($apiResponse['rewritten_text'])
) {
    echo json_encode([
        'status'  => 'failed',
        'message' => 'Rewrite failed',
        'raw'     => $apiResponse
    ]);
    exit;
}

// SUCCESS: map rewritten_text → text
echo json_encode([
    'status' => 'success',
    'text'   => $apiResponse['rewritten_text']
]);
exit;
