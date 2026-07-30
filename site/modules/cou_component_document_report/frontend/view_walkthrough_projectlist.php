<?php
$fwMainView = 'file:' . getcwd() . '/view_walkthrough_projectlist.tpl';

$year = $fwRequest->getParam('year', '');
$financial_year = (int)$fwRequest->getParam('financial_year', '');

if ($year != '' ){
$sql_l = "SELECT dcl.doc_bsn_id, dcl.doc_date_uploaded, dcl.doc_file_name, business.bsn_address FROM document_check_list dcl Left Join business on business.bsn_id = dcl.doc_bsn_id WHERE dcl.doc_name_id = 172 AND dcl.doc_file_name IS NOT NULL AND dcl.doc_file_name <> '' AND YEAR(dcl.doc_date_uploaded) =  ".$year." Order by dcl.doc_date_uploaded DESC";

$fwViewData['courecordlist'] = $fwDb->query($sql_l);
$fwViewData['year'] = "Year ".$year;
}

if ($financial_year != ''){
$start = $financial_year . '-07-01';
$end = ($financial_year + 1) . '-06-30';

$sql_2 = "SELECT dcl.doc_bsn_id, dcl.doc_date_uploaded, dcl.doc_file_name, business.bsn_address FROM document_check_list dcl LEFT JOIN business ON business.bsn_id = dcl.doc_bsn_id WHERE dcl.doc_name_id = 172 AND dcl.doc_file_name IS NOT NULL AND dcl.doc_file_name <> '' AND dcl.doc_date_uploaded >= '$start' AND dcl.doc_date_uploaded < '$end' ORDER BY dcl.doc_date_uploaded DESC";

$fwViewData['courecordlist'] = $fwDb->query($sql_2);
$fwViewData['year'] = date('F j, Y', strtotime($start)) . ' - ' . date('F j, Y', strtotime($end));
}