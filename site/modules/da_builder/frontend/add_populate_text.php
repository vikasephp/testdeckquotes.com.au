<?php
$fwMainView = 'file:' . getcwd() . '/add_populate_text.tpl';
$tableTask = new Fw_Db_Table('report_populate_text');
$mr_id = (int)$fwRequest->getParam('mr_id', 0);
$rb_id = (int)$fwRequest->getParam('rb_id', 0);
$mr_admin_id = (int)$fwRequest->getParam('mr_admin_id', 0);
$fwViewData['mr_id'] = $mr_id;
$fwViewData['rb_id'] = $rb_id;
$fwViewData['mr_admin_id'] = $mr_admin_id;


$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	
	$detail = $fwRequest->getParam('task', array());
	
	$detail['pt_rb_id'] = $rb_id;
	$detail['pt_mr_admin_id'] = $mr_admin_id;
	
	$this_id = (int)$detail['pt_id'];
	unset($detail['pt_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['pt_id']);
       		 $tableTask->setWhere("pt_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	     $fwViewData['opr'] = $opr;
		
	
}

$this_id = (int)$fwRequest->getParam('pt_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('report_populate_text');
	$tableTask->setWhere("pt_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
