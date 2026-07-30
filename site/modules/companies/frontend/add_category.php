<?php
$fwMainView = 'file:' . getcwd() . '/add_category.tpl';
$tableTask = new Fw_Db_Table('category_options');
$user_id = $_SESSION['user']['user_id'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('category', array());
	$this_id = (int)$detail['co_id'];
	unset($detail['co_id']);
	
	
    if($this_id > 0)
    	{
      		 unset($detail['co_id']);
       		 $tableTask->setWhere("co_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
			
}

$this_id = (int)$fwRequest->getParam('co_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('category_options');
	$tableTask->setWhere("co_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
