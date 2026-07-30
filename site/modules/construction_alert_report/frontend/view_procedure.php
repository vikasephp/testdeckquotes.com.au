<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';

$thisTable = new Fw_Db_Table("procedure_panel_car");
$rsTable = new Fw_Db_Table("pp_car_rs");

$rs_id = $fwRequest->getParam('rs_id', '');
if(!empty($rs_id)) {
	$rsTable->setWhere("rs_id = $rs_id");
	$rsTable->deleteRow();
}

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 


$sqlcb = "SELECT contacts.cs_position, contacts.cs_first_name, contacts.cs_surname, contacts.cs_primary_email from contacts 
          Inner join companies ON contacts.cs_company = companies.co_id 
	  where companies.co_company_name = 'Canberra Granny Flat Builders and Fixed Price Extensions'";
	  
$cbdata = $fwDb->query($sqlcb); 

foreach($cbdata as $k1=>$v1)
{
	$staffdata[$k1]['po_name_eml'] = $v1['cs_position'] .' -- '.$v1['cs_first_name'] .' '.$v1['cs_surname'];	
}
$fwViewData['staffdata'] = $staffdata; 

$key = $fwRequest->getParam('key', '');
if(!empty($key))
{
	$detail['rs_pr_id'] = $fwRequest->getParam('pr_id', '');
	$detail['rs_relevant_staff'] = $key;
	$opr = $rsTable->insertRow($detail); 	
}

$rsTable = new Fw_Db_Table("pp_car_rs");
$fwViewData['rsdata'] = $rsTable->getAllRows(); 
