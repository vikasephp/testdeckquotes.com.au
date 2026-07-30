<?php
$fwMainView = 'file:' . getcwd() . '/add_header_link.tpl';
$tableTask = new Fw_Db_Table('roofing_header_link');

$rh_id = (int)$fwRequest->getParam('rh_id', 0);

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('link', array());
	
	$this_id = (int)$detail['rh_id'];
	unset($detail['pr_id']);
     
	 unset($detail['rh_id']);
	 $tableTask->setWhere("rh_id = $rh_id");
	 $opr = $tableTask->updateRow($detail);   
	 $fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam('rh_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('roofing_header_link');
	$tableTask->setWhere("rh_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
