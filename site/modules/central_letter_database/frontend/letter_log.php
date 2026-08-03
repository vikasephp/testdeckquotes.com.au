<?php
/*
<fusedoc fuse="letter_log.php">
	<responsibilities>
		I display letter email sending history
	</responsibilities>
</fusedoc>
*/

// Get letter ID from URL parameters
$recordId = $fwRequest->getParam('record_id', 0);

// Get page number from URL parameters
$pagenum = $fwRequest->getparam('pagenum','');

// Debug: Check URL parameters
error_log("Debug - RecordId: $recordId, PageNum: $pagenum");

// Fallback: Try to get record_id from other possible parameter names
if (empty($recordId)) {
    $recordId = $fwRequest->getParam('id', 0);
    error_log("Debug - Trying 'id' parameter: $recordId");
}

if (empty($recordId)) {
    $recordId = $fwRequest->getParam('cld_id', 0);
    error_log("Debug - Trying 'cld_id' parameter: $recordId");
}

if (empty($recordId)) {
    $recordId = $fwRequest->getParam('recordId', 0);
    error_log("Debug - Trying 'recordId' parameter: $recordId");
}

// Fetch log entries using direct SQL like home.php
$sql = "SELECT * FROM letter_email_log WHERE cld_id = " . $recordId . " ORDER BY elog_date DESC";
$allLogEntries = $fwDb->query($sql);

$fwViewData['debug_sql'] = $sql;

// Pass recordId to template
$fwViewData['recordId'] = $recordId;

// Pagination logic
if (!empty($allLogEntries)) {
    if (!(isset($pagenum))) {
        $pagenum = 1;
    }
    
    $rows = count($allLogEntries);
    $page_rows = 10; // Show 10 entries per page
    $last = ceil($rows/$page_rows);
    
    if ($pagenum <= 1) {
        $pagenum = 1;
    }
    elseif ($pagenum > $last) {
        $pagenum = $last;
    }
    
    $numstartvounter = $page_rows * ($pagenum-1) + 1;
    $fwViewData['numstartvounter'] = $numstartvounter;
    
    $fwViewData['last'] = $last;
    $fwViewData['lastone'] = $last-1;
    $fwViewData['lasttow'] = $last-2;
    $fwViewData['pagenum'] = $pagenum;
    
    // Build pagination arrays - only generate pages with actual data
    $pagenatedatanext = $pagenum;
    $pagenatedataprev = $pagenum;
    
    // Next pages array - only generate up to $last
    for($i=0; $i<9 && $pagenatedatanext <= $last; $i++) {
        $paginate[$pagenatedatanext] = $pagenatedatanext;
        $pagenatedatanext++;
    }
    $fwViewData['paginatenext'] = $paginate;
    
    // Previous pages array - only generate down to 1
    $pagenatedataprev = $pagenum;    
    for($i=0; $i<9 && $pagenatedataprev >= 1; $i++) {
        $paginateprev[$pagenatedataprev] = $pagenatedataprev;
        $pagenatedataprev--;
    }
    $fwViewData['paginateprev'] = array_reverse($paginateprev);
    
    // Apply limit to get current page entries
    $offset = ($pagenum - 1) * $page_rows;
    $logEntries = array_slice($allLogEntries, $offset, $page_rows);
    
    // Parse JSON elog_to field for each log entry (after pagination)
    foreach ($logEntries as &$logEntry) {
        if (!empty($logEntry['elog_to'])) {
            $toData = json_decode($logEntry['elog_to'], true);
            if (is_array($toData)) {
                $logEntry['elog_to_array'] = $toData;
            } else {
                $logEntry['elog_to_array'] = [];
               
            }
        } else {
            $logEntry['elog_to_array'] = [];
        }

        if (!empty($logEntry['elog_cc'])) {
            $toData = json_decode($logEntry['elog_cc'], true);
            if (is_array($toData)) {
                $logEntry['elog_cc_array'] = $toData;
            } else {
                $logEntry['elog_cc_array'] = [];
               
            }
        } else {
            $logEntry['elog_cc_array'] = [];
        }
    }
    

// Debug: Check if elog_to_array exists in first entry
if (!empty($logEntries)) {
    // echo "<br>Debug - First entry elog_to_array: ";
    // print_r($logEntries[0]['elog_to_array'] ?? 'NOT SET');
    // echo "<br>";
}
    // Debug: Check data availability
    if (empty($logEntries)) {
        // If no data on this page, try to find the last page with data
        $lastPageWithData = ceil(count($allLogEntries) / $page_rows);
        if ($pagenum > $lastPageWithData && $lastPageWithData > 0) {
            $pagenum = $lastPageWithData;
            $offset = ($pagenum - 1) * $page_rows;
            $logEntries = array_slice($allLogEntries, $offset, $page_rows);
            $fwViewData['pagenum'] = $pagenum;
            error_log("Pagination Debug - Redirected to page $pagenum, new offset: $offset");
        }
    }
} else {
    $logEntries = [];
    // Set default pagination values for empty data
    $fwViewData['last'] = 1;
    $fwViewData['lastone'] = 0;
    $fwViewData['lasttow'] = 0;
    $fwViewData['pagenum'] = 1;
    $fwViewData['paginateprev'] = [];
    $fwViewData['paginatenext'] = [];
}

// Get letter details for context
$letterTable = new Fw_Db_Table('central_letter_database');
$letterTable->setWhere('cld_id = ' . $recordId);
$letterDetails = $letterTable->getRow();

// Get user details
$userTable = new Fw_Db_Table('users');
$users = [];
foreach ($userTable->getAllRows() as $user) {
    $users[$user['user_id']] = $user['user_name'];
}

// Process log entries to handle comma-separated files
foreach ($logEntries as &$log) {
    // Split additional_files and attachments into arrays
    if (!empty($log['additional_files'])) {
        $log['additional_files_array'] = explode(',', $log['additional_files']);
    }
    if (!empty($log['attachments'])) {
        $log['attachments_array'] = explode(',', $log['attachments']);
    }
}

$fwViewData['logEntries'] = $logEntries;
$fwViewData['letterDetails'] = $letterDetails;
$fwViewData['users'] = $users;
$fwViewData['letterId'] = $recordId;
$fwViewData['title'] = 'Letter Email Log';

// Set page title
$fwMainView = 'file:' . getcwd() . '/letter_log.tpl';
?>