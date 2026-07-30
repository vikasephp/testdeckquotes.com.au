<?php
$fwMainView = 'file:' . getcwd() . '/view_notes.tpl';
$cn_id = (int)$fwRequest->getParam('cn_id', 0);


$ord =  " ORDER BY if(  customer_nps_notes.cnn_date = ' '
         OR customer_nps_notes.cnn_date IS NULL , 1, 0 ) , STR_TO_DATE( customer_nps_notes.cnn_date, '%d-%m-%Y' ) DESC";

$sql = "Select * from customer_nps_notes where cnn_cn_id = ".$cn_id .' '.$ord;
$data = $fwDb->query($sql);

$sql2 = "Select count(*) as tot from customer_nps_notes where cnn_cn_id = ".$cn_id;
$data2 = $fwDb->queryOne($sql2);

$fwViewData['cn_id'] = $cn_id;
$fwViewData['notesdata'] = $data; 
$fwViewData['total'] = $data2['tot'];