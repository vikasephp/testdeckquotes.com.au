<?php
$fwMainView = 'file:' . getcwd() . '/alert.tpl';
$tablepoincc = new Fw_Db_Table('poincc3');
$submit = $fwRequest->getParam('subAddDetail', '');
$po_id = $fwRequest->getParam('po_id', 0);
$user_name = $_SESSION['user']['user_name'];

	$tablepoincc = new Fw_Db_Table($TABLE);
	$tablepoincc->setWhere("po_id = $po_id");
	$fwViewData['detail'] = $tablepoincc->getRow();
    $fwViewData['title'] = 'Add/View Alert';
	$fwViewData['user_name'] = $user_name;
	
	$submit = $fwRequest->getParam('alertsave', '');
	
	if(!empty($submit))
	{
    	$detail['po_alert_text'] = $fwRequest->getParam('alert_text', '');
		$detail['po_alert_date'] = $fwRequest->getParam('alert_date', '');
		$detail['po_alert_user'] = $user_name ;
		
		
		if($po_id)
				{
				
							$tablepoincc->setWhere("po_id = ".$po_id);
							$this_id = $tablepoincc->updateRow($detail);		
				}
	
				if($po_id){$fwViewData['opr'] = "Success!";}
	}