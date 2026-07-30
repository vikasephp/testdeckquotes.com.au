<?php

/**
 * Main Execution Block
 * This is called immediately when the file is accessed via AJAX
 */
function get_revision_history() {
    // 1. Get the combined ID from the AJAX POST request
    $combinedId = isset($_POST['ids']) ? $_POST['ids'] : null;
    $token = '4wPJY2bmirNZ57AueJwwvRRh8vFeMBFY1iC92'; // Your Smartsheet Token

    // Clear any previous output buffers to ensure clean JSON
    if (ob_get_length()) ob_clean();
    header('Content-Type: application/json');

    if (!$combinedId) {
        echo json_encode(['success' => false, 'message' => 'No IDs provided']);
        exit;
    }

    // 2. Parse the string (Format: "sheetId-rowId-columnId")
    $parts = explode('-', $combinedId);
    if (count($parts) < 3) {
        echo json_encode(['success' => false, 'message' => 'Invalid ID format']);
        exit;
    }

    $sheetId  = $parts[0];
    $rowId    = $parts[1];
    $columnId = $parts[2];

    // 3. Call the helper function (Direct call, no $this->)
    $previousDate = getPreviousDateValue($sheetId, $rowId, $columnId, $token);

    if ($previousDate) {
        echo json_encode([
            'success' => true,
            'previous_date' => $previousDate
        ]);
    } else {
        echo json_encode([
            'success' => false,
            'message' => 'No previous history found'
        ]);
    }
    exit;
}

/**
 * Helper Function to query Smartsheet API
 */
function getPreviousDateValue($sheetId, $rowId, $columnId, $token) {
    $url = "https://api.smartsheet.com/2.0/sheets/$sheetId/rows/$rowId/columns/$columnId/history";
    
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        "Authorization: Bearer $token",
        "Content-Type: application/json"
    ]);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 10); 
    
    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode === 200 && $response) {
        $history = json_decode($response, true);

        if (!empty($history['data']) && count($history['data']) > 1) {
            // Sort by modified date descending (newest first)
            usort($history['data'], function($a, $b) {
                return strtotime($b['modifiedAt']) - strtotime($a['modifiedAt']);
            });

            // Index 1 is the most recent previous value
            $previous = $history['data'][1] ?? null;

            if ($previous) {
                $prevValue = $previous['displayValue'] ?? $previous['value'] ?? null;
                // Return formatted date
                return $prevValue ? date('d-m-Y', strtotime($prevValue)) : null;
            }
        }
    }
    return null;
}

// EXECUTE THE CORE FUNCTION
get_revision_history();