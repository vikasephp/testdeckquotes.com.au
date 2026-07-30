<?php
$fwMainView = 'file:' . getcwd() . '/add_status.tpl';
$tableqa = new Fw_Db_Table('proposal_report_status');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('status', array());
	$this_id = (int)$detail['pr_id'];

	unset($detail['pr_id']);
		
	
    if($this_id > 0)
    	{
       		 $tableqa->setWhere("pr_id = $this_id");
	     	 $opr = $tableqa->updateRow($detail);   
    	}
		else
		{
			 $opr = $tableqa->insertRow($detail); 
		}    	
	    $fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
}

$this_id = (int)$fwRequest->getParam('pr_id', 0);
if ($this_id > 0)
{
	$tableqa = new Fw_Db_Table('proposal_report_status');
	$tableqa->setWhere("pr_id = $this_id");
	$detail = $tableqa->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	