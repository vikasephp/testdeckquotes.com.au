<?php
$fwMainView = 'file:' . getcwd() . '/add_who_for.tpl';
$tableTask = new Fw_Db_Table('phone_log_whofor_admin');
$user_id = $_SESSION['user']['user_id'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['pw_id'];
	unset($detail['pw_id']);
	
	
    if($this_id > 0)
    	{
      		 unset($detail['pw_id']);
       		 $tableTask->setWhere("pw_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
			
}

$this_id = (int)$fwRequest->getParam('pw_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('phone_log_whofor_admin');
	$tableTask->setWhere("pw_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
