<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$table = new Fw_Db_Table('project_progress_report');

$pp_id = $fwRequest->getParam('pp_id', '');
$submit = $fwRequest->getParam('subAddDetail', '');


if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];
	
	$detail['pp_create_date'] = date('d-m-Y');	
	
    if($this_id > 0)
    	{
       		 $table->setWhere("$ID = $this_id");
	     	 $opr = $table->updateRow($detail);   
    	}
		else
		{
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
$fwViewData['title'] = "Add / Edit Project Progress Report";

$sql = "SELECT business.bsn_id, business.bsn_name from business ";
$fwViewData['projdetail'] = $fwDb->query($sql);