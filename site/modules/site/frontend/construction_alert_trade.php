<?php
$bsn_id = $fwRequest->getParam('bsn_id', '');



if(isset($_SESSION['email'])) 
{
	$sql_1 = "Select bsn_name from business where bsn_id = ".$bsn_id;
	$bsndetail = $fwDb->queryOne($sql_1);		 
		
	$sql_2 = "SELECT  *  FROM construction_alert_report
		      WHERE car_incl_supp_email like '%".$_SESSION['email']."%' and car_status = 'Open' and  car_project  = '".$bsndetail['bsn_name']."'";  
	
		 	
	$detail_1 = $fwDb->query($sql_2);
	

		
    foreach($detail_1 as $k=>$v)
	{
		
					$dayscount='';
					$ccdate = $v['car_date'];
					if(!empty($ccdate)) {
						$Statusdate = changedate_y_m_d($ccdate);
						$curdate_y_m_d = date('Y-m-d');
						$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
						}
	
	  	$sql = 'SELECT  business_sellers.bs_business_id, bus_customers.bcust_misc_email1, bus_customers.bcust_fname, 
			    bus_customers.bcust_lname, bus_customers.bcust_misc_moble , business.bsn_id, business.bsn_name from business_sellers 		
			    Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			    Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
			    WHERE business.bsn_name LIKE "%'.$v['car_project'].'%"  group by bsn_id' ;
	
				  $data = $fwDb->queryOne($sql);
				  $toname = $data['bcust_fname']. " ". $data['bcust_lname']. "  -  ".$data['bcust_misc_moble'];
			
				$setdata[$k]['car_id'] = $v['car_id'];
				$setdata[$k]['car_alert'] = $v['car_alert'];
				$setdata[$k]['car_project'] = $v['car_project'];
				$setdata[$k]['contact_info'] = $toname;
				$setdata[$k]['car_status'] = $v['car_status'];
				$setdata[$k]['car_date'] = $v['car_date'];
				$setdata[$k]['dayscount'] = $dayscount;
				
				$setdata[$k]['car_image1'] = $v['car_image1'];
				$setdata[$k]['car_image2'] = $v['car_image2'];
				$setdata[$k]['car_image3'] = $v['car_image3'];
				$setdata[$k]['car_image4'] = $v['car_image4'];
				$setdata[$k]['car_image5'] = $v['car_image5'];
				$setdata[$k]['car_image5'] = $v['car_image5'];
				
				$setdata[$k]['car_video'] = $v['car_video'];
				
				$x = explode("<br>",$v['car_include_supplier']);
				
				$incsup = [];
				foreach($x as $k2=>$v2)
				{
					preg_match('~>\K[^<>]*(?=<)~',  $v2,$str);
					
					$incsup[] = $str[0];	
				}
		
				$setdata[$k]['car_include_supplier'] = implode("<br>",$incsup) ;
				if($v['car_type'] == -1) {
					$setdata[$k]['car_type'] = '';
				}else {
					$setdata[$k]['car_type'] = $v['car_type'];
				}
				$sqlto = "Select pr_priority from construction_alert_report_priority where pr_id = ".$v['car_priority'];;
				$a = $fwDb->queryOne($sqlto); 
				
				$setdata[$k]['car_priority'] = $a['pr_priority'];
		
		}
		
		$fwViewData['issues'] = $setdata;	
	
		

}
else {
	Location(BASE_URL ."site.supplier_login/error/1" );
		
}


