<?php
$fwMainView = 'file:' . getcwd() . '/qa_floor_system.tpl';
$table = new Fw_Db_Table("construction_scheduler_report");
$cs_id = $fwRequest->getParam('cs_id', '');

$sql_1 = "select cs_project from  construction_scheduler_report where cs_id = ".$cs_id;
$proj = $fwDb->queryOne($sql_1);
$fwViewData['proj_name'] = $proj['cs_project'];

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

$savedrop = $fwRequest->getParam('savedrop', '');

if(!empty($savedrop)) {
	
	$detail = $fwRequest->getParam('cons_cal', '');
	$detail['cs_fs_user'] = $user; 
	$detail['cs_fs_date'] = $dt;
	
	$table->setWhere("cs_id = ".$cs_id);
	$this_id = $table->updateRow($detail);
	$fwViewData['opr'] =  $this_id;
}

    $table->setWhere("cs_id = ".$cs_id);
	$detail = $table->getRow();
    $fwViewData['detail'] = $detail;
	
	
$sql_po = "Select distinct po_po_number from purchase_order";
$fwViewData['podetail'] = $fwDb->query($sql_po);	