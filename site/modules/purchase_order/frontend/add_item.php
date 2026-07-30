<?php
$fwMainView = 'file:' . getcwd() . '/add_item.tpl';
$tableItem = new Fw_Db_Table('purchase_order_items');
$fwViewData['po_id'] = (int)$fwRequest->getParam('po_id', 0);

$user_id = $_SESSION['user']['user_id'];
$fwViewData['user_name'] = $_SESSION['user']['user_name'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('item', array());
	$detail['tdt_user_id'] = $user_id;
	
	$fwViewData['po_id'] = $detail['pi_po_id'];
	$pi_po_id = $detail['pi_po_id'];
	
	
	$this_id = (int)$detail['pi_id'];
	unset($detail['pi_id']);
	
	
	
    if($this_id > 0)
    	{
                 $fwViewData['dt_id'] = $detail['tdt_dt_id'];
      		 unset($detail['tdt_dt_id']);
       		 $tableItem->setWhere("pi_id = $this_id");
	     	 $opr = $tableItem->updateRow($detail);   
    	}
	else
	{
	
		 $opr = $tableItem->insertRow($detail); 
		
		  
	}  
	
	
	  	
	    $fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
}

$this_id = (int)$fwRequest->getParam('pi_id', 0);
if ($this_id > 0)
{
	$tableItem = new Fw_Db_Table('purchase_order_items');
	$tableItem->setWhere("pi_id = $this_id");
	$detail = $tableItem->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	

//$sqldt = "Select * from design_team";
//$fwViewData['teamData'] = $fwDb->query($sqldt);
//
//$sql_tt = "Select * from design_task_type";
//$fwViewData['tasktype'] = $fwDb->query($sql_tt);