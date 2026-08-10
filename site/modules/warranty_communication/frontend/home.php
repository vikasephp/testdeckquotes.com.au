<?php

$where = ' WHERE 1=1';
$fwViewData['report'] = "Clients";
$fwViewData['show'] = 1;

//if(isset($_SESSION['report'])) { $fwViewData['report'] = $_SESSION['report'] ; }

$fwViewData['clients'] = MODULES_DIR.$BASEFOLDER.'/frontend/clients.tpl';
$fwViewData['trades'] = MODULES_DIR.$BASEFOLDER.'/frontend/trades.tpl';

$clients = $fwRequest->getParam('clients', '');
if($clients) {
	unset($_SESSION['show']);
	unset($_SESSION['where']);
	unset($_SESSION['report']);
	
	$fwViewData['show'] = 1;
	$_SESSION['show'] = 1;
	
	$where = " where 1 = 1";
	$_SESSION['where'] = " where 1 = 1" ;
	
	$fwViewData['report'] = "Clients";
	$_SESSION['report'] = "Clients";
	
}

$trades = $fwRequest->getParam('trades', '');
if($trades) {
	unset($_SESSION['show']);
	unset($_SESSION['where']);
	unset($_SESSION['report']);
	
	$fwViewData['show'] = 2;
	$_SESSION['show'] = 2;
	
	$where =  " where 1 = 1";
	$_SESSION['where'] = " where 1 = 1" ;
	
	$fwViewData['report'] = "Trades";
	$_SESSION['report'] = "Trades";
	
}

$emailModulesArray = ["site.inpsection_warranty_log_schedule_reminder", "inspection_warranty_log.home", "inspection_warranty_log.view_log_detail", "warranty_log_daily_trade_notification"];

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
	//echo $project_name." <br/>"; exit('checking project name');
}

$clear = $fwRequest->getParam('clear', '');
if ($clear) {
    unset($_SESSION['communication_type']);
    unset($_SESSION['project_name']);
	unset($_SESSION['show']);
	unset($_SESSION['where']);
	unset($_SESSION['report']);
	//$fwViewData['report'] = 'Clients';
}

if (isset($_SESSION['communication_type'])) {
    $where .= ' AND communication_type = "' . $_SESSION['communication_type'] . '"';
    $fwViewData['communication_type'] = $_SESSION['communication_type'];
}
if (isset($_SESSION['project_name'])) {
	$sql_project_bsn_id = 'Select bsn_id from business where business.bsn_name LIKE "%' . $_SESSION['project_name'] . '%"';
	$data_project_bsn_id = $fwDb->queryOne($sql_project_bsn_id);
	
    //$where .= ' AND wa_project LIKE "%' . $_SESSION['project_name'] . '%"';
	$where .= ' AND column_id = '.$data_project_bsn_id['bsn_id'];
    $fwViewData['project_name'] = $_SESSION['project_name'];
}

if ($fwViewData['show'] == 1) {
    $where .= ' AND module_name != "warranty_log_daily_trade_notification"';
} else {
    $where .= ' AND module_name = "warranty_log_daily_trade_notification"';
}

$mainQuery = 'SELECT * FROM (
        SELECT
            ELN.id AS id,
            ELN.module_name AS module_name,
            ELN.column_id AS column_id,
            ELN.column_name AS column_name,
            ELN.email_to AS email_to,
            ELN.response_success AS response_success,
            ELN.response_message AS response_message,
            ELN.created_at AS created_at,
            "Email" AS communication_type
        FROM
            email_log_new AS ELN
        WHERE
            ELN.module_name IN ("' . implode('","', $emailModulesArray) . '")
            
        UNION ALL

        SELECT
            SL.id AS id,
            SL.module_name AS module_name,
            SL.column_id AS column_id,
            SL.column_name AS column_name,
            SL.email_to AS email_to,
            SL.response_success AS response_success,
            SL.response_message AS response_message,
            SL.created_at AS created_at,
            "Sms" AS communication_type
        FROM
            sms_log AS SL
        WHERE
            SL.module_name IN ("' . implode('","', $emailModulesArray) . '")
    ) AS combined_logs
    ' . $where . '    
    ORDER BY
        created_at desc';

$records = $fwDb->query($mainQuery);

$wa_id_array = [];
$bsn_id_array = [];
foreach($records as $row) {
    if($row['column_name'] == 'wa_id') {
        $wa_id_array[] = $row['column_id'];
    } elseif($row['column_name'] == 'bsn_id') {
        $bsn_id_array[] = $row['column_id'];
    }
}

$sql = 'SELECT wa_id, wa_project FROM warranty_log WHERE wa_id IN (' . implode(',', $wa_id_array) . ')';
$result = $fwDb->query($sql);
$wa_project_array = [];
foreach($result as $row) {
    $wa_project_array[$row['wa_id']] = $row['wa_project'];
}

$sql = 'SELECT bsn_id, bsn_name FROM business WHERE bsn_id IN (' . implode(',', $bsn_id_array) . ')';
$result = $fwDb->query($sql);
$bsn_name_array = [];
foreach($result as $row) {
    $bsn_name_array[$row['bsn_id']] = $row['bsn_name'];
}

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
    $project_name = $row['column_name'] == 'wa_id' ? $wa_project_array[$row['column_id']] : $bsn_name_array[$row['column_id']];
    $data = [
        'email_id' => $row['id'],
        'communication_type' => $row['communication_type'],
        'sent_datetime' => date('d-M-Y h:i:s a', strtotime($row['created_at'])),
        'client_name' => $clientName,
        'client_contact' => $clientContact,
        'related_log' => $row['column_id'],
        'project_name' => $project_name,
        'delivery_status' => $row['response_success'] == 1 ? 'Sent' : $row['response_message'],
        'message_content' => '<a href="' . $viewMessageUrl . '" class="various">View</a>',
    ];
    $list[] = $data;
}
$fwViewData['list'] = $list;

$fwViewData['title'] = $MODULE_PLURAL;
