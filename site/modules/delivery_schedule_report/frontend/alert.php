<?php
$fwMainView = 'file:' . getcwd() . '/alert.tpl';
//$table1 = new Fw_Db_Table('purchase_order');
//$table2 = new Fw_Db_Table('purchase_order_custom');

$submit = $fwRequest->getParam('subAddDetail', '');
$po_id = $fwRequest->getParam('po_id', 0);
$user_name = $_SESSION['user']['user_name'];

$po = $fwRequest->getParam('po', 0);
if($po == 1)
{
$table = new Fw_Db_Table('purchase_order');	
}elseif($po == 2)
{
$table = new Fw_Db_Table('purchase_order_custom');	
}


	$table->setWhere("po_id = $po_id");
	$fwViewData['detail'] = $table->getRow();
        $fwViewData['title'] = 'Add/View Alert';
	$fwViewData['user_name'] = $user_name;
	
	$submit = $fwRequest->getParam('alertsave', '');
	
	if(!empty($submit))
	{
    	$detail['po_alert'] = $fwRequest->getParam('alert_text', '');
	//$detail['po_alert_date'] = $fwRequest->getParam('alert_date', '');
	//$detail['po_alert_user'] = $user_name ;
		
		
		if($po_id)
			{
			
				$table->setWhere("po_id = ".$po_id);
				$this_id = $table->updateRow($detail);		
			}
	
				if($po_id){$fwViewData['opr'] = "Success!";}
	}