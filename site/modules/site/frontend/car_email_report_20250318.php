<?php

$sql_1 = "Select distinct car_project from construction_alert_report where car_include_cust ='Yes' ";

$current_date1 = date('Y-m-d');
$day = date("D", strtotime($current_date1));


$Data_1 = $fwDb->query($sql_1);

foreach ($Data_1 as $k1=>$v1) 
{
$sql_2 = 'SELECT  business_sellers.bs_business_id, bus_customers.bcust_misc_email1, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name from business_sellers 		
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
	WHERE business.bsn_name LIKE "%'.$v1['car_project'].'%"  group by bsn_id' ;
		
	$data_2 = $fwDb->query($sql_2);
		
	foreach($data_2 as $k2=>$v2)
	{
		$message = "<html> <body>";
		$message .= "<p>Dear " .$v2['bcust_fname']." </p><br>";
		$message .= "<p>Here is the construction alert report for your project</p><br>";
		$message .= "<table border ='1' cellpadding='3' cellspacing='0' style='border-collapse:collapse'>";
		$message .= "<tr><td>Project</td><td>Date</td><td>Alert</td><td>Photo Link</td></tr>";
	 
	 	$to = $v2['bcust_misc_email1']; 
		$toname = $v2['bcust_fname'];
	 
	  $sqlfinal = 'Select car_project, car_date, car_alert, car_image1, car_image2, car_image3, car_image4, car_image5
	               from construction_alert_report where car_project LIKE "%'.$v2['bsn_name'].'%"';

	  $datafinal = $fwDb->query($sqlfinal);
	  
		  foreach($datafinal as $k3=>$v3)
		  {
		  if($v3['car_image1']) { $link1 = "<a href = " .BASE_URL ."files/uploads/".$v3['car_image1']. ">Link1</a>" ; } else { $link1=''; }
		  if($v3['car_image2']) { $link2 = "<a href = " .BASE_URL ."files/uploads/".$v3['car_image2']. ">Link2</a>" ; } else { $link2=''; }
		  if($v3['car_image3']) { $link3 = "<a href = " .BASE_URL ."files/uploads/".$v3['car_image3']. ">Link3</a>" ; } else { $link3=''; }
		  if($v3['car_image4']) { $link4 = "<a href = " .BASE_URL ."files/uploads/".$v3['car_image4']. ">Link4</a>" ; } else { $link4=''; }
		  if($v3['car_image5']) { $link5 = "<a href = " .BASE_URL ."files/uploads/".$v3['car_image5']. ">Link5</a>" ; } else { $link5=''; }
		  	  
			  $message .= "<tr><td>".$v3['car_project']."</td>";
			  $message .= "<td>".$v3['car_date']."</td>";
			  $message .= "<td>".$v3['car_alert']."</td>";
			  
			  $message .= "<td>".$link1." ".$link2." ".$link3." ".$link4." ".$link5."</td></tr>";
			  unset($link1);  unset($link2); unset($link3); unset($link4); unset($link5);
		  }
		  $message .= "</table></body></html>";
		 // db($message);
		if($day == 'Fri') {
			send_email($toname, $to, 'CGFB', 'alerts@cgfb.com.au', 'Construction Alert Report', $message, $attachment='');
		}
	}
	
	
}
exit;


	