<?php
$fwMainView = 'file:' . getcwd() . '/report_admin_detail.tpl';
$tableTask = new Fw_Db_Table('report_builder_admin');

$tablemain = new Fw_Db_Table('report_table_main');

$id = (int)$fwRequest->getParam('id', 0);


$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('rbadmin', array());
	
	$this_id = (int)$detail['ra_id'];
	unset($detail['ra_id']);
	
	$detail['ra_rb_id'] = $id;

    if($this_id > 0)
    {
      		 unset($detail['ra_id']);
			 unset($detail['ra_rb_id']);
       		 $tableTask->setWhere("ra_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
			
			
			 
			 $namedetail['mr_order'] = $detail['ra_order'];
			 $namedetail['mr_name'] = $detail['ra_name'];
			 $namedetail['mr_specification'] = $detail['ra_specification'];
			 $namedetail['mr_status'] = $detail['ra_status'];
			 $namedetail['mr_criteria'] = $detail['ra_criteria'];
			 
			 $tablemain->setWhere("mr_admin_id = $this_id");
	     	 $opr = $tablemain->updateRow($namedetail); 
			
			 
    }
	
 else
	{
		     $opr = $tableTask->insertRow($detail); 
	}    	
	       
		    $fwViewData['opr'] = $opr;
			
}

$this_id = (int)$fwRequest->getParam('ra_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('report_builder_admin');
	$tableTask->setWhere("ra_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	

$sql = "SELECT  *  from report_status_admin ";
$fwViewData['statusdetail'] = $fwDb->query($sql);