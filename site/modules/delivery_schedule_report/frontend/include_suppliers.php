<?php
$fwMainView = 'file:' . getcwd() . '/include_suppliers.tpl';
$table = new Fw_Db_Table('delivery_schedule_report');
$tableTrades = new Fw_Db_Table('delivery_trades');

$ds_id = $fwRequest->getParam('ds_id', '');
  	 
$sql2 = "SELECT   companies.co_id, companies.co_company_name from  companies";	 
$fwViewData['contactdetail'] = $fwDb->query($sql2);

$add_trades = $fwRequest->getParam('add_trades', '');
if(!empty($add_trades))
{
	$trades = $fwRequest->getParam('trades', '');
	
	$name2 ="";
	$email2="";
	
	$tableTrades->setWhere("dt_ds_id = ".$ds_id);
	$tableTrades->deleteRows();
	
	$range="(";
	foreach($trades as $k => $v)
	{
		
		//db($k);
		$sql_3 = "Select companies.co_id, companies.co_company_name from companies where co_id = ".$k;
		$data = $fwDb->queryOne($sql_3);
		$name = "<a href = '".BASE_URL."delivery_schedule_report.show-contacts/co_id/".$k. "/ds_id/".$ds_id."' class='various'>"
		.$data['co_company_name']."</a>";
		$name2 .= $name."<br>";
		
		$newData['dt_co_id'] = $data['co_id'];
		$newData['dt_ds_id'] = $ds_id;
		$newData['dt_trade'] = $data['co_company_name'];
		$this_id = $tableTrades->insertRow($newData);
		
		$range .= $k ."," ;
		
	}
	
	 $range .= "0)";
	 
	 
	// $sqlUn = "delete from supplier_email where se_car_id = ".$ds_id." And se_co_id NOT IN ".$range;
	 //$temp =  $fwDb->queryOne($sqlUn);
	 	
	 $detail['ds_include_trades'] = $name2;
	
	 $table->setWhere("ds_id = ".$ds_id);
	 if($table->rowExists())
	 {
		 $this_id = $table->updateRow($detail);
	 }

	
	$fwViewData['opr'] = "Saved...";	
	
	
}

$sqlc = "select ds_include_trades from delivery_schedule_report where ds_id = ".$ds_id;
$comData = $fwDb->queryOne($sqlc);

$x = explode("<br>",$comData['ds_include_trades']);


foreach($x as $k2=>$v2)
{
preg_match('~>\K[^<>]*(?=<)~',  $v2,$str);
$incsup[] = $str[0];	
}
$fwViewData['incsup'] = $incsup;

