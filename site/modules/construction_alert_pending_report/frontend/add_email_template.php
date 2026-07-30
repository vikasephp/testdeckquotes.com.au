<?php
$fwMainView = 'file:' . getcwd() . '/add_email_template.tpl';
$tableTemplate = new Fw_Db_Table('email_template_mini');

//$fwViewData['dt_id'] = (int)$fwRequest->getParam('dt_id', 0);

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('email', array());
	
	//$fwViewData['dt_id'] = $detail['tdt_dt_id'];
	
	$this_id = (int)$detail['et_id'];
	unset($detail['et_id']);
		
	
    if($this_id > 0)
    	{
                 //$fwViewData['dt_id'] = $detail['tdt_dt_id'];
      		// unset($detail['tdt_dt_id']);
       		 $tableTemplate->setWhere("et_id = $this_id");
	     	 $opr = $tableTemplate->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTemplate->insertRow($detail); 
	}    	
	         $fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
}

$et_id = (int)$fwRequest->getParam('et_id', 0);
if ($et_id > 0)
{
	
	$tableTemplate = new Fw_Db_Table('email_template_mini');
	$tableTemplate->setWhere("et_id = $et_id");
	$detail = $tableTemplate->getRow();
	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
