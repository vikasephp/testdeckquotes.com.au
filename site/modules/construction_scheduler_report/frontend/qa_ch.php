<?php
$fwMainView = 'file:' . getcwd() . '/qa_ch.tpl';
$table = new Fw_Db_Table("construction_scheduler_report");
$cs_id = $fwRequest->getParam('cs_id', '');

$sql_1 = "select cs_project from  construction_scheduler_report where cs_id = ".$cs_id;
$proj = $fwDb->queryOne($sql_1);
$fwViewData['proj_name'] = $proj['cs_project'];

$savedrop = $fwRequest->getParam('savedrop', '');

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if(!empty($savedrop)) {
	
	
	$detail = $fwRequest->getParam('cons_cal', '');
	$detail['cs_ch_user'] = $user; 
	$detail['cs_ch_date'] = $dt; 
	
	$table->setWhere("cs_id = ".$cs_id);
	$opr  = $table->updateRow($detail);
	$fwViewData['opr'] =  $opr;	
}

    $table->setWhere("cs_id = ".$cs_id);
	$detail = $table->getRow();
    $fwViewData['detail'] = $detail;
	
	
$sql_po = "Select distinct po_po_number from purchase_order";
$fwViewData['podetail'] = $fwDb->query($sql_po);	