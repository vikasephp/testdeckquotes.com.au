<?php
$fwMainView = 'file:' . getcwd() . '/catergory.tpl';
$tableqa = new Fw_Db_Table('brief_builder_catergory');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('brief_builder', array());
	$this_id = (int)$detail['bbc_id'];

	unset($detail['bbc_id']);
	//db($detail);
	//exit;
		
	
    if($this_id > 0)
    	{
       		 $tableqa->setWhere("bbc_id = $this_id");
	     	 $opr = $tableqa->updateRow($detail);   
    	}
		else
		{
			 $opr = $tableqa->insertRow($detail); 
		}    	
	    $fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
}

$this_id = (int)$fwRequest->getParam('bbc_id', 0);
if ($this_id > 0)
{
	$tableqa = new Fw_Db_Table('brief_builder_catergory');
	$tableqa->setWhere("bbc_id = $this_id");
	$detail = $tableqa->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	