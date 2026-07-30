<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$table = new Fw_Db_Table('construction_cal_update_report');
$submit = $fwRequest->getParam('subAddDetail', '');

date_default_timezone_set("Australia/Sydney");

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	
	
    $this_id = (int)$detail[$ID];
   
    if($this_id > 0)
    	{
       		 $table->setWhere("$ID = $this_id");
	     	 $opr = $table->updateRow($detail);   
    	}
		else
		{
			$dt = date('d-m-Y h:i a');
			$detail['cc_date_time'] = $dt;
			$opr = $table->insertRow($detail); 
		}    	
	    $fwViewData['opr'] = "Success";				
}	

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0) {
	
    $table = new Fw_Db_Table($TABLE);
	$table->setWhere("$ID = $this_id");
	$detail = $table->getRow();
	
	$fwViewData['detail'] = $detail;
	
}
$fwViewData['title'] = "Add / Edit Quote Tracking Report";

$sql = "SELECT business.bsn_id, business.bsn_name from business ";
$fwViewData['projdetail'] = $fwDb->query($sql);
