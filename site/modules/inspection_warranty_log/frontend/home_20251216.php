<?php
require_once(MODULES_DIR . 'inspection_warranty_log/frontend/ServiceClass.php');

$pagenum = $fwRequest->getparamget('pagenum', 0);

$serviceObj = new ServiceClass;

// $query = 'SELECT DISTINCT iwl_bsn_id AS bsn_id FROM `inspection_warranty_log`';
// $result = $fwDb->query($query);
// $bsn_ids = [];
// foreach ($result as $row) {
//     $bsn_ids[] = $row['bsn_id'];
// }

// $query = 'SELECT DISTINCT iwl_bcust_id AS bcust_id FROM `inspection_warranty_log`';
// $result = $fwDb->query($query);
// $bcust_ids = [];
// foreach ($result as $row) {
//     $bcust_ids[] = $row['bcust_id'];
// }
// wa_inspection_required
// $mainQuery = 'SELECT IWL.*, B.bsn_name, BC.bcust_fname, BC.bcust_lname, BC.bcust_misc_email1, BC.bcust_misc_moble, (SELECT COUNT(*) FROM inspection_warranty_log_records WHERE iwlr_iwl_id = IWL.iwl_id) AS total_logs FROM inspection_warranty_log AS IWL INNER JOIN business AS B ON B.bsn_id = IWL.iwl_bsn_id INNER JOIN business_sellers AS BS ON BS.bs_business_id = B.bsn_id INNER JOIN bus_customers AS BC ON BC.bcust_id = BS.bs_customers_id WHERE (SELECT COUNT(*) FROM inspection_warranty_log_records WHERE iwlr_iwl_id = IWL.iwl_id) > 0';
$mainQuery = $serviceObj->getAllRecordsQuery();
$mainData = $fwDb->query($mainQuery);

$fwViewData['total'] = sizeof($mainData);

$finalList = $mainData;
if (!empty($mainData)) {
    if (!(isset($pagenum))) {
        $pagenum = 1;
    }
    $rows = count($mainData);
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
    $fwViewData['start_sn'] = ($pagenum - 1) * $page_rows + 1;

    $max = 'limit ' . ($pagenum - 1) * $page_rows . ',' . $page_rows;

    $sql2 =  $mainQuery . " " . $max;
    $finalList = $fwDb->query($sql2);
}

foreach ($finalList as $index => $row) {
    // if ($row['pd_name_id'] > 0) {
    //     $docNameIDs[] = $row['pd_name_id'];
    // }
}

$fwViewData['list'] = $finalList;
$fwViewData['title'] = $MODULE_PLURAL;
