<?php
$fwMainView = 'file:' . getcwd() . '/view_issue_resstaff.tpl';
$staff_email = $fwRequest->getParam('staff_email', '');
$fwViewData['staff_email'] = $staff_email;
	
	$sql_2 = "SELECT * FROM construction_alert_report WHERE car_resp_staff like '% ".$staff_email ."%' and (car_status = 'Open' Or car_status='Pending')" ;
	$setdata = $fwDb->query($sql_2);
	
	
	foreach($setdata as $k=>$v)
	{
		
		$sql_1 = "SELECT  business_sellers.bs_business_id, bus_customers.bcust_misc_email1, bus_customers.bcust_fname, 
			    bus_customers.bcust_lname, business.bsn_id, business.bsn_name from business_sellers 		
			    Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			    Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
			    WHERE business.bsn_name = '".$v['car_project']."'";
		$data = $fwDb->queryOne($sql_1);
		
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