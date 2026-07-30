<?php
$fwMainView = 'file:' . getcwd() . '/include_suppliers.tpl';
$table = new Fw_Db_Table('construction_alert_report');
$tableSupplier = new Fw_Db_Table('supplier_alert');

$car_id = $fwRequest->getParam('car_id', '');
  
//$sql2 = "SELECT  contacts.*, companies.co_id, companies.co_company_name from contacts
//         Inner join companies on contacts.cs_company = companies.co_id";
	 
$sql2 = "SELECT   companies.co_id, companies.co_company_name from  companies";	 
$fwViewData['contactdetail'] = $fwDb->query($sql2);


$add_suppliers = $fwRequest->getParam('add_suppliers', '');
if(!empty($add_suppliers))
{
	$supplier = $fwRequest->getParam('supplier', '');
	
	
	$name2 ="";
	$email2="";
	
	$tableSupplier->setWhere("sa_car_id = ".$car_id);
	$tableSupplier->deleteRows();
	
	$range="(";
	foreach($supplier as $k => $v)
	{
		
		//db($k);
		$sql_3 = "Select companies.co_id, companies.co_company_name from companies where co_id = ".$k;
		$data = $fwDb->queryOne($sql_3);
		$name = "<a href = '".BASE_URL."construction_alert_report.show-contacts/co_id/".$k. "/car_id/".$car_id."' class='various'>"
		.$data['co_company_name']."</a>";
		$name2 .= $name."<br>";
		
		$newData['sa_co_id'] = $data['co_id'];
		$newData['sa_car_id'] = $car_id;
		$newData['sa_supplier'] = $data['co_company_name'];
		$this_id = $tableSupplier->insertRow($newData);
		
		$range .= $k ."," ;
		
	}
	
	 $range .= "0)";
	 
	// db($car_id); 
	 //db($range);
	 
	 $sqlUn = "delete from supplier_email where se_car_id = ".$car_id." And se_co_id NOT IN ".$range;
	 
	$temp =  $fwDb->queryOne($sqlUn);
	 	
	 $detail['car_include_supplier'] = $name2;
	
	 $table->setWhere("car_id = ".$car_id);
	 if($table->rowExists())
	 {
		 $this_id = $table->updateRow($detail);
	 }

	
	$fwViewData['opr'] = "Saved...";	
	
	
}

$sqlc = "select car_include_supplier from construction_alert_report where car_id = ".$car_id;
$comData = $fwDb->queryOne($sqlc);

$x = explode("<br>",$comData['car_include_supplier']);


foreach($x as $k2=>$v2)
{
preg_match('~>\K[^<>]*(?=<)~',  $v2,$str);
$incsup[] = $str[0];	
}
$fwViewData['incsup'] = $incsup;

