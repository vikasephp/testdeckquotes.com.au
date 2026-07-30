<?php

$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status_sys_date from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
		Inner Join bus_automated_reports ON  business_sellers.bs_business_id =  bus_automated_reports.bar_bsn_id
		where bus_automated_reports.bar_report_yesno = 1 And bus_automated_reports.bar_ar_id = 1 
		And business.bsn_sub_status IN ('Open','Hold') Order By business.bsn_status_sys_date DESC";

$paData = $fwDb->query($sql);


$message = "<html> <body>";
$message .= "<h3> Planning Assessment Report</h3><br><br>";
$message .= "<table border ='1' cellpadding='3' cellspacing='0' style='border-collapse:collapse'>";
$message .= "<tr><td>SrNo</td><td>Customer Name</td><td>Project Name</td><td>Link</td><td>Date Of Enquiry </td>
			<td>Date Count</td> <td>Project Status</td><td>Phone Follow Ups</td>
			
			<td>Needs Analysis Survey (Support)</td>
			<td>Customer details verified & qualified</td>
			<td>Planning assessment proposal created </td>
			<td>Booked in face to face meeting</td>
			<td>Box sent to customers</td>
			<td>Planning assessment report created</td> 
			<td>Meeting materials checked & printed</td>
			</tr>";

	$srno=1;
	foreach($paData as $k => $v)
	{
				$bsn_id =  $v['bsn_id'];
		
				$Statusdate = changedate_y_m_d($v['bsn_status_sys_date']);
				$curdate_y_m_d = date('Y-m-d');
				$days_at_status = daysDifference($curdate_y_m_d, $Statusdate);
	
	
				$sql2 = "Select document_check_list.* from document_check_list
			             where document_check_list.doc_bsn_id = ". $bsn_id . " And document_check_list.doc_name_id = 2";
			
			    $data1 = $fwDb->queryOne($sql2);
				if(!empty($data1['doc_file_name']))
				{
					   $uploaded ='Yes';
					   $class1='';
				}
				 else if ($v['bsn_sub_status'] == 'Open')
				{ 
					   $uploaded ='No'; 
					   $class1 = "style='background:#F00'";
				}
				else { 
						$uploaded ='No'; 
					    $class1 = "style='background:#FF0'";
				}
	
			    $sqla = "Select business_tasks.* from business_tasks
				         where business_tasks.bt_bsn_id = ". $bsn_id . " And business_tasks.bt_task_id = 406";
						 
				$yndata = $fwDb->queryOne($sqla);
				$yn = $yndata['bt_complete'];	
				
				if($yn == 1)
				{ 
			    		$pa_booked = "Yes";
						$class2='';
				}
				else if ($v['bsn_sub_status'] == 'Open')
				{
					    $pa_booked = "No"; 
						$class2 = "style='background:#F00'";
				}
				else 
				{
					    $pa_booked = "No"; 
						$class2 = "style='background:#FF0'";
				}
				
				$sql44 = "Select document_check_list.* from document_check_list
			             where document_check_list.doc_bsn_id = ". $bsn_id . " And document_check_list.doc_name_id = 44";
	
				$data44 = $fwDb->queryOne($sql44);
				
				if(!empty($data44['doc_file_name']))
				 {
					   $completed44 ='Yes'; 
					   $class3='';
				}
				 else if($v['bsn_sub_status'] == 'Open')
				{ 
						 $completed44 ='No'; 
						 $class3 = "style='background:#F00'";
				}
				 else 
				{ 
						 $completed44 ='No'; 
						 $class3 = "style='background:#FF0'";
				}
				
				$sqluid = "Select business_tasks.* from business_tasks
				         where business_tasks.bt_bsn_id = ". $bsn_id . " And business_tasks.bt_task_id = 402";
	
				$yndata402 = $fwDb->queryOne($sqluid);
				
				$yn402 = $yndata402['bt_complete'];
				if($yn402 == 1) 
				{
					 $uidcomplete = "Yes";  
					 $class4=''; 
				} 
				else if($v['bsn_sub_status'] == 'Open')
				{ 
					 $uidcomplete = "No"; 
					 $class4 = "style='background:#F00'";
				}
					else 
				{ 
					 $uidcomplete = "No"; 
					 $class4 = "style='background:#FF0'";
				}
				
				// Uid 480
				
				$sqluid480 = "Select business_tasks.* from business_tasks
				         where business_tasks.bt_bsn_id = ". $bsn_id . " And business_tasks.bt_task_id = 480";
	
				$yndata480 = $fwDb->queryOne($sqluid480);
				
								
				$yn480 = $yndata480['bt_complete'];
				if($yn480 == 1) 
				{
					 $uidcomplete480 = "Yes";  
					 $class5=''; 
				} 
				else if($v['bsn_sub_status'] == 'Open')
				{ 
					 $uidcomplete480 = "No"; 
					 $class5 = "style='background:#F00'";
				}
				else 
				{ 
					 $uidcomplete480 = "No"; 
					 $class5 = "style='background:#FF0'";
				}
				//
				
				
				// Uid 513
				
				$sqluid513 = "Select business_tasks.* from business_tasks
				             where business_tasks.bt_bsn_id = ". $bsn_id . " And business_tasks.bt_task_id = 513";
	
				$yndata513 = $fwDb->queryOne($sqluid513);
				
								
				$yn513 = $yndata513['bt_complete'];
				if($yn513 == 1) 
				{
					 $uidcomplete513 = "Yes";  
					 $class6=''; 
				} 
				else if($v['bsn_sub_status'] == 'Open')
				{ 
					 $uidcomplete513 = "No"; 
					 $class6 = "style='background:#F00'";
				}
				else 
				{ 
					 $uidcomplete513 = "No"; 
					 $class6 = "style='background:#FF0'";
				}
				//
				
				
				// Uid 414
				
				$sqluid414 = "Select business_tasks.* from business_tasks
				             where business_tasks.bt_bsn_id = ". $bsn_id . " And business_tasks.bt_task_id = 414";
	
				$yndata414 = $fwDb->queryOne($sqluid414);
				
								
				$yn414 = $yndata414['bt_complete'];
				if($yn414 == 1) 
				{
					 $uidcomplete414 = "Yes";  
					 $class7=''; 
				} 
				else if($v['bsn_sub_status'] == 'Open')
				{ 
					 $uidcomplete414 = "No"; 
					 $class7 = "style='background:#F00'";
				}
				else 
				{ 
					 $uidcomplete414 = "No"; 
					 $class7 = "style='background:#FF0'";
				}
				//
				
				
				// Uid 137
				
				$sqluid137 = "Select business_tasks.* from business_tasks
				             where business_tasks.bt_bsn_id = ". $bsn_id . " And business_tasks.bt_task_id = 137";
	
				$yndata137 = $fwDb->queryOne($sqluid137);
				
								
				$yn137 = $yndata137['bt_complete'];
				if($yn137 == 1) 
				{
					 $uidcomplete137 = "Yes";  
					 $class8=''; 
				} 
				else if($v['bsn_sub_status'] == 'Open')
				{ 
					 $uidcomplete137 = "No"; 
					 $class8 = "style='background:#F00'";
				}
				else 
				{ 
					 $uidcomplete137 = "No"; 
					 $class8 = "style='background:#FF0'";
				}
				//
				
				// Uid 302
				
				$sqluid302 = "Select business_tasks.* from business_tasks
				             where business_tasks.bt_bsn_id = ". $bsn_id . " And business_tasks.bt_task_id = 302";
	
				$yndata302 = $fwDb->queryOne($sqluid302);
												
				$yn302 = $yndata302['bt_complete'];
				if($yn302 == 1) 
				{
					 $uidcomplete302 = "Yes";  
					 $class9=''; 
				} 
				else if($v['bsn_sub_status'] == 'Open')
				{ 
					 $uidcomplete302 = "No"; 
					 $class9 = "style='background:#F00'";
				}
				else 
				{ 
					 $uidcomplete302 = "No"; 
					 $class9 = "style='background:#FF0'";
				}
				//
				
				// Uid 211
				
				$sqluid211 = "Select business_tasks.* from business_tasks
				             where business_tasks.bt_bsn_id = ". $bsn_id . " And business_tasks.bt_task_id = 211";
	
				$yndata211 = $fwDb->queryOne($sqluid211);
				
								
				$yn211 = $yndata211['bt_complete'];
				if($yn211 == 1) 
				{
					 $uidcomplete211 = "Yes";  
					 $class10=''; 
				} 
				else if($v['bsn_sub_status'] == 'Open')
				{ 
					 $uidcomplete211 = "No"; 
					 $class10 = "style='background:#F00'";
				}
				else 
				{ 
					 $uidcomplete211 = "No"; 
					 $class10 = "style='background:#FF0'";
				}
				//
				
				// Uid 309
				
				$sqluid309 = "Select business_tasks.* from business_tasks
				             where business_tasks.bt_bsn_id = ". $bsn_id . " And business_tasks.bt_task_id = 309";
	
				$yndata309 = $fwDb->queryOne($sqluid309);
				
								
				$yn309 = $yndata309['bt_complete'];
				if($yn309 == 1) 
				{
					 $uidcomplete309 = "Yes";  
					 $class11=''; 
				} 
				else if($v['bsn_sub_status'] == 'Open')
				{ 
					 $uidcomplete309 = "No"; 
					 $class11 = "style='background:#F00'";
				}
				else 
				{ 
					 $uidcomplete309 = "No"; 
					 $class11 = "style='background:#FF0'";
				}
				//
				
				
				$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$bsn_id;			
		        $sfu = "Select count(*) as tot from  sales_followup where sf_pid = ".$v['bsn_id'];
        		$sfData = $fwDb->queryOne($sfu);
							
				$message .= "<tr>";
				$message .= "<td>".$srno."</td>";
				$message .= "<td>".$v['bcust_fname'].' '.$v['bcust_lname']."</td>";
				$message .= "<td>".$v['bsn_name']."</td>";
				$message .= "<td> <a href =".$link.">Link</a></td>";
				$message .= "<td>".$v['bsn_status_sys_date']."</td>";
				$message .= "<td>".$days_at_status."</td>";
				$message .= "<td>".$v['bsn_sub_status']."</td>";
			    $message .= "<td>".$sfData['tot']."</td>";
				
				$message .= "<td $class1>".$uploaded."</td>";
				$message .= "<td $class5>".$uidcomplete480."</td>";
				//$message .= "<td $class2>".$pa_booked."</td>";
				//$message .= "<td $class3>".$completed44."</td>";
				$message .= "<td $class6>".$uidcomplete513."</td>";
				//$message .= "<td $class4>".$uidcomplete."</td>";
				//$message .= "<td $class7>".$uidcomplete414."</td>";
				$message .= "<td $class8>".$uidcomplete137."</td>";
				$message .= "<td $class9>".$uidcomplete302."</td>";
				$message .= "<td $class10>".$uidcomplete211."</td>";
				$message .= "<td $class11>".$uidcomplete309."</td>";
				
				$message .= "</tr>";
				$srno++;
   }



$message .= "</table></body></html>";

    	$sqle = "Select ar_receving_email from automated_reports where ar_id = 1";
		$emaildata = $fwDb->queryOne($sqle);
		
		$emails = explode(",", $emaildata['ar_receving_email']);
		
		if(!empty($emails)) {
			foreach($emails as $ve)
			{
				send_email('Frank Walmsley', trim($ve), 'CGFB', 'info@cgfb.com.au', 'Planning Assessment Report', $message, $attachment='');	
			}
		}
		

//send_email('Frank Walmsley', 'marketing@cgfb.com.au', 'CGFB', 'info@cgfb.com.au', 'Planning Assessment Report', $message, $attachment='');
//send_email('Frank Walmsley', 'info@cgfb.com.au', 'CGFB', 'info@cgfb.com.au', 'Planning Assessment Report', $message, $attachment='');
send_email('Manoj Soni', 'manojsoniephp@gmail.com', 'CGFB', 'info@cgfb.com.au', 'Planning Assessment Report', $message, $attachment='');

exit;
	