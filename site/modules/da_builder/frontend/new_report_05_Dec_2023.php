<?php

$table = new Fw_Db_Table('report_table');

$rt_id = $fwRequest->getParam('rt_id', '');

$sql = "select * from report_table_main where mr_report_id = ".$rt_id;
$data = $fwDb->query($sql);


$fwViewData['data'] = $data;

$fwViewData['title'] = "Run New Report";
