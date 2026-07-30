<?php
$fwMainView = 'file:' . getcwd() . '/add_type.tpl';
$tableTask = new Fw_Db_Table('watch_list_type');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['wt_id'];
	unset($detail['wt_id']);
	
	
    if($this_id > 0)
    	{
      		 unset($detail['wt_id']);
       		 $tableTask->setWhere("wt_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
			
}

$this_id = (int)$fwRequest->getParam('wt_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('watch_list_type');
	$tableTask->setWhere("wt_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
