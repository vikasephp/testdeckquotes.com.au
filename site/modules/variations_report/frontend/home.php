<?php
$table = new Fw_Db_Table('bus_variations');
$pagenum = $fwRequest->getparamget('pagenum', 0);
$where = " where 1=1";
$update_inv_created = $fwRequest->getParam('update_inv_created', '');
if ($update_inv_created) {
    $keys_2 = array_keys($update_inv_created);
    $ky_2 = $keys_2[0];
    $val_2 = $update_inv_created[$ky_2];
    $detail['va_inv_created'] = $val_2;
    $detail['va_inv_cr_date'] = date('d-m-Y');
    $detail['va_inv_cr_user'] = $_SESSION['user']['user_name'];
    $table->setWhere("va_id = " . $ky_2);
    if ($table->rowExists()) {
        $this_id = $table->updateRow($detail);
    }
}
$linked_project = $fwRequest->getParam('linked_project', '');
if ($linked_project) {
    $keys_3 = array_keys($linked_project);
    $ky_3 = $keys_3[0];
    $val_3 = $linked_project[$ky_3];
    $detail3['va_link_project'] = $val_3;
    $detail3['va_link_project_date'] = date('d-m-Y');
    $detail3['va_link_project_user'] = $_SESSION['user']['user_name'];
    $table->setWhere("va_id = " . $ky_3);
    if ($table->rowExists()) {
        $this_id = $table->updateRow($detail3);
    }
}
$financial = $fwRequest->getParam('financial', '');
if ($financial) {
    $keys_4 = array_keys($financial);
    $ky_4 = $keys_4[0];
    $val_4 = $financial[$ky_4];
    $detail4['va_financial'] = $val_4;
    $table->setWhere("va_id = " . $ky_4);
    if ($table->rowExists()) {
        $this_id = $table->updateRow($detail4);
    }
}
$schedule = $fwRequest->getParam('schedule', '');
if ($schedule) {
    $keys_5 = array_keys($schedule);
    $ky_5 = $keys_5[0];
    $val_5 = $schedule[$ky_5];
    $detail5['va_schedule_up'] = $val_5;
    $table->setWhere("va_id = " . $ky_5);
    if ($table->rowExists()) {
        $this_id = $table->updateRow($detail5);
    }
}
$linked_pass = $fwRequest->getParam('linked_pass', '');
if ($linked_pass) {
    $keys_4 = array_keys($linked_pass);
    $ky_4 = $keys_4[0];
    $val_4 = $linked_pass[$ky_4];
    $detail4['va_link_pr_pass'] = $val_4;
    $detail4['va_link_pr_pass_date'] = date('d-m-Y');
    $detail4['va_link_pr_pass_user'] = $_SESSION['user']['user_name'];
    $table->setWhere("va_id = " . $ky_4);
    if ($table->rowExists()) {
        $this_id = $table->updateRow($detail4);
    }
}
$clear_search = $fwRequest->getParam('clear_search', '');
if (!empty($clear_search)) {
    unset($_SESSION['bsn_id']);
    unset($address);
    unset($bsn_id);
    $fwViewData['address'] = '';
}
$fwViewData['status'] = '';
$status = $fwRequest->getParam('status', '');
if ($status):
    $where .= " AND bus_variations.va_status  = '" . $status . "'";
    $fwViewData['status'] = $status;
    $_SESSION['status'] =  $status;
elseif ($_SESSION['status']):
    $where .= " AND bus_variations.va_status = '" . $_SESSION['status'] . "'";
    $fwViewData['status'] = $_SESSION['status'];
endif;
$fin_search = $fwRequest->getParam('fin_search', '');
if ($fin_search):
    if ($fin_search == 2) {
        $fin_search = 0;
    }
    $where .= " AND bus_variations.va_financial  = " . $fin_search;
    // $fwViewData['fin_search']= $fin_search;
    $_SESSION['fin_search'] =  $fin_search;
elseif ($_SESSION['fin_search']):
    $where .= " AND bus_variations.va_financial = " . $_SESSION['fin_search'];
//$fwViewData['fin_search']=$_SESSION['fin_search'];
endif;

$inv_search = $fwRequest->getParam('inv_search', '');
if ($inv_search):
    $fwViewData['inv_search'] = $inv_search;
    if ($inv_search == 2) {
        $inv_search = 0;
    }
    $where .= " AND bus_variations.va_inv_created  = " . $inv_search;
    $_SESSION['inv_search'] =  $inv_search;
elseif ($_SESSION['inv_search']):
    $fwViewData['inv_search'] = $_SESSION['inv_search'];
    $where .= " AND bus_variations.va_inv_created = " . $_SESSION['inv_search'];
endif;

$clear = $fwRequest->getParam('clear', '');
if (!empty($clear)) {
    unset($fwViewData['status']);
    unset($_SESSION['status']);
    unset($fwViewData['fin_search']);
    unset($_SESSION['fin_search']);
    unset($fwViewData['inv_search']);
    unset($_SESSION['inv_search']);
    $where = " where 1 = 1";
}
$address = $fwRequest->getParam('address', '');
if ($address):
    $sqlbsn = "select bsn_id from business where bsn_name like '%" . $address . "%'";
    $bid = $fwDb->queryOne($sqlbsn);
    $bsn_id = $bid['bsn_id'];
    $where .= " AND  bus_variations.va_bsn_id = " . $bsn_id;
    $_SESSION['bsn_id'] = $bsn_id;
elseif ($_SESSION['bsn_id']):
    $where .= " AND bus_variations.va_bsn_id = " . $_SESSION['bsn_id'];
endif;
$matsql = "SELECT * FROM bus_variations " . $where . " ORDER BY va_id DESC";
if ($matsql) {
    $userData = $fwDb->query($matsql);
}
if (!empty($userData)) {
    if (!(isset($pagenum))) {
        $pagenum = 1;
    }
    $rows = count($userData);
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
    $max = 'limit ' . ($pagenum - 1) * $page_rows . ',' . $page_rows;
    $sql2 =  $matsql . " " . $max;
    if ($sql2) {
        $lists = $fwDb->query($sql2);
        foreach ($lists as $list):
            $listsnew[] = $list;
        endforeach;
    }
}
foreach ($listsnew as $k => $v) {
    $link = BASE_URL . "business.detail/bsn_id/" . $v['va_bsn_id'];
    $sql = "Select bsn_name from business where bsn_id = " . $v['va_bsn_id'];
    $bsname = $fwDb->queryOne($sql);
    $listsnew[$k]['bsn_name'] = $bsname['bsn_name'];
    $listsnew[$k]['link'] = $link;
}
$fwViewData['list'] = $listsnew;
$fwViewData['title'] = "Variations Report";
//$fwViewData['statusData'] = [];
$sqlS = "Select * from variation_report_status ";
$fwViewData['statusData'] = $fwDb->query($sqlS);
$sqlS = "Select * from variation_report_type ";
$fwViewData['typeData'] = $fwDb->query($sqlS);
$sqlS = "Select * from variation_report_plans ";
$fwViewData['plansData'] = $fwDb->query($sqlS);
// Export to Excel
$export = $fwRequest->getParam('export', 0);
if ($export > 0) {
    require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";
    $objPHPExcel = new PHPExcel();
    $objPHPExcel->getProperties()->setCreator("Deckquotes")
        ->setLastModifiedBy("Nick C")
        ->setTitle("Office 2007 XLSX Test Document")
        ->setSubject("Office 2007 XLSX Test Document")
        ->setDescription("Suspense account exported to Office 2007 XLSX.")
        ->setKeywords("office 2007 openxml php")
        ->setCategory("Missing Variations Invoice");
    //$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);
    $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
    $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
    $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
    $objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
    $objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
    // Add some data
    $objPHPExcel->setActiveSheetIndex(0)
        ->setCellValue('A1', 'Variations Id')
        ->setCellValue('B1', "Project Name")
        ->setCellValue('C1', "Document Name")
        ->setCellValue('D1', "Invoice Created")
        ->setCellValue('E1', "Value of Variations")
        ->setCellValue('F1', "Status")
    ;
    $from = "A1"; // or any value
    $to = "AZ1"; // or any value
    $objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold(true);
    $row = 2;
    $sr = 1;
    foreach ($listsnew as $k => $v) {
        if ($v['va_inv_created'] == 1) {
            $inv_cr = 'Yes';
        } else {
            $inv_cr = 'NO';
        }
        $objPHPExcel->getActiveSheet()
            ->setCellValue('A' . $row, $v['va_id'])
            ->setCellValue('B' . $row, $v['bsn_name'])
            ->setCellValue('C' . $row, $v['va_doc_name'])
            ->setCellValue('D' . $row, $inv_cr)
            ->setCellValue('E' . $row, $v['va_values'])
            ->setCellValue('F' . $row, $v['va_status'])
        ;
        $row = $row + 1;
    }
    // Rename worksheet
    $objPHPExcel->getActiveSheet()->setTitle('Missing Variations Invoice');
    $objPHPExcel->setActiveSheetIndex(0);
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="missing_variations_report.xls"');
    header('Cache-Control: max-age=0');
    header('Cache-Control: max-age=1');
    header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
    header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
    header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
    header('Pragma: public'); // HTTP/1.0
    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
    $objWriter->save('php://output');
    exit;
}
