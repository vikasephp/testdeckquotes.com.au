<?php
$fwMainView = 'file:' . getcwd() . '/view_scar.tpl';

$submit = $fwRequest->getParam('subAddDetail', '');
$car_id = $fwRequest->getParam('car_id', 0);
$fwViewData['car_id'] =  $car_id;

$table = new Fw_Db_Table('supplier_email');

$email_report = $fwRequest->getParam('email_report', '');
if($email_report)
{
	
	 $keys = array_keys($email_report);
	 $ky = $keys[0];
	 $val = $email_report[$ky];
	 if($val == 'on' ) { $edetail['se_auto_email'] = 1; } else { $edetail['se_auto_email'] = 0; }
	 
	 
	 $table->setWhere("se_id = ".$ky);
	 if($table->rowExists())
	 {
		$table->updateRow($edetail);
	 } 
}

$sqlA = "select distinct se_car_id from supplier_email ";
$dataA = $fwDb->query($sqlA);
foreach($dataA as $k=>$v)
{
	$sqlB = "select car_status from construction_alert_report where car_id = ".$v['se_car_id'];
	$dataB = $fwDb->queryOne($sqlB);
	
	
	 $detail['se_status'] = $dataB['car_status'];
	 $table->setWhere("se_car_id = ".$v['se_car_id']);
	 if($table->rowExists())
	 {
		$table->updateRow($detail);
	 } 
}

$sqls = "select se_id, se_supplier, se_first_name, se_surname, se_email, sum(se_no_of_alerts) as tot, se_auto_email 
	 from supplier_email where se_status = 'Open'
         group by se_email";
$supemailData = $fwDb->query($sqls);

foreach($supemailData as $sk=>$sv)
{

	$sqlcom = "Select cs_first_name, cs_surname from contacts where cs_primary_email = '".$sv['se_email']."'";
		
		$comData = $fwDb->query($sqlcom);
		
		if(count($comData) >=2 ) {
		$name1="";
		foreach($comData as $n => $m)
		{
		$name1  .= implode(" ",$m) .", ";
		}
		
		$supemailData[$sk]['se_first_name'] = $name1;
		$supemailData[$sk]['se_surname'] = '';
		}

	
}



$fwViewData['supemailData'] = $supemailData;

