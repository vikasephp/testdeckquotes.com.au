<?php
$fwMainView = 'file:' . getcwd() . '/include_emails.tpl';
$table = new Fw_Db_Table('construction_alert_report');
$tableSupplier = new Fw_Db_Table('supplier_alert');


$co_id = $fwRequest->getParam('co_id', '');
$car_id = $fwRequest->getParam('car_id', '');
  
$sql2 = "SELECT  contacts.*, companies.co_company_name from contacts
         Inner join companies on contacts.cs_company = companies.co_id where contacts.cs_company = ".$co_id;
$fwViewData['contactdetail'] = $fwDb->query($sql2);

$add_emails = $fwRequest->getParam('add_emails', '');
if(!empty($add_emails))
{
	$emails = $fwRequest->getParam('emails', '');
	

	$name2 ="";
	$email2="";
	foreach($emails as $k => $v)
	{
		$sql_3 = "select	cs_first_name, cs_surname, cs_primary_email from contacts where cs_id = ".$k;
		$data = $fwDb->queryOne($sql_3);
	
		
		$name = $data['cs_first_name'] ." ".$data['cs_surname'];
		$name2 .= $name.", ";
		
		$email = $data['cs_primary_email'];
		$email2 .= $email.",";
		
		// $tableSupplier->setWhere("sa_car_id = ".$car_id. " and sa_co_id = ".$co_id);
	}
	

	 $detail['car_incl_supp_email'] = $email2;
	 $table->setWhere("car_id = ".$car_id);
	 if($table->rowExists())
	 {
		 $this_id = $table->updateRow($detail);
	 }
	
	//exit;
	
	
	
	$fwViewData['opr'] = "Saved...";	
}

