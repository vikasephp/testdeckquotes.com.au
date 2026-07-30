<?php
$fwMainView = 'file:' . getcwd() . '/view_alert.tpl';

$submit = $fwRequest->getParam('subAddDetail', '');
$sup_email = $fwRequest->getParam('sup_email', '');
$fwViewData['sup_email'] = $sup_email;
	
	$sql_1 = "Select se_car_id from supplier_email where  se_email = '".$sup_email."'";
	$carData = $fwDb->query($sql_1);
	
	foreach($carData as $k=>$v)
	{
	
	$sql_2 = "Select *  from construction_alert_report where car_id = ".$v['se_car_id'] . " and car_status = 'Open' ";
	$alertdata = $fwDb->queryOne($sql_2);
		if($alertdata['car_status'] == 'Open') 
		{
	
	  	$sql = 'SELECT  business_sellers.bs_business_id, bus_customers.bcust_misc_email1, bus_customers.bcust_fname, 
			bus_customers.bcust_lname, business.bsn_id, business.bsn_name from business_sellers 		
			Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
			WHERE business.bsn_name LIKE "%'.$alertdata['car_project'].'%"  group by bsn_id' ;
	
		  $data = $fwDb->queryOne($sql);
		  $toname = $data['bcust_fname']. " ". $data['bcust_lname'];
	
		$setdata[$k]['car_alert'] = $alertdata['car_alert'];
		$setdata[$k]['car_project'] = $alertdata['car_project'];
		$setdata[$k]['contact_info'] = $toname;
		$setdata[$k]['car_status'] = $alertdata['car_status'];
		$setdata[$k]['car_date'] = $alertdata['car_date'];
		$setdata[$k]['car_new_date'] = $alertdata['car_new_date'];
		
		$x = explode("<br>",$alertdata['car_include_supplier']);
		
		$incsup='';
		foreach($x as $k2=>$v2)
		{
			preg_match('~>\K[^<>]*(?=<)~',  $v2,$str);
			$incsup = [];
			$incsup[] = $str[0];	
		}
		
		$setdata[$k]['car_include_supplier'] = implode("<br>",$incsup) ;
		$setdata[$k]['car_type'] = $alertdata['car_type'];
		
		$sqlto = "Select pr_priority from car_priority where pr_id = ".$alertdata['car_urgency'];;
		$a = $fwDb->queryOne($sqlto); 
		
		$setdata[$k]['car_urgency'] = $a['pr_priority'];
		
		}
	}
	
	

$fwViewData['alertdata'] = $setdata;
