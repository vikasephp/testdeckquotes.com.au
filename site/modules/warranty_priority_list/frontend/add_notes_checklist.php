<?php
$fwMainView = 'file:' . getcwd() . '/add_notes_checklist.tpl';
$tableTask = new Fw_Db_Table('warranty_checklist_notes');
$wa_id = (int)$fwRequest->getParam('wa_id', 0);
$cn_ch_id = (int)$fwRequest->getParam('ch_id', 0);
$fwViewData['wa_id'] = $wa_id;
$fwViewData['ch_id'] = $cn_ch_id;

$user = $_SESSION['user']['user_name'];
$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
	
	
    $detail = $fwRequest->getParam('notes', array());
	

	
	$this_id = (int)$detail['cn_id'];
	unset($detail['cn_id']);
	
	$detail['cn_ch_id'] = $cn_ch_id;
	$detail['cn_date'] = date('d-m-Y');
	$detail['cn_wa_id'] = $wa_id;
	$detail['cn_added_by'] = $user;
	
	
    if($this_id > 0)
    	{
      		 unset($detail['cn_id']);
       		 $tableTask->setWhere("cn_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
			
}

$this_id = (int)$fwRequest->getParam('cn_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('warranty_checklist_notes');
	$tableTask->setWhere("cn_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
     $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
