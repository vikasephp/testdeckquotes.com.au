<?php
$fwMainView = 'file:' . getcwd() . '/add_procedure.tpl';
$tableTask = new Fw_Db_Table('pp_sub_pages');

$user_id = $_SESSION['user']['user_id'];
 $fwViewData['opr'] = false;
$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('task', array());
	
	$this_id = (int)$detail['pr_id'];
	unset($detail['pr_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['pr_id']);
       		 $tableTask->setWhere("pr_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = true;
		
	
}

$detail['pr_id']='';
$detail['pr_procedure']='';
$detail['pr_link']='';


$fwViewData['detail'] = $detail;


$this_id = (int)$fwRequest->getParam('pr_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('pp_sub_pages');
	$tableTask->setWhere("pr_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
