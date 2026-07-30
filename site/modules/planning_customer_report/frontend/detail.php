<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table('business_sellers');
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail['bs_business_id'];

   
	unset($detail['bs_business_id']);
	
	 if($this_id > 0)
    	{
		  
       		 $tableqa->setWhere("bs_business_id = $this_id");
	     	 $opr = $tableqa->updateRow($detail);
    	}
	  	
    
    $fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
}

$this_id = (int)$fwRequest->getParam('bs_business_id', 0);
if ($this_id > 0)
{
	
	$tableqa = new Fw_Db_Table('business_sellers');
	$tableqa->setWhere("bs_business_id = $this_id");
    $detail = $tableqa->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;	
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}

	