<?php

//$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
//        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status_sys_date,  business.bsn_address,  business.bsn_type 
//		from    business_sellers 		
//		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
//		Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
//		Inner Join bus_automated_reports ON  business_sellers.bs_business_id =  bus_automated_reports.bar_bsn_id
//		where bus_automated_reports.bar_report_yesno = 1 And bus_automated_reports.bar_ar_id = 1 
//		And business.bsn_sub_status IN ('Open','Hold') Order By business.bsn_status_sys_date DESC";
		
		
$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status_sys_date,  business.bsn_address,  business.bsn_type 
		from    business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
		WHERE bsn_status = '|1|' and bsn_sub_status IN ('Open','Hold') Order By business.bsn_status_sys_date DESC";		

$paData = $fwDb->query($sql);
 

$message = "<html> <body>";
$message .= "<h3> Post PAR Report</h3><br><br>";
$message .= "<table border ='1' cellpadding='3' cellspacing='0' style='border-collapse:collapse'>";
$message .= "<tr><td>SrNo</td><td>Project Address</td><td>Type</td><td>Project Status</td><td>Link</td><td>PAR Delivery</td><td>Signed Design AA</td>
			<td>Day Count</td> <td>3 Day Handwritten Card </td>
			<td>7 Day What's Next Letter </td>
			<td>14 Day Conversation</td>
			<td>21 Day Airbnb Report Letter</td>
			<td>30 Day Conversation</td>
			<td>45 Open Home Invite Letter</td>
			<td>60 Day Conversation </td> 
			</tr>";

	$srno=1;
	foreach($paData as $k => $v)
	{
				$bsn_id =  $v['bsn_id'];
				$days_at_status='';
				
				$sql_type = "select pt_name from project_type where pt_id = ".$v['bsn_type'];
				$type = $fwDb->queryOne($sql_type);
				
				
				// Uid 414
				
				$sqluid414 = "Select business_tasks.* from business_tasks
				             where business_tasks.bt_bsn_id = ". $bsn_id . " And business_tasks.bt_task_id = 414";
	
				$pardel414 = $fwDb->queryOne($sqluid414);

				$pardel = changedate_y_m_d($pardel414['bt_completed_date']);
				
				
				$Statusdate = changedate_y_m_d($pardel414['bt_completed_date']);
				
				if(!empty($pardel))
				{
					$curdate_y_m_d = date('Y-m-d');
					$days_at_status = daysDifference($curdate_y_m_d, $Statusdate);
				}
	
				//
				
				// Uid 45
				
								
				$sql45 = "Select document_check_list.* from document_check_list
			             where document_check_list.doc_bsn_id = ". $bsn_id . " And document_check_list.doc_name_id = 45";
	
				$data45 = $fwDb->queryOne($sql45);
				
				if(!empty($data45['doc_file_name']))
				 {
					   $completed45 ='Yes'.'<br>'.$data45['doc_date_uploaded']; 
					   $class1 = "style='background:#FF0'";
				}
				// else if($v['bsn_sub_status'] == 'Open')
//				{ 
//						 $completed45 ='No'; 
//						 $class1 = "style='background:#F00'";
//				}
				 else 
				{ 
						 $completed45 ='No'; 
						 $class1 = "style='background:#F00'";
				}
	
	
				//======================
	
				$sql2 = "Select document_check_list.* from document_check_list
			             where document_check_list.doc_bsn_id = ". $bsn_id . " And document_check_list.doc_name_id = 2";
			
			    $data1 = $fwDb->queryOne($sql2);
				if(!empty($data1['doc_file_name']))
				{
					   $uploaded ='Yes';
					   $class15='';
				}
				 else if ($v['bsn_sub_status'] == 'Open')
				{ 
					   $uploaded ='No'; 
					   $class15 = "style='background:#F00'";
				}
				else { 
						$uploaded ='No'; 
					    $class15 = "style='background:#FF0'";
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
				$message .= "<td>".$v['bsn_address']."</td>";
				$message .= "<td>".$type['pt_name']."</td>";
				$message .= "<td>".$v['bsn_sub_status']."</td>";
				$message .= "<td> <a href =".$link.">Link</a></td>";
				$message .= "<td>".$pardel."</td>";
				$message .= "<td $class1>".$completed45."</td>";
				$message .= "<td>".$days_at_status."</td>";
				
				
				
				$message .= "<td>".''."</td>";
			
				$message .= "<td>".''."</td>";
			    $message .= "<td>".''."</td>";
				
				$message .= "<td>".''."</td>";
				$message .= "<td>".''."</td>";
				$message .= "<td>".''."</td>";
				$message .= "<td>".''."</td>";
				//$message .= "<td $class6>".."</td>";
				//$message .= "<td $class10>".$uidcomplete211."</td>";
				//$message .= "<td $class11>".$uidcomplete309."</td>";
				
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
				send_email('Frank Walmsley', trim($ve), 'CGFB', 'info@cgfb.com.au', 'Post PAR Report', $message, $attachment='');	
			}
		}
		


exit;
	