<?php
header('Content-Type: application/json');

$sql = "SELECT * FROM openapi_key where oak_id = 1"; 
$data = $fwDb->queryOne($sql);



$apiKey = $data['oak_key'];

$content = isset($_POST['content']) ? trim($_POST['content']) : '';

if ($content == '') {
    echo json_encode([
        "success" => false,
        "message" => "No content received"
    ]);
    exit;
}

$prompt = <<<PROMPT
You are an expert business content editor.

Rewrite and professionally format the following HTML.

Rules:
- Preserve the meaning.
- Correct grammar and spelling.
- Add headings if appropriate.
- Convert suitable items into bullet points.
- Split long paragraphs.
- Return valid HTML only.
- Do not explain changes.

Content:

$content
PROMPT;


$data = [
    "model" => "gpt-5-mini",
    "input" => $prompt
];


$ch = curl_init("https://api.openai.com/v1/responses");

curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POST, true);

curl_setopt($ch, CURLOPT_HTTPHEADER, [
    "Authorization: Bearer " . $apiKey,
    "Content-Type: application/json"
]);

curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));


$response = curl_exec($ch);


if ($response === false) {

    echo json_encode([
        "success" => false,
        "message" => curl_error($ch)
    ]);

    curl_close($ch);
    exit;
}


$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

curl_close($ch);


$result = json_decode($response, true);

$formatted = '';

if (!empty($result['output'])) {

    foreach ($result['output'] as $item) {

        if (!empty($item['content'])) {

            foreach ($item['content'] as $contentItem) {

                if (
                    isset($contentItem['type']) &&
                    $contentItem['type'] === 'output_text'
                ) {
                    $formatted .= $contentItem['text'];
                }

            }

        }

    }

}


if ($formatted == '') {

    echo json_encode([
        "success" => false,
        "message" => "No formatted response received"
    ]);

    exit;

}


echo json_encode([
    "success" => true,
    "content" => $formatted
]);

exit;