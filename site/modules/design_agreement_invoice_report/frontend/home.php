<?php
$pagenum = $fwRequest->getparam('pagenum', '');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('business_sellers');
$tabletask = new Fw_Db_Table('business_tasks');
$tableBusiness = new Fw_Db_Table('business');

$fwViewData['ran'] =  rand(100000, 999999);
$where = ' Where business.bsn_dair_hide = 0';

$user = $_SESSION['user']['user_name'];
$dt = date('d-m-Y');

$showhidden = $fwRequest->getParam('showhidden', '');
if (!empty($showhidden)) {
    $where = ' Where 1 = 1';
}

$hide = $fwRequest->getParam('hide', '');
if ($hide) {
    $keys_2 = array_keys($hide);
    $ky_2 = $keys_2[0];
    $val_2 = $hide[$ky_2];

    $detail['bsn_dair_hide'] = $val_2;

    $tableBusiness->setWhere("bsn_id = " . $ky_2);
    if ($tableBusiness->rowExists()) {
        $this_id = $tableBusiness->updateRow($detail);
    }
}

$clear_search = $fwRequest->getParam('clear_search', '');
if (!empty($clear_search)) {
    unset($_SESSION['address']);
    unset($_SESSION['client']);
} else {
    $address = $fwRequest->getParam('address', '');
    if ($address):
        $where .= " AND  business.bsn_name LIKE '%" . $address . "%'";
        $_SESSION['address'] = $address;
    elseif (isset($_SESSION['address'])):
        $where .= " AND business.bsn_name LIKE '%" . $_SESSION['address'] . "%' ";
    endif;

    $client = $fwRequest->getParam('client', '');
    if ($client):
        $where .= " AND  bus_customers.bcust_fname LIKE '%" . $client . "%'";
        $_SESSION['client'] = $client;
    elseif (isset($_SESSION['client'])):
        $where .= " AND bus_customers.bcust_fname LIKE '%" . $_SESSION['client'] . "%' ";
    endif;
}



$clear = $fwRequest->getParam('clear', '');
if (!empty($clear)) {
    unset($_SESSION['invoice_status']);
    unset($_SESSION['paytment_status']);
} else {
    $invoice_status = $fwRequest->getParam('invoice_status', '');
    if ($invoice_status):
        $where .= " AND  business.bsn_dair_inv_status = " . $invoice_status . "";
        $_SESSION['invoice_status'] = $invoice_status;
    elseif ($_SESSION['invoice_status']):
        $where .= " AND business.bsn_dair_inv_status = " . $_SESSION['invoice_status'] . "";
    endif;

    $paytment_status = $fwRequest->getParam('paytment_status', '');
    if ($paytment_status):
        $where .= " AND  business.bsn_dair_pay_status = " . $paytment_status;
        $_SESSION['paytment_status'] = $paytment_status;
    elseif ($_SESSION['paytment_status']):
        $where .= " AND business.bsn_dair_pay_status = " . $_SESSION['paytment_status'];
    endif;
}

$total_record = 0;
// $totalProjectQuery = "SELECT business_sellers.bs_business_id, document_check_list.doc_date_uploaded FROM business_sellers INNER JOIN document_check_list ON business_sellers.bs_business_id = document_check_list.doc_bsn_id WHERE (document_check_list.doc_name_id = 45 AND document_check_list.doc_date_uploaded != '0000-00-00 00:00:00') GROUP BY business_sellers.bs_business_id ORDER BY document_check_list.doc_date_uploaded DESC";

// $projectData = $fwDb->query($totalProjectQuery);
// $bsnIDArr = [];
// $dateUploadedArr = [];
// foreach($projectData as $row){
//     $bsnIDArr[] = $row['bs_business_id'];
//     $dateUploadedArr[$row['bs_business_id']] = $row['doc_date_uploaded'];
// }

$query = "SELECT business_sellers.bs_business_id, document_check_list.doc_date_uploaded, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, business.bsn_id, business.bsn_name, business.bsn_sub_status,business.bsn_status_sys_date, business.bsn_address, business.bsn_dair_dasd, business.bsn_dair_pdd , business.bsn_dair_inv_status, business.bsn_dair_invoice_num, business.bsn_dair_invoice, business.bsn_dair_invoice_date, business.bsn_dair_amount, business.bsn_dair_pay_status, business.bsn_dair_pay_date, business.bsn_dair_hide, business.bsn_dair_type, business.bsn_dair_agree_sent, business.bsn_dair_notes FROM business_sellers INNER JOIN document_check_list ON business_sellers.bs_business_id = document_check_list.doc_bsn_id INNER JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id INNER JOIN business ON business_sellers.bs_business_id = business.bsn_id " . $where . " AND document_check_list.doc_name_id = 45 AND document_check_list.doc_date_uploaded != '0000-00-00 00:00:00' GROUP BY business_sellers.bs_business_id ORDER BY document_check_list.doc_date_uploaded DESC;";
// $query = "SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, business.bsn_id, business.bsn_name, business.bsn_sub_status,business.bsn_status_sys_date, business.bsn_address, business.bsn_dair_dasd, business.bsn_dair_pdd , business.bsn_dair_inv_status, business.bsn_dair_invoice_num, business.bsn_dair_invoice, business.bsn_dair_invoice_date, business.bsn_dair_amount, business.bsn_dair_pay_status, business.bsn_dair_pay_date, business.bsn_dair_hide, business.bsn_dair_type, business.bsn_dair_agree_sent, business.bsn_dair_notes FROM business_sellers INNER JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id INNER JOIN business ON business_sellers.bs_business_id = business.bsn_id " . $where . " AND business.bsn_id IN (" . implode(',', $bsnIDArr) . ") GROUP BY business_sellers.bs_business_id";
$userDatacount = $fwDb->query($query);
if (!empty($userDatacount)) {
    $total_record = count($userDatacount);
}

if (!empty($total_record)) {

    if (!(isset($pagenum))) {
        $pagenum = 1;
    }

    $rows = $total_record;

    // $page_rows = 10;
    $page_rows = 200;
    $last = ceil($rows / $page_rows);

    if ($pagenum <= 1) {
        $pagenum = 1;
    } elseif ($pagenum > $last) {
        $pagenum = $last;
    }
    $numstartvounter =  $page_rows * ($pagenum - 1) + 1;
    $fwViewData['numstartvounter'] = $numstartvounter;

    $fwViewData['last'] = $last;
    $fwViewData['lastone'] = $last - 1;
    $fwViewData['lasttow'] = $last - 2;
    $fwViewData['pagenum'] = $pagenum;
    $fwViewData['page_rows'] = $page_rows;
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

    $startPoint = $page_rows * ($pagenum - 1);
    $endPoint = $startPoint + $page_rows - 1;
    // $userData = $fwDb->query($query . $max);
    // db($userData, 'userData');
    $result = [];
    for ($i = $startPoint; $i <= $endPoint; $i++) {
        if (isset($userDatacount[$i])) {
            $sql214 = "SELECT doc_file_name FROM document_check_list WHERE doc_name_id = 214 AND doc_bsn_id =" . (int)$userDatacount[$i]['bsn_id'];
            $data214 = $fwDb->queryOne($sql214);

            $result[] = [
                'sn' => $i + 1,
                // 'doc_date_uploaded' => $dateUploadedArr[$user_rt_v['bs_business_id']],
                'doc_date_uploaded' => $userDatacount[$i]['doc_date_uploaded'],
                'bs_business_id' => $userDatacount[$i]['bs_business_id'],
                'bs_customers_id' => $userDatacount[$i]['bs_business_id'],
                'bcust_fname' => $userDatacount[$i]['bcust_fname'],
                'bcust_lname' => $userDatacount[$i]['bcust_lname'],
                'bsn_id' => $userDatacount[$i]['bsn_id'],
                'bsn_name' => $userDatacount[$i]['bsn_name'],
                'bsn_sub_status' => $userDatacount[$i]['bsn_sub_status'],
                'bsn_status_sys_date' => $userDatacount[$i]['bsn_status_sys_date'],
                'bsn_address' => $userDatacount[$i]['bsn_address'],
                'bsn_dair_dasd' => $userDatacount[$i]['bsn_dair_dasd'],
                'bsn_dair_pdd' => $userDatacount[$i]['bsn_dair_pdd'],
                'bsn_dair_inv_status' => $userDatacount[$i]['bsn_dair_inv_status'],
                'bsn_dair_invoice_num' => $userDatacount[$i]['bsn_dair_invoice_num'],
                'bsn_dair_invoice' => $userDatacount[$i]['bsn_dair_invoice'],
                'bsn_dair_invoice_date' => $userDatacount[$i]['bsn_dair_invoice_date'],
                'bsn_dair_amount' => $userDatacount[$i]['bsn_dair_amount'],
                'bsn_dair_pay_status' => $userDatacount[$i]['bsn_dair_pay_status'],
                'bsn_dair_pay_date' => $userDatacount[$i]['bsn_dair_pay_date'],
                'bsn_dair_hide' => $userDatacount[$i]['bsn_dair_hide'],
                'bsn_dair_type' => $userDatacount[$i]['bsn_dair_type'],
                'bsn_dair_agree_sent' => $userDatacount[$i]['bsn_dair_agree_sent'],
                'bsn_dair_notes' => $userDatacount[$i]['bsn_dair_notes'],
                'doc_file_name_214' => $data214['doc_file_name'],
                'link' => $BASE_URL . "business.detail/bsn_id/" . $userDatacount[$i]['bsn_id'],
            ];
        }
    }
    // foreach ($userData as $user_k => $user_rt_v) {
    //     $sql214 = "SELECT doc_file_name FROM document_check_list WHERE doc_name_id = 214 AND doc_bsn_id =" . (int)$user_rt_v['bsn_id'];
    //     $data214 = $fwDb->queryOne($sql214);

    //     $result[] = [
    //         'sn' => $page_rows * ($pagenum - 1) + ($user_k + 1),
    //         // 'doc_date_uploaded' => $dateUploadedArr[$user_rt_v['bs_business_id']],
    //         'doc_date_uploaded' => $user_rt_v['doc_date_uploaded'],
    //         'bs_business_id' => $user_rt_v['bs_business_id'],
    //         'bs_customers_id' => $user_rt_v['bs_business_id'],
    //         'bcust_fname' => $user_rt_v['bcust_fname'],
    //         'bcust_lname' => $user_rt_v['bcust_lname'],
    //         'bsn_id' => $user_rt_v['bsn_id'],
    //         'bsn_name' => $user_rt_v['bsn_name'],
    //         'bsn_sub_status' => $user_rt_v['bsn_sub_status'],
    //         'bsn_status_sys_date' => $user_rt_v['bsn_status_sys_date'],
    //         'bsn_address' => $user_rt_v['bsn_address'],
    //         'bsn_dair_dasd' => $user_rt_v['bsn_dair_dasd'],
    //         'bsn_dair_pdd' => $user_rt_v['bsn_dair_pdd'],
    //         'bsn_dair_inv_status' => $user_rt_v['bsn_dair_inv_status'],
    //         'bsn_dair_invoice_num' => $user_rt_v['bsn_dair_invoice_num'],
    //         'bsn_dair_invoice' => $user_rt_v['bsn_dair_invoice'],
    //         'bsn_dair_invoice_date' => $user_rt_v['bsn_dair_invoice_date'],
    //         'bsn_dair_amount' => $user_rt_v['bsn_dair_amount'],
    //         'bsn_dair_pay_status' => $user_rt_v['bsn_dair_pay_status'],
    //         'bsn_dair_pay_date' => $user_rt_v['bsn_dair_pay_date'],
    //         'bsn_dair_hide' => $user_rt_v['bsn_dair_hide'],
    //         'bsn_dair_type' => $user_rt_v['bsn_dair_type'],
    //         'bsn_dair_agree_sent' => $user_rt_v['bsn_dair_agree_sent'],
    //         'bsn_dair_notes' => $user_rt_v['bsn_dair_notes'],
    //         'doc_file_name_214' => $data214['doc_file_name'],
    //         'link' => $BASE_URL . "business.detail/bsn_id/" . $user_rt_v['bsn_id'],
    //     ];

    // }

    // if(empty($result)){
    //     echo "record does not exists";
    // }
    // db($result, 'result');
    $fwViewData['list'] =  $result;
}

$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Design Agreement Invoices Report";

$sqlst = "Select * from design_agr_inv_status";
$fwViewData['stdata'] = $fwDb->query($sqlst);

$sqlpay = "Select * from design_agr_inv_pament";
$fwViewData['paydata'] = $fwDb->query($sqlpay);

$sqlst = "Select * from design_agr_inv_type";
$fwViewData['typedata'] = $fwDb->query($sqlst);

$fwViewData['address'] = $_SESSION['address'] ?? '';
$fwViewData['client'] = $_SESSION['client'] ?? '';
$fwViewData['invoice_status'] = $_SESSION['invoice_status'] ?? '';
$fwViewData['paytment_status'] = $_SESSION['paytment_status'] ?? '';

// Export to Excel
$export = $fwRequest->getParam('export', 0);

if (!empty($export)) {
    require BASE_DIR . "PHPExcel/SimpleXLSXGen/SimpleXLSXGen.php";
    $my_excel_data = [];
    $title =  [
        '<b>Project Address</b>',
        '<b>Project Status</b>',
        '<b>Sent Date</b>',
        '<b>Date Uploaded</b>',
        '<b>Design Agreement Signed Date</b>',
        '<b>Proposal Document Date</b>',
        '<b>Type</b>',
        '<b>Invoice Status </b>',
        '<b>Invoice Number</b>',
        '<b>Invoice Date</b>',
        '<b>Amount</b>',
        '<b>Payment Date </b>',
        '<b>Payment Status</b>'
    ];

    array_push($my_excel_data, $title);

    $result = [];
    foreach ($userDatacount as $user_k => $v) {
        $proj = $v['bcust_fname'] . ' ' . $v['bcust_lname'] . "\n" . $v['bsn_address'];

        $sql_1 = "Select * from design_agr_inv_type where dt_id = " . $v['bsn_dair_type'];
        $typedata =  $fwDb->queryOne($sql_1);

        $sql_2 = "Select * from design_agr_inv_status where st_id = " . $v['bsn_dair_inv_status'];
        $statusdata =  $fwDb->queryOne($sql_2);

        $sql_3 = "Select * from design_agr_inv_pament where dp_id = " . $v['bsn_dair_pay_status'];
        $paymentdata =  $fwDb->queryOne($sql_3);

        $values =    [
            $proj,
            $v['bsn_sub_status'],
            $v['bsn_dair_agree_sent'],
            $v['doc_date_uploaded'],
            $v['bsn_dair_dasd'],
            $v['bsn_dair_pdd'],
            $typedata['dt_option'],
            $statusdata['st_option'],
            $v['bsn_dair_invoice'],
            $v['bsn_dair_invoice_date'],
            $v['bsn_dair_amount'],
            $v['bsn_dair_pay_date'],

            $paymentdata['dp_option']
        ];
        array_push($my_excel_data, $values);
    }

    $xlsx = Shuchkin\SimpleXLSXGen::fromArray($my_excel_data)->downloadAs('Design_agree_inv_report.xlsx');;
    exit;
}
