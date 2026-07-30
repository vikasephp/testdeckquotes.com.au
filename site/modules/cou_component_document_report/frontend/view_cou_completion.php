<?php
$fwMainView = 'file:' . getcwd() . '/view_cou_completion.tpl';

$sql_l = "SELECT YEAR(dcl.doc_date_uploaded) AS year, COUNT(*) AS total_records FROM document_check_list AS dcl WHERE dcl.doc_name_id = 173 AND dcl.doc_file_name != '' AND dcl.doc_file_name IS NOT NULL GROUP BY YEAR(dcl.doc_date_uploaded) ORDER BY year DESC ";

$fwViewData['countcourecord'] = $fwDb->query($sql_l);


$sql_2 = "SELECT YEAR(DATE_SUB(dcl.doc_date_uploaded, INTERVAL 6 MONTH)) AS fy_year, CONCAT( 'Jul 1, ', YEAR(DATE_SUB(dcl.doc_date_uploaded, INTERVAL 6 MONTH)), ' - Jun 30, ', YEAR(DATE_SUB(dcl.doc_date_uploaded, INTERVAL 6 MONTH)) + 1 ) AS financial_year, COUNT(*) AS total_records FROM document_check_list AS dcl WHERE dcl.doc_name_id = 173 AND dcl.doc_file_name != '' AND dcl.doc_file_name IS NOT NULL GROUP BY YEAR(DATE_SUB(dcl.doc_date_uploaded, INTERVAL 6 MONTH)) ORDER BY YEAR(DATE_SUB(dcl.doc_date_uploaded, INTERVAL 6 MONTH)) DESC;";
$fwViewData['countfincourecord'] = $fwDb->query($sql_2);