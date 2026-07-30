<?php
$fwMainView = 'file:' . getcwd() . '/view_staff_included.tpl';

$submit = $fwRequest->getParam('subAddDetail', '');
$car_id = $fwRequest->getParam('car_id', 0);
$fwViewData['car_id'] =  $car_id;

$table = new Fw_Db_Table('include_resp_staff');

$update_contact = $fwRequest->getParam('update_contact', '');
if(!empty($update_contact)) {
	$sql_c = " select ir_email from include_resp_staff ";
	$datac = $fwDb->query($sql_c);
	foreach($datac as $kc => $vc)
	{
		$sqlnew = "Select cs_position, cs_first_name, cs_surname from contacts where cs_primary_email = '".$vc['ir_email']."'";
		$newdata = $fwDb->queryOne($sqlnew);
		
		if(count($newdata) > 0) {
		
			$updateDetail['ir_position'] = $newdata['cs_position'];
			$updateDetail['ir_first_name'] = $newdata['cs_first_name'];
			$updateDetail['ir_surname'] = $newdata['cs_surname'];
		
			$table->setWhere("ir_email = '".$vc['ir_email']."'");
			$table->updateRow($updateDetail);
		} else {
			$table->setWhere("ir_email = '".$vc['ir_email']."'");
			$table->deleteRow();
		}
		
	}	
}




$email_report = $fwRequest->getParam('email_report', '');
if($email_report)
{
	
	 $keys = array_keys($email_report);
	 $ky = $keys[0];
	 $val = $email_report[$ky];
	 if($val == 'on' ) { $edetail['ir_auto_email'] = 1; } else { $edetail['ir_auto_email'] = 0; }
	 
	 
	 $table->setWhere("ir_id = ".$ky);
	 if($table->rowExists())
	 {
		$table->updateRow($edetail);
	 } 
}

$sqlA = "select distinct ir_car_id from include_resp_staff ";
$dataA = $fwDb->query($sqlA);
foreach($dataA as $k=>$v)
{
	
	$sqlB = "select car_status from construction_alert_report where car_id = ".$v['ir_car_id'];
	$dataB = $fwDb->queryOne($sqlB);
	
	
	$detail['ir_status'] = $dataB['car_status'];
	 $table->setWhere("ir_car_id = ".$v['ir_car_id']);
	 if($table->rowExists())
	 {
		$table->updateRow($detail);
	 } 
}

$sqls = "select ir_id, ir_position, ir_first_name, ir_surname, ir_email, sum(ir_no_of_alerts) as tot, ir_auto_email 
         from include_resp_staff where ir_status = 'Open' 
         group by ir_email";
	 
$staffData = $fwDb->query($sqls);

foreach($staffData as $sk=>$sv)
{

		$sqlcom = "Select cs_first_name, cs_surname from contacts where cs_primary_email = '".$sv['ir_email']."'";
		
		$comData = $fwDb->query($sqlcom);
		
		if(count($comData) >=2 ) {
		$name1="";
		foreach($comData as $n => $m)
		{
		$name1  .= implode(" ",$m) .", ";
		}
		
		$staffData[$sk]['ir_first_name'] = $name1;
		$staffData[$sk]['ir_surname'] = '';
		}
}



$fwViewData['staffData'] = $staffData;
