<?php

$table = new Fw_Db_Table('report_table');
$tablemain = new Fw_Db_Table('report_table_main');

$st_save = $fwRequest->getParam('st_save', '');

if(!empty($st_save))
{
	$statement = $fwRequest->getParam('statement', '');
	$mr_id = $statement['mr_id'];

	unset($statement['mr_id']);


        $tablemain->setWhere("mr_id = $mr_id");
		
        $opr = $tablemain->updateRow($statement);	
	
}


$rt_id = $fwRequest->getParam('rt_id', '');

$sql = "select * from report_table_main where mr_report_id = ".$rt_id . " order by mr_order ";
$data = $fwDb->query($sql);

foreach($data as $k2=>$v2)
{
	$sqlcl = "select ns_color from status_admin_nr where ns_option = '".$v2['mr_status']."'";
	$clr = $fwDb->queryOne($sqlcl);
	
	$data[$k2]['color_code'] = $clr['ns_color'];
}

$fwViewData['data'] = $data;


$sqlrt = "Select rt_project_address , rt_report_type from report_table where rt_id = ".$rt_id;
$datart = $fwDb->queryOne($sqlrt);

$sqlrb = "Select rb_report_name, rb_id from report_build where rb_id = ".$datart['rt_report_type'];
$rbdata = $fwDb->queryOne($sqlrb);


$fwViewData['rt_project_address'] = $datart['rt_project_address']; 
$fwViewData['rb_report_name'] = $rbdata['rb_report_name'];
$fwViewData['rb_id'] = $rbdata['rb_id'];

$fwViewData['title'] = "Run New Report";


$sqlsa = "select * from status_admin_nr";
$fwViewData['statisdata'] = $fwDb->query($sqlsa);