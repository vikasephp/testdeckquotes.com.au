<?php
$fwMainView = 'file:' . getcwd() . '/include_suppliers.tpl';
$table = new Fw_Db_Table('project_progress_report');
$tableSupplier = new Fw_Db_Table('supplier_project_progress');

$pp_id = $fwRequest->getParam('pp_id', '');
   
$sql2 = "SELECT   companies.co_id, companies.co_company_name from  companies";	 
$fwViewData['contactdetail'] = $fwDb->query($sql2);

$add_suppliers = $fwRequest->getParam('add_suppliers', '');
if(!empty($add_suppliers))
{
	$supplier = $fwRequest->getParam('supplier', '');
	
	$name2 ="";
	$email2="";
	
	$tableSupplier->setWhere("sp_pp_id = ".$pp_id);
	$tableSupplier->deleteRows();
	
	$range="(";
	foreach($supplier as $k => $v)
	{
		
		//db($k);
		$sql_3 = "Select companies.co_id, companies.co_company_name from companies where co_id = ".$k;
		$data = $fwDb->queryOne($sql_3);
		$name = "<a href = '".BASE_URL."project_progress_report.show-contacts/co_id/".$k. "/pp_id/".$pp_id."' class='various'>"
		.$data['co_company_name']."</a>";
		$name2 .= $name."<br>";
		
		$newData['sp_co_id'] = $data['co_id'];
		$newData['sp_pp_id'] = $pp_id;
		$newData['sp_supplier'] = $data['co_company_name'];
		$this_id = $tableSupplier->insertRow($newData);
		
		$range .= $k ."," ;
		
	}
	
	 $range .= "0)";
	 
	// db($pp_id); 
	 //db($range);
	 
	 $sqlUn = "delete from supplier_email_pp where se_pp_id = ".$pp_id." And se_co_id NOT IN ".$range;
	 
	$temp =  $fwDb->queryOne($sqlUn);
	 	
	 $detail['pp_include_supplier'] = $name2;
	
	 $table->setWhere("pp_id = ".$pp_id);
	 if($table->rowExists())
	 {
		 $this_id = $table->updateRow($detail);
	 }

	
	$fwViewData['opr'] = "Saved...";	
	
	
}

$sqlc = "select pp_include_supplier from project_progress_report where pp_id = ".$pp_id;
$comData = $fwDb->queryOne($sqlc);

$x = explode("<br>",$comData['pp_include_supplier']);

$incsup = [];
foreach($x as $k2=>$v2)
{
preg_match('~>\K[^<>]*(?=<)~',  $v2,$str);
$incsup[] = $str[0];	
}
$fwViewData['incsup'] = $incsup;

