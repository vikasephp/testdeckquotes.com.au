<?php
$fwMainView = 'file:' . getcwd() . '/add_intensity.tpl';
$tableTask = new Fw_Db_Table('street_sign_intensity_pl');
$user_id = $_SESSION['user']['user_id'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['si_id'];
	unset($detail['si_id']);
	
	
    if($this_id > 0)
    	{
      		 unset($detail['si_id']);
       		 $tableTask->setWhere("si_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
			
}

$this_id = (int)$fwRequest->getParam('si_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('street_sign_intensity_pl');
	$tableTask->setWhere("si_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
