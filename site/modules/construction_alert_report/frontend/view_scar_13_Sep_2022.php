<?php
$fwMainView = 'file:' . getcwd() . '/view_scar.tpl';

$submit = $fwRequest->getParam('subAddDetail', '');
$car_id = $fwRequest->getParam('car_id', 0);
$fwViewData['car_id'] =  $car_id;

$table = new Fw_Db_Table('email_report');

$sqlc = "select * from supplier_alert ";
$comData = $fwDb->query($sqlc);

$m=0;
foreach($comData as $k => $v)
{
	$emrows = explode(",",$v['sa_supplier_email']);
	$eachemail = array_filter($emrows);
	foreach($eachemail  as $k2=>$v2)
	{
	
	$setdata[$m]['sa_id'] = $v['sa_id'];
	$setdata[$m]['sa_co_id'] = $v['sa_co_id'];
	$setdata[$m]['sa_car_id'] = $v['sa_car_id'];
	
	$setdata[$m]['sa_supplier'] = $v['sa_supplier'];	
	$setdata[$m]['sa_supplier_email'] = $v2;
	$m++;	
	}
}

$er = $fwRequest->getParam('er', '');
if(!empty($er))  {
	
	foreach($setdata as $km=>$vm)
	{
		$sql_vm = "select	cs_id  from contacts where cs_primary_email = '".$vm['sa_supplier_email']."'";
		$vmData = $fwDb->queryOne($sql_vm);
	
		$vmDetail['er_cs_id'] = $vmData['cs_id'];
		$table->setWhere("er_cs_id = ".$vmData['cs_id']);
		
	 	if(!$table->rowExists())
		 {
			$table->insertRow($vmDetail);
		 } 
		 unset($vmDetail);
				
	}
	
}
if(!empty($setdata)) {
foreach($setdata as $k2=>$v2)
{
	$sql_3 = "select	cs_id, cs_first_name, cs_surname  from contacts where cs_primary_email = '".$v2['sa_supplier_email']."'";
	$nameData = $fwDb->queryOne($sql_3);
	
	$setdata[$k2]['cs_id'] = $nameData['cs_id'];
	$setdata[$k2]['contactname'] = $nameData['cs_first_name'] . " ". $nameData['cs_surname'];
	
	
	$sql_4 = "select count(*) as tot from construction_alert_report
	          inner join supplier_alert on construction_alert_report.car_id = supplier_alert.sa_car_id
		  where	 construction_alert_report.car_status = 'Open' And 
		  supplier_alert.sa_supplier_email like '%".$v2['sa_supplier_email']."%'"; 
		  
	$totData = $fwDb->queryOne($sql_4);
	$setdata[$k2]['tot_alert'] = $totData['tot'];	
}
}
//function array_unique_multidimensional($input)
//{
//    $serialized = array_map('serialize', $input);
//    $unique = array_unique($serialized);
//    return array_intersect_key($input, $unique);
//}
//$setdata = array_unique_multidimensional($setdata);
//$setdata = array_map("unserialize", array_unique(array_map("serialize", $setdata)));

//$setdata = multi_unique($setdata);

//foreach($setdata as $t => $s)
//{
//  $em = $s['sa_supplier_email'];
//  
//  $findKey = search_revisions($s,$em, 'sa_supplier_email');
//  db($findKey);	
//}
//exit;

$fwViewData['setdata'] = $setdata;


$email_report = $fwRequest->getParam('email_report', '');
if($email_report && empty($er))
{
	
	 $keys = array_keys($email_report);
	 $ky = $keys[0];
	 $val = $email_report[$ky];
	 $edetail['er_cs_id'] = $ky;
	 
	 $table->setWhere("er_cs_id = ".$ky);
	 if(!$table->rowExists())
	 {
		$table->insertRow($edetail);
	 } else {
	 	$table->deleteRow();
	 }
}

$sqlids = "Select * from email_report";
$fwViewData['emailids'] = $fwDb->query($sqlids);



//if($email_report)
//{
//	 $step = $fwRequest->getParam('step', '');
//	
//	 $keys = array_keys($email_report);
//	 $ky = $keys[0];
//	 $val = $email_report[$ky];
//	
//	 
//	 $detail['apd_email_report'] = $val;
//	 $table->setWhere('apd_id = '.$ky);
//	 if($table->rowExists())
//	 {
//		$this_id = $table->updateRow($detail);
//	 }
//	 
//
//	$sqlcar = "select car_project from construction_alert_report where car_id = ".$car_id;
//	$projdata = $fwDb->queryOne($sqlcar);
//	
//	if($val == 1)
//	{
//		$sql_who =  "Select * from action_plan_step_detail where apd_id  = ".$ky;
//		$whodata = $fwDb->queryOne($sql_who);
//		
//		$who = explode("-",$whodata['apd_who']);
//		$to = trim($who[1]);
//		$to_name = trim($who[0]);
//		$from = "info@cgfb.com.au";
//		$from_name = "CGFB Operations Team";
//		$subject = "Action Step";
//		
//		$sql_proj = "select car_project from construction_alert_report where car_id =  ".$whodata['apd_car_id'];
//		$projdata = $fwDb->queryOne($sql_proj);
//		
//		
//		$message = "Hi ".$to_name."<br><br>";
//		$message .= "Please see the action plan for ".$projdata['car_project']."<br>";
//		$message .= $whodata['apd_step_desc']."<br><br>";
//		$message .= "Regards,<br>";
//		$message .= "CGFB Operations Team";
//		send_email($to_name, $to, $from_name, $from, $subject, $message, $attachment='');
//		
//	}	
//}



