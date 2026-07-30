<?php
$fwMainView = 'file:' . getcwd() . '/include_suppliers_whos.tpl';
$table = new Fw_Db_Table('warranty_log');
$tableSupplier = new Fw_Db_Table('warranty_whos_paying');

$wa_id = $fwRequest->getParam('wa_id', '');
  	 
$sql2 = "SELECT   companies.co_id, companies.co_company_name from  companies";	 
$fwViewData['contactdetail'] = $fwDb->query($sql2);


$add_suppliers = $fwRequest->getParam('add_suppliers', '');
if(!empty($add_suppliers))
{
	$supplier = $fwRequest->getParam('supplier', '');
	
	$name2 ="";
	$email2="";
	
	$tableSupplier->setWhere("sa_wa_id = ".$wa_id);
	$tableSupplier->deleteRows();
	
	$range="(";
	foreach($supplier as $k => $v)
	{
		
		$sql_3 = "Select companies.co_id, companies.co_company_name from companies where co_id = ".$k;
		$data = $fwDb->queryOne($sql_3);
		$name = "<a href = '".BASE_URL."warranty_log.show-contacts/co_id/".$k. "/wa_id/".$wa_id."' class='various'>"
		.$data['co_company_name']."</a>";
		$name2 .= $name."<br>";
		
		$newData['sa_co_id'] = $data['co_id'];
		$newData['sa_wa_id'] = $wa_id;
		$newData['sa_supplier'] = $data['co_company_name'];
		$this_id = $tableSupplier->insertRow($newData);
		
		$range .= $k ."," ;
		
	}
	
	 $range .= "0)";
	 
	 
	 $sqlUn = "delete from warranty_whos_paying_email  where se_wa_id = ".$wa_id." And se_co_id NOT IN ".$range;
	 
	 $temp =  $fwDb->queryOne($sqlUn);
	 	
	 $detail['wa_whos_paying'] = $name2;
	
	 $table->setWhere("wa_id = ".$wa_id);
	 if($table->rowExists())
	 {
		 $this_id = $table->updateRow($detail);
	 }

	
	$fwViewData['opr'] = "Saved...";	
		
}

$sqlc = "select wa_whos_paying from warranty_log where wa_id = ".$wa_id;
$comData = $fwDb->queryOne($sqlc);

$x = explode("<br>",$comData['wa_include_supplier']);

$incsup = [];
foreach($x as $k2=>$v2)
{
preg_match('~>\K[^<>]*(?=<)~',  $v2,$str);

$incsup[] = $str[0];	
}


$fwViewData['incsup'] = $incsup;

