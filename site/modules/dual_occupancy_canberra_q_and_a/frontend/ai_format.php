<?php

header('Content-Type: application/json');

$data = json_decode(
    file_get_contents("php://input"),
    true
);

$content = isset($data['content']) ? $data['content'] : '';

echo json_encode([
    "html" => $content
]);

exit;