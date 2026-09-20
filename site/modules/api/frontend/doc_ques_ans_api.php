<?php
/**
 * Dual Occupancy Canberra Q&A API
 * Purpose: Returns only Approved questions and answers in JSON format.
 */

header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
    http_response_code(405);
    echo json_encode([
        "status" => "error",
        "message" => "Method Not Allowed. This endpoint requires a GET request."
    ]);
    exit;
}

define('API_ACCESS_TOKEN', 'docqa_J8m4Xr2Pq9Lv7Nc5Ta1Hw6Zd3By8Kf0Rs');

// Get Authorization Header
$headers = function_exists('apache_request_headers') ? apache_request_headers() : [];

$authHeader = '';

if (isset($headers['Authorization'])) {
    $authHeader = trim($headers['Authorization']);
} elseif (isset($headers['authorization'])) {
    $authHeader = trim($headers['authorization']);
} elseif (isset($_SERVER['HTTP_AUTHORIZATION'])) {
    $authHeader = trim($_SERVER['HTTP_AUTHORIZATION']);
}

$token = '';

if (!empty($authHeader) && preg_match('/Bearer\s(\S+)/', $authHeader, $matches)) {
    $token = $matches[1];
}

if ($token !== API_ACCESS_TOKEN) {
    http_response_code(401);
    echo json_encode([
        "status" => "error",
        "message" => "Unauthorized access."
    ]);
    exit;
}

// Pagination
$page = isset($_GET['page']) ? max(1, (int)$_GET['page']) : 1;
$limit = isset($_GET['limit']) ? (int)$_GET['limit'] : 30;

$limit = min(max($limit, 1), 30);

$offset = ($page - 1) * $limit;

try {
	
	$totalSql = "SELECT COUNT(*) AS total FROM dual_occupancy_canberra_qanda where docqa_approved = 1";
	$totalResult = $fwDb->query($totalSql);

	$totalRecords = $totalResult[0]['total'];
	$totalPages = ceil($totalRecords / $limit);

	$sql = "SELECT docqa_id, docqa_slug, TRIM( REPLACE( REPLACE( REPLACE( REGEXP_REPLACE(docqa_question, '<[^>]*>', ''), '&nbsp;', ' ' ), CHAR(13), '' ), CHAR(10), '' ) ) AS docqa_question, TRIM( REPLACE( REPLACE( REPLACE( REGEXP_REPLACE(docqa_answer, '<[^>]*>', ''), '&nbsp;', ' ' ), CHAR(13), '' ), CHAR(10), '' ) ) AS docqa_answer FROM dual_occupancy_canberra_qanda where docqa_approved = 1 LIMIT $limit OFFSET $offset";
	$result = $fwDb->query($sql);

    http_response_code(200);

    echo json_encode([
        "status" => "success",
        "count" => count($result),
		"pagination" => [
			"page" => $page,
			"limit" => $limit,
			"total_records" => $totalRecords,
			"total_pages" => $totalPages,
			"previous" => ($page > 1),
			"next" => ($page < $totalPages)
		],
        "data" => $result
    ], JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);

} catch (Exception $e) {

    http_response_code(500);

    echo json_encode([
        "status" => "error",
        "message" => "Database operation failed.",
        "debug" => $e->getMessage()
    ]);
}

exit;
?>