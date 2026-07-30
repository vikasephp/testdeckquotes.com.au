<?php
require_once(MODULES_DIR . 'inspection_warranty_log/frontend/ServiceClass.php');

$pagenum = $fwRequest->getparamget('pagenum', 0);

$serviceObj = new ServiceClass;

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
    
}

$fwViewData['list'] = $finalList;
$fwViewData['title'] = $MODULE_PLURAL;
