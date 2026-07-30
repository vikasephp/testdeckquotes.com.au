<?php
$fwMainView = 'file:' . getcwd() . '/add_response.tpl';

$tableTask = new Fw_Db_Table('task_comment');
$fwViewData['tc_id'] = (int)$fwRequest->getParam('tc_id', 0);
$fwViewData['tc_task_id'] = (int)$fwRequest->getParam('tc_task_id', 0);
$dt_id = (int)$fwRequest->getParam('dt_id', 0);
$fwViewData['dt_id'] = $dt_id;



$fwViewData['user_name'] = $_SESSION['user']['user_name'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('response', '');
	
	
	$fwViewData['tc_task_id'] = $detail['tc_task_id'];
	
	$this_id = (int)$detail['tc_id'];
	unset($detail['tc_id']);
	
    if($this_id > 0)
    	{
                 $fwViewData['dt_id'] = $detail['dt_id'];
      		 unset($detail['tc_task_id']);
       		 $tableTask->setWhere("tc_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	  	
	    $fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
}

$this_id = (int)$fwRequest->getParam('tc_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('task_comment');
	$tableTask->setWhere("tc_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
