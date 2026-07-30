<?php

//$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
//        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status_sys_date, business.bsn_address from business_sellers 		
//		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
//		Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
//		where business.bsn_status Like '%|4|%' Order By business.bsn_status_sys_date DESC";


		//where bus_automated_reports.bar_report_yesno = 1 And bus_automated_reports.bar_ar_id = 1 
		//And business.bsn_status Like '%|4|%' Order By business.bsn_status_sys_date DESC


$sql = "select business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status_sys_date, business.bsn_address from business
		where business.bsn_status Like '%|4|%' Order By business.bsn_status_sys_date DESC";

$paData = $fwDb->query($sql);
 

$message = "<html> <body>";
$message .= "<h3> Completed Report</h3><br><br>";
$message .= "<table border ='1' cellpadding='3' cellspacing='0' style='border-collapse:collapse'>";
$message .= "<tr><td>SrNo</td><td>Project Address</td><td>Link</td><td>COM Date </td>
			<td>Completion Package</td> <td>30 Day Letter</td><td>60 Day Conversation  </td>
			<td>Video Walkthrough </td>
			<td>Google Review </td>
			<td>Written Testimonial </td>
			<td>365 Day <br>Letter</td>
			<td>365 Day <br>Conversation  </td>
			<td>365 Day <br>Gift</td> 
			</tr>";

	$srno=1;
	foreach($paData as $k => $v)
	{
				$bsn_id =  $v['bsn_id'];
		
				$Statusdate = changedate_y_m_d($v['bsn_status_sys_date']);
				$curdate_y_m_d = date('Y-m-d');
				$days_at_status = daysDifference($curdate_y_m_d, $Statusdate);
				
				// Uid 556
				
				$sqluid556 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $bsn_id . " And business_tasks.bt_task_id = 556";
	
				$yndata556 = $fwDb->queryOne($sqluid556);
								
				$tuid_556 = $yndata556['bt_complete'];
				if($tuid_556 == 1) 
				{
					 $uidcomplete556 = $yndata556['bt_completed_date'];
				} 
	
				else 
				{ 
					 $uidcomplete556 = "No"; 
				}
				//
				
				
				// Uid 557
				
				$sqluid557 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $bsn_id . " And business_tasks.bt_task_id = 557";
	
				$yndata557 = $fwDb->queryOne($sqluid557);
								
				$tuid_557 = $yndata557['bt_complete'];
				if($tuid_557 == 1) 
				{
					 $uidcomplete557 = $yndata557['bt_completed_date'];
				} 
	
				else 
				{ 
					 $uidcomplete557 = "No"; 
				}
				//
				
		
				// Uid 558
				
				$sqluid558 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $bsn_id . " And business_tasks.bt_task_id = 558";
	
				$yndata558 = $fwDb->queryOne($sqluid558);
								
				$tuid_558 = $yndata558['bt_complete'];
				if($tuid_558 == 1) 
				{
					 $uidcomplete558 = $yndata558['bt_completed_date'];
				} 
				else 
				{ 
					 $uidcomplete558 = "No"; 
				}
				
				//

				
				// Uid 560
				
				$sqluid560 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $bsn_id . " And business_tasks.bt_task_id = 560";
	
				$yndata560 = $fwDb->queryOne($sqluid560);
								
				$tuid_560 = $yndata560['bt_complete'];
				if($tuid_560 == 1) 
				{
					 $uidcomplete560 = $yndata560['bt_completed_date'];
				} 
	
				else 
				{ 
					 $uidcomplete560 = "No"; 
				}
				//
			
				
				// Uid 559
				
				$sqluid559 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $bsn_id . " And business_tasks.bt_task_id = 559";
	
				$yndata559 = $fwDb->queryOne($sqluid559);
								
				$tuid_559 = $yndata559['bt_complete'];
				if($tuid_559 == 1) 
				{
					 $uidcomplete559 = $yndata559['bt_completed_date'];
				} 
	
				else 
				{ 
					 $uidcomplete559 = "No"; 
				}
				//
				
				// Uid 431
				
				$sqluid431 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $bsn_id . " And business_tasks.bt_task_id = 431";
	
				$yndata431 = $fwDb->queryOne($sqluid431);
								
				$tuid_431 = $yndata431['bt_complete'];
				if($tuid_431 == 1) 
				{
					 $uidcomplete431 = changedate_d_m_y($yndata431['bt_completed_date']);
				} 
				else 
				{ 
					 $uidcomplete431 = "No"; 
				}
				//
				
				// Uid 432
				
				$sqluid432 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $bsn_id . " And business_tasks.bt_task_id = 432";
	
				$yndata432 = $fwDb->queryOne($sqluid432);
								
				$tuid_432 = $yndata432['bt_complete'];
				if($tuid_432 == 1) 
				{
					 $uidcomplete432 = changedate_d_m_y($yndata432['bt_completed_date']);
				} 
				else 
				{ 
					 $uidcomplete432 = "No"; 
				}
		
				//
				
				// Uid 561
				
				$sqluid561 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $bsn_id . " And business_tasks.bt_task_id = 561";
	
				$yndata561 = $fwDb->queryOne($sqluid561);
								
				$tuid_561 = $yndata561['bt_complete'];
				if($tuid_561 == 1) 
				{
					 $uidcomplete561 = changedate_d_m_y($yndata561['bt_completed_date']);
				} 
				else 
				{ 
					 $uidcomplete561 = "No"; 
				}
		
				//
				
				// Uid 562
				
				$sqluid562 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $bsn_id . " And business_tasks.bt_task_id = 562";
	
				$yndata562 = $fwDb->queryOne($sqluid562);
								
				$tuid_562 = $yndata562['bt_complete'];
				if($tuid_562 == 1) 
				{
					 $uidcomplete562 = changedate_d_m_y($yndata562['bt_completed_date']);
				} 
				else 
				{ 
					 $uidcomplete562 = "No"; 
				}
		
				//
				
				
				$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$bsn_id;			
		        $sfu = "Select count(*) as tot from  sales_followup where sf_pid = ".$v['bsn_id'];
        		$sfData = $fwDb->queryOne($sfu);
							
				$message .= "<tr>";
				$message .= "<td>".$srno."</td>";
				$message .= "<td>".$v['bsn_address']."</td>";
				$message .= "<td><a href =".$link.">Link</a></td>";
				$message .= "<td> </td>";
				$message .= "<td align='center'>".$uidcomplete556."</td>";
				$message .= "<td align='center'>".$uidcomplete557."</td>";
				$message .= "<td align='center'>".$uidcomplete558."</td>";
			    $message .= "<td align='center'>".$uidcomplete560."</td>";
				$message .= "<td align='center'>".$uidcomplete559."</td>";
				$message .= "<td align='center'>".$uidcomplete431."</td>";
				$message .= "<td align='center'>".$uidcomplete432."</td>";
				$message .= "<td align='center'>".$uidcomplete561."</td>";
				$message .= "<td align='center'>".$uidcomplete562."</td>";
				
				$message .= "</tr>";
				$srno++;
   }

		$message .= "</table></body></html>";
		
		//db($message);
		//exit;

    	$sqle = "Select ar_receving_email from automated_reports where ar_id = 1";
		$emaildata = $fwDb->queryOne($sqle);
		
		$emails = explode(",", $emaildata['ar_receving_email']);
		
		if(!empty($emails)) {
			foreach($emails as $ve)
			{
				send_email('Frank Walmsley', trim($ve), 'CGFB', 'info@cgfb.com.au', 'Completed Report', $message, $attachment='');	
			}
		}
		

//send_email('Frank Walmsley', 'marketing@cgfb.com.au', 'CGFB', 'info@cgfb.com.au', 'Planning Assessment Report', $message, $attachment='');
//send_email('Frank Walmsley', 'info@cgfb.com.au', 'CGFB', 'info@cgfb.com.au', 'Planning Assessment Report', $message, $attachment='');
send_email('Manoj Soni', 'manojsoniephp@gmail.com', 'CGFB', 'info@cgfb.com.au', 'Completed Report', $message, $attachment='');

exit;
	