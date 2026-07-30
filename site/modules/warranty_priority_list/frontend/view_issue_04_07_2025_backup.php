<?php
$fwMainView = 'file:' . getcwd() . '/view_issue.tpl';

$submit = $fwRequest->getParam('subAddDetail', '');
$sup_email = $fwRequest->getParam('sup_email', '');
$fwViewData['sup_email'] = $sup_email;
	
	$sql_1 = "Select se_wa_id from supplier_email_warranty where  se_email = '".$sup_email."'";
	$carData = $fwDb->query($sql_1);
	
	foreach($carData as $k=>$v)
	{
	
	$sql_2 = "Select *  from warranty_log where wa_id = ".$v['se_wa_id'] . "  and ( wa_status = 'Open' Or wa_status = 'Pending' )";
	$alertdata = $fwDb->queryOne($sql_2);
		if($alertdata['wa_status'] == 'Open' || $alertdata['wa_status'] == 'Pending') 
		{
	
	  	$sql = 'SELECT  business_sellers.bs_business_id, bus_customers.bcust_misc_email1, bus_customers.bcust_fname, 
			bus_customers.bcust_lname, business.bsn_id, business.bsn_name from business_sellers 		
			Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
			WHERE business.bsn_name LIKE "%'.$alertdata['wa_project'].'%"  group by bsn_id' ;
	
		  $data = $fwDb->queryOne($sql);
		  $toname = $data['bcust_fname']. " ". $data['bcust_lname'];
	
		$setdata[$k]['wa_problem'] = $alertdata['wa_problem'];
		$setdata[$k]['wa_project'] = $alertdata['wa_project'];
		$setdata[$k]['contact_info'] = $toname;
		$setdata[$k]['wa_status'] = $alertdata['wa_status'];
		$setdata[$k]['wa_date'] = $alertdata['wa_date'];
		//$setdata[$k]['car_new_date'] = $alertdata['car_new_date'];
		
		$x = explode("<br>",$alertdata['wa_include_supplier']);
		
		$incsup = [];
		foreach($x as $k2=>$v2)
		{
			preg_match('~>\K[^<>]*(?=<)~',  $v2,$str);
			
			$incsup[] = $str[0];	
		}
		
		$setdata[$k]['wa_include_supplier'] = implode("<br>",$incsup) ;
		$setdata[$k]['wa_type'] = $alertdata['wa_type'];
		
		$sqlto = "Select pr_priority from warranty_log_priority where pr_id = ".$alertdata['wa_priority'];;
		$a = $fwDb->queryOne($sqlto); 
		
		$setdata[$k]['wa_priority'] = $a['pr_priority'];
		
		}
	}
	
	

$fwViewData['alertdata'] = $setdata;
