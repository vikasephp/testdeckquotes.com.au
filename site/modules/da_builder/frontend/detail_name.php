<?php
$fwMainView = 'file:' . getcwd() . '/detail_name.tpl';
$table = new Fw_Db_Table('report_build');
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam('report', array());
	$this_id = (int)$detail['rb_id'];

    	
    if($this_id > 0)
    	{
		
       		 $table->setWhere("$rb_id = $this_id");
	     	 $opr = $table->updateRow($detail);
    	}
	else
	{	
		 $opr = $table->insertRow($detail); 
	}    	
    
    $fwViewData['opr'] = $opr;
		
	
		
		
}

$this_id = (int)$fwRequest->getParam('rb_id', 0);
if ($this_id > 0)
{
	
	$tableqa = new Fw_Db_Table($TABLE);
	$tableqa->setWhere("$rb_id = $this_id");
    $detail = $tableqa->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;	
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	

