<?php
$fwMainView = 'file:' . getcwd() . '/view_issue_customer.tpl';
$cust_email = $fwRequest->getParam('cust_email', '');
$fwViewData['cust_email'] = $cust_email;
	
	$sql_1 = "SELECT  business_sellers.bs_business_id, bus_customers.bcust_misc_email1, bus_customers.bcust_fname, 
			    bus_customers.bcust_lname, business.bsn_id, business.bsn_name from business_sellers 		
			    Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			    Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
			    WHERE bus_customers.bcust_misc_email1 = '".$cust_email."'";
	
	
	$data = $fwDb->queryOne($sql_1);
	
	
	$sql_2 = "Select *  from construction_alert_report where  car_status = 'Open' and car_project =  '".$data['bsn_name']."' and car_include_cust = 'Yes'";
	$setdata = $fwDb->query($sql_2);
	
	
	
	foreach($setdata as $k=>$v)
	{
		$setdata[$k]['contact_info'] = $data['bcust_fname'].' ' . $data['bcust_lname'];
				
				$x = explode("<br>",$v['car_include_supplier']);
				
				
				$incsup = [];
				foreach($x as $k2=>$v2)
				{
					preg_match('~>\K[^<>]*(?=<)~',  $v2,$str);
					
					$incsup[] = $str[0];	
				}
				
				$setdata[$k]['car_include_supplier'] = implode("<br>",$incsup) ;
				
				$sqlto = "Select pr_priority from car_priority where pr_id = ".$v['car_urgency'];;
				$a = $fwDb->queryOne($sqlto); 
				
				
				$setdata[$k]['car_priority'] = $a['pr_priority'];
	}
	
	$fwViewData['custdata'] = $setdata;