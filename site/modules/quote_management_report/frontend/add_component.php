<?php
$fwMainView = 'file:' . getcwd() . '/add_component.tpl';
$tableTask = new Fw_Db_Table('quote_builder_component');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('component', array());
	
	$res_staff  = explode("-", $detail['qb_res_staff']);
	$detail['qb_sup_position'] = trim($res_staff[0]);
	$detail['qb_sup_name'] = trim($res_staff[1]);
	$detail['qb_sup_email'] = trim($res_staff[2]);
	
	$supdata = $detail['qb_res_staff'];
	
	$this_id = (int)$detail['qb_id'];
	unset($detail['qb_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['qb_id']);
       		 $tableTask->setWhere("qb_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
		
	
}

$this_id = (int)$fwRequest->getParam('qb_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('quote_builder_component');
	$tableTask->setWhere("qb_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	

$sqlid = "Select co_id from companies where co_company_name  = 'Canberra Granny Flat Builders and Fixed Price Extensions'";
$codata = $fwDb->queryOne($sqlid);
//db($codata);

$sqlCo = "Select cs_position, cs_first_name, cs_surname, cs_primary_email from contacts where cs_company = ". $codata['co_id'];
$fwViewData['datacon'] = $fwDb->query($sqlCo);

$sql_email_code = "SELECT eml_id, eml_code FROM emaillibrary";
$fwViewData['data_email_code'] = $fwDb->query($sql_email_code);

