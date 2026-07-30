<?php
$fwMainView = 'file:' . getcwd() . '/status_approve.tpl';
$table = new Fw_Db_Table('warranty_log');

$wa_id = (int)$fwRequest->getParam('wa_id', 0);
$fwViewData['wa_id']  = $wa_id;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $status = $fwRequest->getParam('approve', array());
	
	if($status == 'Yes') {
		$detail['wa_status'] = 'Closed';
		$detail['wa_status_date'] = date('d-m-Y');
	}else {
		$detail['wa_status'] = 'Open';
	}
	
      		
       	$table->setWhere("wa_id = $wa_id");
	     $opr = $table->updateRow($detail);   
    
	    	
	    $fwViewData['opr'] = "Status has been updated successfully";
		
	
}

