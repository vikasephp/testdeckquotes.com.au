<?php
$fwMainView = 'file:' . getcwd() . '/view_ic_alert.tpl';

$submit = $fwRequest->getParam('subAddDetail', '');
$ic_id = $fwRequest->getParam('ic_id', '');
$fwViewData['ic_id'] = $ic_id;
	
	
	$sql = "Select ic_project  from include_customers where ic_id = ".$ic_id;
	
	$projdata = $fwDb->queryOne($sql);
	
		
	$sql2 = "select * from construction_alert_report where car_project like '%".$projdata['ic_project']."%' 
		 and car_status = 'Open' and car_include_cust = 'Yes'";
	$alertdata = $fwDb->query($sql2);
	
	foreach($alertdata as $k=>$v)
	{
	
		$sql = 'SELECT  business_sellers.bs_business_id, bus_customers.bcust_misc_email1, bus_customers.bcust_fname, 
			bus_customers.bcust_lname, business.bsn_id, business.bsn_name from business_sellers 		
			Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
			WHERE business.bsn_name LIKE "%'.$v['car_project'].'%"  group by bsn_id' ;
	
		  $data = $fwDb->queryOne($sql);
		  $toname = $data['bcust_fname']. " ". $data['bcust_lname'];
		  
		  $alertdata[$k]['contact_info'] = $toname;
		  
		  
		  $x = explode("<br>",$v['car_include_supplier']);

		$incsup='';
		foreach($x as $k2=>$v2)
		{
			preg_match('~>\K[^<>]*(?=<)~',  $v2,$str);
			$incsup[] = $str[0];	
		}
	
		$alertdata[$k]['car_include_supplier'] = implode("<br>",$incsup) ;
		//$alertdata[$k]['car_type'] = $v['car_type'];
		
		$sqlto = "Select pr_priority from car_priority where pr_id = ".$v['car_urgency'];;
		$a = $fwDb->queryOne($sqlto); 
		
		$alertdata[$k]['car_urgency'] = $a['pr_priority'];	
	}
	

$fwViewData['alertdata'] = $alertdata;
