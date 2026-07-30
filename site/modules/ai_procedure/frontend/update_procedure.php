<?php
require_once(LIB_DIR . 'AIClass.php');

header('Content-Type: application/json');

$response = ['success' => false, 'message' => 'Invalid request'];
$postedData = $_POST;

if (!empty($postedData['action']) && $postedData['action'] === 'saveProcedureDocument') {
    $pd = trim($postedData['pd'] ?? '');
    $documentJson = $postedData['document'] ?? '';
    $document = json_decode($documentJson, true);

    if ($pd !== '' && is_array($document)) {
        $document['pp_edited_by'] = $_SESSION['user']['user_name'] ?? '';
        $aiObject = new AIClass();
        $result = $aiObject->putProcedureDocument($pd, $document);

        if (is_array($result) && (($result['status'] ?? '') === 'ok' || ($result['success'] ?? false) === true)) {
            $response = ['success' => true, 'message' => 'Procedure saved', 'data' => $result];
        } else {
            $response = [
                'success' => false,
                'message' => is_array($result) ? ($result['message'] ?? 'Save failed') : 'Save failed',
                'data' => $result,
            ];
        }
    } else {
        $response = ['success' => false, 'message' => 'Invalid procedure document payload'];
    }
}

echo json_encode($response);
exit;
