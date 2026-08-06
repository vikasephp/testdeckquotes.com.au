<?php

$where = ' WHERE 1=1';

$emailModulesArray = ["site.inpsection_warranty_log_schedule_reminder", "inspection_warranty_log.home", "inspection_warranty_log.view_log_detail"];

$query = "SELECT DISTINCT wa_project from warranty_log";
$fwViewData['project_data'] = $fwDb->query($query);

$communication_type = $fwRequest->getParam('communication_type', '');
$search_communication_type = $fwRequest->getParam('search_communication_type', '');
if ($communication_type && $search_communication_type) {
    $_SESSION['communication_type'] = $communication_type;
}
$project_name = $fwRequest->getParam('project_name', '');
$search_project_name = $fwRequest->getParam('search_project_name', '');
if ($project_name && $search_project_name) {
    $_SESSION['project_name'] = $project_name;
}

$clear = $fwRequest->getParam('clear', '');
if ($clear) {
    unset($_SESSION['communication_type']);
    unset($_SESSION['project_name']);
}

if (isset($_SESSION['communication_type'])) {
    $where .= ' AND communication_type = "' . $_SESSION['communication_type'] . '"';
    $fwViewData['communication_type'] = $_SESSION['communication_type'];
}
if (isset($_SESSION['project_name'])) {
    $where .= ' AND wa_project LIKE "%' . $_SESSION['project_name'] . '%"';
    $fwViewData['project_name'] = $_SESSION['project_name'];
}


$mainQuery = 'SELECT * FROM (
        SELECT
            ELN.id AS id,
            ELN.module_name AS module_name,
            ELN.column_id AS column_id,
            ELN.email_to AS email_to,
            ELN.response_success AS response_success,
            ELN.created_at AS created_at,
            WL.wa_id AS wa_id,
            WL.wa_project AS wa_project,
            "Email" AS communication_type
        FROM
            email_log_new AS ELN
        INNER JOIN
            warranty_log as WL
        ON
            WL.wa_id = ELN.column_id AND ELN.column_name = "wa_id"
        WHERE
            ELN.module_name IN ("' . implode('","', $emailModulesArray) . '")
            
        UNION ALL

        SELECT
            SL.id AS id,
            SL.module_name AS module_name,
            SL.column_id AS column_id,
            SL.email_to AS email_to,
            SL.response_success AS response_success,
            SL.created_at AS created_at,
            WL.wa_id AS wa_id,
            WL.wa_project AS wa_project,
            "Sms" AS communication_type
        FROM
            sms_log AS SL
        INNER JOIN
            warranty_log as WL
        ON
            WL.wa_id = SL.column_id AND SL.column_name = "wa_id"
        WHERE
            SL.module_name IN ("' . implode('","', $emailModulesArray) . '")
    ) AS combined_logs
    ' . $where . '    
    ORDER BY
        created_at desc';
// db($mainQuery);
$records = $fwDb->query($mainQuery);

if (!empty($records)) {
    if (!(isset($pagenum))) {
        $pagenum = 1;
    }
    $rows = count($records);
    $page_rows = 200;
    $last = ceil($rows / $page_rows);
    if ($pagenum <= 1) {
        $pagenum = 1;
    } elseif ($pagenum > $last) {
        $pagenum = $last;
    }
    $fwViewData['last'] = $last;
    $fwViewData['lastone'] = $last - 1;
    $fwViewData['lasttow'] = $last - 2;
    $fwViewData['pagenum'] = $pagenum;
    $pagenatedatanext = $pagenum;
    $pagenatedataprev = $pagenum;
    for ($i = 0; $i < 9; $i++) {
        $paginate[$pagenatedatanext] = $pagenatedatanext;
        $pagenatedatanext++;
    }
    $fwViewData['paginatenext'] = $paginate;
    $pagenatedataprev = $pagenum;
    for ($i = 0; $i < 9; $i++) {
        $paginateprev[$pagenatedataprev] = $pagenatedataprev;
        $pagenatedataprev--;
    }
    $fwViewData['paginateprev'] = array_reverse($paginateprev);

    $max = ' LIMIT ' . ($pagenum - 1) * $page_rows . ',' . $page_rows;

    $sql2 =  $mainQuery . $max;
    $records = $fwDb->query($sql2);
}

$list = [];
foreach ($records as $row) {
    $clientDetails = json_decode($row['email_to'], true);
    // db($clientDetails);
    $clientName = implode('<br>', array_column($clientDetails, 'name'));
    $clientContact = implode('<br>', array_column($clientDetails, 'email'));
    $viewMessageUrl = BASE_URL . $BASEFOLDER . '.view_message/id/' . $row['id'] . '/type/' . strtolower($row['communication_type']);
    $data = [
        'email_id' => $row['id'],
        'communication_type' => $row['communication_type'],
        'sent_datetime' => date('d-M-Y h:i:s a', strtotime($row['created_at'])),
        'client_name' => $clientName,
        'client_contact' => $clientContact,
        'related_log' => $row['wa_id'],
        'project_name' => $row['wa_project'],
        'delivery_status' => $row['response_success'] == 1 ? 'Sent' : 'Failed',
        'message_content' => '<a href="' . $viewMessageUrl . '" class="various">View</a>',
    ];
    $list[] = $data;
}
$fwViewData['list'] = $list;

$fwViewData['title'] = $MODULE_PLURAL;
