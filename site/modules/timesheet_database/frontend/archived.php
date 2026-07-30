<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('timesheet_database');


$sql = "select distinct td_open_date from timesheet_database where td_archive = 1";
$opdata = $fwDb->query($sql);

foreach($opdata as $k=>$v)
{
	$sql2 = "select td_close_date from timesheet_database where td_open_date = '".$v['td_open_date']."'";
	
	$cldata = $fwDb->queryOne($sql2);
	$opdata[$k]['td_close_date'] = $cldata['td_close_date'];
}


$fwViewData['opdata'] =  $opdata;
