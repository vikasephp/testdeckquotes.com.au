<?php
$fwMainView = 'file:' . getcwd() . '/view_notes.tpl';
$os_id = (int)$fwRequest->getParam('os_id', 0);


$ord =  " ORDER BY if(  165_report_notes.on_date = ' '
         OR 165_report_notes.on_date IS NULL , 1, 0 ) , STR_TO_DATE( 165_report_notes.on_date, '%d-%m-%Y' ) DESC";

$sql = "Select * from 165_report_notes where on_os_id = ".$os_id .' '.$ord;
$data = $fwDb->query($sql);


$sql2 = "Select count(*) as tot from 165_report_notes where on_os_id = ".$os_id;
$data2 = $fwDb->queryOne($sql2);

$fwViewData['os_id'] = $os_id;
$fwViewData['notesdata'] = $data; 
$fwViewData['total'] = $data2['tot'];