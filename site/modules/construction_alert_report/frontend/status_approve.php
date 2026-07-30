<?php
$fwMainView = 'file:' . getcwd() . '/status_approve.tpl';
$table = new Fw_Db_Table('construction_alert_report');

$car_id = (int)$fwRequest->getParam('car_id', 0);
$fwViewData['car_id']  = $car_id;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $status = $fwRequest->getParam('approve', array());
	
	if($status == 'Yes') {
		$detail['car_status'] = 'Closed';
		$detail['car_status_date'] = date('d-m-Y');
	}else {
		$detail['car_status'] = 'Open';
	}
	
      		
       	$table->setWhere("car_id = $car_id");
	    $opr = $table->updateRow($detail);   
	    	
	    $fwViewData['opr'] = "Status has been updated successfully";
			
}

