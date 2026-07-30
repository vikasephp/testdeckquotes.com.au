<?php

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

  if ($httpCode === 404) return null;

    if ($httpCode === 200 && $response) {
        $history = json_decode($response, true);

        if (!empty($history['data']) && count($history['data']) > 1) {
            usort($history['data'], function($a, $b) {
                return strtotime($b['modifiedAt']) - strtotime($a['modifiedAt']);
            });

            $previous = $history['data'][1] ?? null;

            if ($previous) {
                $prevValue = $previous['displayValue'] ?? $previous['value'] ?? null;
                return $prevValue ? date('d-m-Y', strtotime($prevValue)) : null;
            }
        }
    }

    return null;
}

function formatRowData($row, $columnMapping, $columnTitleMap, $sheetId, $targetColumnId) {
    $rowData = [
        'ID'          => $row['id'],
        'created_at'  => isset($row['createdAt']) ? date('d-m-Y H:i', strtotime($row['createdAt'])) : '',
        'updated_at'  => isset($row['modifiedAt']) ? date('d-m-Y H:i', strtotime($row['modifiedAt'])) : '',
        'fetch_revised_date' => "$sheetId-{$row['id']}-$targetColumnId"
    ];

    $cellMap = [];
    foreach ($row['cells'] as $cell) {
        $cellMap[$cell['columnId']] = $cell;
    }

    foreach ($columnMapping as $columnTitle => $templateKey) {
        $columnId = $columnTitleMap[$columnTitle] ?? null;

        if ($columnId && isset($cellMap[$columnId])) {
            $cell = $cellMap[$columnId];

            if (strpos($templateKey, 'date') !== false && isset($cell['value'])) {
                $rowData[$templateKey] = date('d-m-Y', strtotime($cell['value']));
            } else {
                $rowData[$templateKey] = $cell['displayValue'] ?? $cell['value'] ?? '';
            }
        } else {
            $rowData[$templateKey] = '';
        }
    }

    return $rowData;
}

function fetchSmartsheetList($sheetId, $token, $columnMapping = [], $futureDaysLimit = 1) {
    $url = "https://api.smartsheet.com/2.0/sheets/" . $sheetId;
    
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, ["Authorization: Bearer " . $token, "Content-Type: application/json"]);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 10); 
    
    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode !== 200) return [];

    $data = json_decode($response, true);
    if (!isset($data['rows'], $data['columns'])) return [];

    $sheetIdasnumeris = $data['id'];

    $columnTitleMap = [];
    foreach ($data['columns'] as $col) {
        $columnTitleMap[$col['title']] = $col['id'];
    }

    $startDateColumnId = $columnTitleMap['Start Date'] ?? null;
    if (!$startDateColumnId) return [];

    $cleanRows = [];

    $todayTimestamp = strtotime(date('Y-m-d'));
    $twoWeekLater = strtotime('+14 days', $todayTimestamp); // including today

    foreach ($data['rows'] as $row) {

        $dateCell = null;
        foreach ($row['cells'] as $cell) {
            if ($cell['columnId'] == $startDateColumnId) {
                $dateCell = $cell;
                break;
            }
        }

        if (!$dateCell || !isset($dateCell['value'])) continue;

        $rowDate = strtotime($dateCell['value']);

        if ($rowDate >= $todayTimestamp && $rowDate <= $twoWeekLater) {
		//if ($rowDate >= $todayTimestamp){

            $formatted = formatRowData(
                $row,
                $columnMapping,
                $columnTitleMap,
                $sheetIdasnumeris,
                $startDateColumnId
            );

            $cleanRows[] = $formatted;
        }
    }

    return $cleanRows;
}

$thisTable = new Fw_Db_Table('business');

$sql = "SELECT b.bsn_id, b.bsn_address, b.bsn_smartsheet_link, p.elccp_bsn_id, p.elccp_bsn_id_status, p.elccp_created_at, p.elccp_updated_at, e.elcc_row_id, e.elcc_sync_status FROM business b LEFT JOIN event_log_clearing_center_project p ON b.bsn_id = p.elccp_bsn_id LEFT JOIN event_log_clearing_center e ON b.bsn_id = e.elcc_row_id WHERE b.bsn_smartsheet_link != '' AND b.bsn_id IN (3486, 11931, 11872)";

//$sql = "SELECT b.bsn_id, b.bsn_address, b.bsn_smartsheet_link, p.elccp_bsn_id, p.elccp_bsn_id_status, p.elccp_created_at, p.elccp_updated_at, e.elcc_row_id, e.elcc_sync_status FROM business b LEFT JOIN event_log_clearing_center_project p ON b.bsn_id = p.elccp_bsn_id LEFT JOIN event_log_clearing_center e ON b.bsn_id = e.elcc_row_id WHERE b.bsn_smartsheet_link != '' ";

$businesses = $fwDb->query($sql); 

$myAccessToken = '4wPJY2bmirNZ57AueJwwvRRh8vFeMBFY1iC92';
$mapping = [
    'Event' => 'event_name',
    'Start Date' => 'start_date'
];
$futureDaysLimit = 5;

$masterList = [];

foreach ($businesses as $bsn) {
	
    if ( (isset($_GET['p_show']) && $_GET['p_show'] == '1') ) {
       
    } elseif( (isset($_GET['p_show']) && $_GET['p_show'] == '2') ) {
       if($bsn['elccp_bsn_id_status'] == 0) continue;
    } else {
		if($bsn['elccp_bsn_id_status'] == 1) continue;
	}
	
    /* if ($show_hidden) {
       if($bsn['elccp_bsn_id_status'] == 1) continue;
    } else {
    }  */
	
    $link = $bsn['bsn_smartsheet_link'] ?? ''; 
    
    if (preg_match('/sheets\/([a-zA-Z0-9]+)/', $link, $matches)) {
      //echo "sheet_id :: ".  $currentSheetId = $matches[1];
	  $currentSheetId = $matches[1];
        
        $sheetEvents = fetchSmartsheetList($currentSheetId, $myAccessToken, $mapping, $futureDaysLimit);

        if(!empty($sheetEvents)){

            usort($sheetEvents, function($a, $b) {
                $dateA = strtotime($a['start_date']);
                $dateB = strtotime($b['start_date']);

                if ($dateA == $dateB) {
                    return 0;
                }
                return ($dateA < $dateB) ? -1 : 1;
            });

        }
       $masterList[] = [
                            "business_name"=>$bsn['bsn_address'],
                           "bsn_id"=>$bsn['bsn_id'],
                           "business_events"=>$sheetEvents,
                            'elccp_bsn_id_status' => $bsn['elccp_bsn_id_status'] ?? 0
                       ];
       
        
       /* foreach ($sheetEvents as &$event) {
            $event['business_name'] = $bsn['bsn_address'];
            $event['bsn_id'] = $bsn['bsn_id'];
        }*/

       // $masterList = array_merge($masterList, $sheetEvents);
    }

}

 //echo "<pre>"; print_r($masterList); echo "</pre>";


$rowIds = [];
foreach ($masterList as $business) {
    if (!empty($business['business_events'])) {
        $ids = array_column($business['business_events'], 'ID');
        $rowIds = array_merge($rowIds, $ids);
    }
}

if (!empty($rowIds)) {
    $rowIds = array_unique(array_filter($rowIds));
    $idList = implode(',', $rowIds);

    $sql = "SELECT * FROM event_log_clearing_center WHERE elcc_row_id IN ($idList)";
    $results = $fwDb->query($sql);

    $dataMap = [];
    foreach ($results as $r) {
        $dataMap[$r['elcc_row_id']] = [
            'elcc_reason'   => $r['elcc_reason'],
            'elcc_location' => $r['elcc_location'],
            'elcc_sync_status' => $r['elcc_sync_status'],
            'elcc_sync_updated_by' => $r['elcc_sync_updated_by'],
            'elcc_sync_updated_date' => $r['elcc_sync_updated_date'],
			'elcc_receive_email' => $r['elcc_receive_email']
        ];
    }

    foreach ($masterList as &$business) {
        if (!empty($business['business_events'])) {
            foreach ($business['business_events'] as &$event) {
                $id = $event['ID'];
                
                $event['elcc_reason']   = $dataMap[$id]['elcc_reason'] ?? '';
                $event['elcc_location'] = $dataMap[$id]['elcc_location'] ?? '';

                $event['elcc_sync_status'] = $dataMap[$id]['elcc_sync_status'] ?? '';
                $event['elcc_sync_updated_by'] = $dataMap[$id]['elcc_sync_updated_by'] ?? '';
                $event['elcc_sync_updated_date'] = $dataMap[$id]['elcc_sync_updated_date'] ?? '';
				$event['elcc_receive_email'] = $dataMap[$id]['elcc_receive_email'] ?? '';
            }
        }
    }
    unset($business, $event);
}

//echo "<pre>"; print_r($masterList); exit('checking');
$fwViewData['list'] = $masterList;

$fwViewData['title'] = $MODULE_PLURAL;
