<?php
$fwMainView = 'file:' . getcwd() . '/add_notes.tpl';
$tableTask = new Fw_Db_Table('customer_nps_notes');
$cn_id = (int)$fwRequest->getParam('cn_id', 0);
$fwViewData['cn_id'] = $cn_id;
$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('notes', array());
	$this_id = (int)$detail['cnn_id'];
	unset($detail['cnn_id']);
	
	$detail['cnn_date'] = date('d-m-Y');
	$detail['cnn_cn_id'] = $cn_id;
	
    if($this_id > 0)
    	{
      		 unset($detail['cnn_id']);
       		 $tableTask->setWhere("cnn_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
			
}

$this_id = (int)$fwRequest->getParam('cnn_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('customer_nps_notes');
	$tableTask->setWhere("cnn_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
     $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
