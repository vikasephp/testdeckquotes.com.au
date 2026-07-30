<?php
$fwMainView = 'file:' . getcwd() . '/add_industry.tpl';
$tableqa = new Fw_Db_Table('suppliers_industry');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('industry', array());
	$this_id = (int)$detail['si_id'];

	unset($detail['si_id']);
		
	
    if($this_id > 0)
    	{
       		 $tableqa->setWhere("si_id = $this_id");
	     	 $opr = $tableqa->updateRow($detail);   
    	}
		else
		{
			 $opr = $tableqa->insertRow($detail); 
		}    	
	    $fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
}

$this_id = (int)$fwRequest->getParam('si_id', 0);
if ($this_id > 0)
{
	$tableqa = new Fw_Db_Table('suppliers_industry');
	$tableqa->setWhere("si_id = $this_id");
	$detail = $tableqa->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	