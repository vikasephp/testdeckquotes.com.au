<?php
$fwMainView = 'file:' . getcwd() . '/insert_po.tpl';
$tableTask = new Fw_Db_Table('delivery_schedule_report');


$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$data = $fwRequest->getParam('insert', array());
	
	
	
	$sql = "select max(ds_sub_number) as ds_sub_number from delivery_schedule_report where ds_uidd = ".$data['ds_uidd'];
	$tot =  $fwDb->queryOne($sql);

	$num = $data['ds_sub_number'];
	$detail['ds_uidd'] = $data['ds_uidd'];
	for($i=1;$i<=$num;$i++)
	{
		$detail['ds_sub_number'] = $tot['ds_sub_number'] + $i;
		$detail['ds_project'] = $data['ds_project'];
		$detail['ds_delivery_event'] = $data['ds_delivery_event'];
		$detail['ds_po_number'] = $data['ds_po_number'];
		$detail['ds_po_number'] = $data['ds_po_number'];
		
		
		$opr = $tableTask->insertRow($detail); 
	}
	
	
		
        $fwViewData['opr'] = $opr;	
}



$sqlui = "Select distinct ds_uidd from delivery_schedule_report";
$fwViewData['uidddetail'] = $fwDb->query($sqlui); 
	
$sql = "SELECT business.bsn_id, business.bsn_name from business ";
$fwViewData['projdetail'] = $fwDb->query($sql);

$sqlpr = "Select * from quote_builder_component";
$fwViewData['cdetail'] = $fwDb->query($sqlpr);

$sqlpo = "Select distinct po_po_number from purchase_order where length(po_po_number) > 0";
$fwViewData['podetail'] = $fwDb->query($sqlpo);  	
