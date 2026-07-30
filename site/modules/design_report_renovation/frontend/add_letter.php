<?php
$fwMainView = 'file:' . getcwd() . '/add_letter.tpl';
$tableTask = new Fw_Db_Table('letter_text_renovation_dr');
$fwViewData['lt_id'] = (int)$fwRequest->getParam('lt_id', 0);

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('letter', array());
	
	$this_id = (int)$detail['lt_id'];
	unset($detail['lt_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['lt_id']);
       		 $tableTask->setWhere("lt_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
		
	
}

$this_id = (int)$fwRequest->getParam('lt_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('letter_text_renovation_dr');
	$tableTask->setWhere("lt_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
