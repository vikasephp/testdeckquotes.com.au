<?php

$sqlH = "Select distinct bst_task_id, bst_ptt_summary from busness_status_task
	where bst_business_status_id = 2 order by bst_order";
$colhead = $fwDb->query($sqlH);
$tottask = count($colhead);
$fwViewData['colhead'] = $colhead;

$where = "WHERE 1=1 ";

$message = "<html> <body>";
$message .= "Hello Planning Manager, <br><br>";
$message .= "<h3>Here is Daily Missing Planning Documents Report</h3><br><br>";
$message .= "<table border ='1' cellpadding='3' cellspacing='0' style='border-collapse:collapse'>";
$message .= "<tr><td>Project</td><td>Checklist</td>
            <td>Type</td><td>Hia Days </td><td>Opertional Plans</td>
			<td>DA Docs</td> <td>BA Docs</td>
			<td>DA 7 Day Change</td>
			<td>DA Lodged 369</td>
			<td>Completeness Check Passed (UID 340)</td>
			<td>Notice of decision(374)</td>
			</tr>";
	
$sql = "SELECT  business_sellers.bs_business_id, business.bsn_id, business.bsn_name, business.bsn_ptt_d_type, business.bsn_ptt_opi
			from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id  
		Right JOIN person_responsible_detail ON  business_sellers.bs_business_id = person_responsible_detail.prd_bsn_id And 
		person_responsible_detail.prd_prm_id = 8 "
		. $where. " And  business.bsn_status like '%|2|%' 
		 Group By business.bsn_id 
		Order By business_sellers.bs_ptt_sub_status_order ASC";


if($sql){$setdata2 = $fwDb->query($sql);}


foreach($setdata2 as $k => $v)
{
		$sqla = "Select document_check_list.doc_file_name, document_check_list.doc_date_uploaded from document_check_list
			      where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 64";
		$data = $fwDb->queryOne($sqla);
		
		$sql_chk = "select dpn_unique_id from document_proposal_name where dpn_bsn_id = ".$v['bs_business_id']. " and dpn_archived = 0";
        $chk = $fwDb->query($sql_chk);
		
		$chklst = '';
		foreach($chk as $kc=>$vc)
		{
		
		    $chklist .= $vc['dpn_unique_id'] . ",";
		}
	
		$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$v['bsn_id'];
		
			if(!empty($data['doc_file_name']))
				 {
					$ccdate = $data['doc_date_uploaded'];
					$Statusdate = changedate_y_m_d($ccdate);
					$curdate_y_m_d = date('Y-m-d');
					$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
				   
				} else { $ccdate = ''; 
				         $dayscount='';
					   }
		
				 // For DA Docs
		 
		 $sqlDA = "select project_planning_checklist.pc_bsn_id from project_planning_checklist
		           left join planning_project_checklist_admin on  project_planning_checklist.pc_doc_id = planning_project_checklist_admin.ppc_id
				   where planning_project_checklist_admin.ppc_required = 'DA' AND project_planning_checklist.pc_required = 1
				    and  project_planning_checklist.pc_bsn_id = " .$v['bs_business_id'];
		 $datot = $fwDb->query($sqlDA);
		 $totalDA = sizeof($datot);
		 
		 $setdata2[$k]['totalDA'] = $totalDA;
		 
		 $sqlDAll = "select project_planning_checklist.pc_bsn_id from project_planning_checklist
		           left join planning_project_checklist_admin on  project_planning_checklist.pc_doc_id = planning_project_checklist_admin.ppc_id
				   where planning_project_checklist_admin.ppc_required = 'DA' AND 
				   project_planning_checklist.pc_required = 1
				   and length(TRIM(project_planning_checklist.pc_live_link)) > 0
				   and  project_planning_checklist.pc_bsn_id = " .$v['bs_business_id'];
		 $datotll = $fwDb->query($sqlDAll);
			 
		 $totalDAll = sizeof($datotll);
		 
		 $sql99 = "select doc_file_name, doc_bsn_id , ppc_id from document_check_list 
					  inner join planning_project_checklist_admin on document_check_list.doc_name_id = planning_project_checklist_admin.ppc_dc_uid 
					  where document_check_list.doc_bsn_id = ".$v['bs_business_id']." and length(TRIM(document_check_list.doc_file_name)) > 0
					  and planning_project_checklist_admin.ppc_required = 'DA' "; 
					  
			 $dataotherDA = $fwDb->query($sql99);
			 
			 
			 $x=0;
			 foreach($dataotherDA as $k1=>$v1)
			 {
			    $sqlX = " select pc_bsn_id, pc_live_link from project_planning_checklist 
				          where pc_doc_id = ".$v1['ppc_id']. " and pc_bsn_id = ".$v1['doc_bsn_id'] ;
			
				$dataX = $fwDb->queryOne($sqlX);
			
				if(empty($dataX['pc_live_link'])) {
					$x++;
				}
			 }
		 $totalDAll = $totalDAll + $x;
		 $setdata2[$k]['totalDA'] = $totalDA;
		 $setdata2[$k]['totalDAll'] = $totalDAll ;
		 //DA Docs Ends
		  unset($x);
		 
		  // For BA Docs
		 
		 $sqlBA = "select project_planning_checklist.pc_bsn_id from project_planning_checklist
		           left join planning_project_checklist_admin on  project_planning_checklist.pc_doc_id = planning_project_checklist_admin.ppc_id
				   where planning_project_checklist_admin.ppc_required = 'BA' AND project_planning_checklist.pc_required = 1
				    and  project_planning_checklist.pc_bsn_id = " .$v['bs_business_id'];
					
		 $batot = $fwDb->query($sqlBA);
		 $totalBA = sizeof($batot);
		 
		 $setdata2[$k]['totalBA'] = $totalBA;
		 
		 $sqlBAll = "select project_planning_checklist.pc_bsn_id from project_planning_checklist
		           left join planning_project_checklist_admin on  project_planning_checklist.pc_doc_id = planning_project_checklist_admin.ppc_id
				   where planning_project_checklist_admin.ppc_required = 'BA' AND 
				   project_planning_checklist.pc_required = 1
				   and length(TRIM(project_planning_checklist.pc_live_link)) > 0
				   and  project_planning_checklist.pc_bsn_id = " .$v['bs_business_id'];
				   
		 $batotll = $fwDb->query($sqlBAll);
		 $totalBAll = sizeof($batotll);
		 
		 $sql101 = "select doc_file_name, doc_bsn_id , ppc_id from document_check_list 
		          inner join planning_project_checklist_admin on document_check_list.doc_name_id = planning_project_checklist_admin.ppc_dc_uid 
				  where document_check_list.doc_bsn_id = ".$v['bs_business_id']." and length(TRIM(document_check_list.doc_file_name)) > 0
				  and planning_project_checklist_admin.ppc_required = 'BA'"; 
		 $dataotherBA = $fwDb->query($sql101);
		 $t2 = sizeof($dataotherBA);
		 
		 
		  $y=0;
		  
			 foreach($dataotherBA as $k1=>$v1)
			 {
			    $sqlY = " select pc_bsn_id, pc_live_link from project_planning_checklist 
				          where pc_doc_id = ".$v1['ppc_id']. " and pc_bsn_id = ".$v1['doc_bsn_id'] ;
			
				$dataY = $fwDb->queryOne($sqlY);
			
				if(empty($dataY['pc_live_link'])) {
					$y++;
				}
			 }
		 
		 $totalBAll = $totalBAll + $y;
		 $setdata2[$k]['totalBA'] = $totalBA;
		 $setdata2[$k]['totalBAll'] = $totalBAll ;
		 unset($y);
		 //BA Docs Ends
		
		
		$sqlDA7 = "select project_planning_checklist.pc_bsn_id from project_planning_checklist
		           left join planning_project_checklist_admin on  project_planning_checklist.pc_doc_id = planning_project_checklist_admin.ppc_id
				   where planning_project_checklist_admin.ppc_required = 'DA' AND 
				   project_planning_checklist.pc_required = 1
				   and length(TRIM(project_planning_checklist.pc_live_link)) > 0
				   and  project_planning_checklist.pc_bsn_id = " .$v['bs_business_id'] ."
				   and STR_TO_DATE(pc_live_link_date , '%d-%m-%Y' ) > CURDATE( ) - INTERVAL 7 DAY ";
		
		$dataDA7 = $fwDb->query($sqlDA7);
		$total7 = sizeof($dataDA7);
		
		$oi = '';
		if($v['bsn_ptt_opi'] == 1) { $op = 'Yes'; } else { $op = 'No'; }
		
		$sql369 = "select bt_completed_date from business_tasks 
		           where bt_bsn_id = ".$v['bs_business_id'] ." and bt_task_id = 369";
				   
		$data369 = $fwDb->queryOne($sql369);	
		
		$sql340 = "select bt_completed_date from business_tasks 
		           where bt_bsn_id = ".$v['bs_business_id'] ." and bt_task_id = 340";
				   
		$data340 = $fwDb->queryOne($sql340);
		
		$sql374 = "select bt_completed_date from business_tasks 
		           where bt_bsn_id = ".$v['bs_business_id'] ." and bt_task_id = 374";
				   
		$data374 = $fwDb->queryOne($sql374);
			   
		
		$message .= "<tr>";
	    $message .= "<td>".$v['bsn_name']."</td>";
		$message .= "<td>".$chklist."</td>";
		$message .= "<td>".$v['bsn_ptt_d_type']."</td>";
		$message .= "<td>".$dayscount."</td>";
		$message .= "<td>".$op."</td>";
		
		$message .= "<td>".$totalDAll."/".$totalDA."</td>";
		$message .= "<td>".$totalBAll."/".$totalBA."</td>";
		$message .= "<td style='text-align:center'>".$total7."</td>";
		$message .= "<td>".changedate_d_m_Y($data369['bt_completed_date'])."</td>";
		$message .= "<td>".changedate_d_m_Y($data340['bt_completed_date'])."</td>";
		$message .= "<td>".changedate_d_m_Y($data374['bt_completed_date'])."</td>";
		$message .= "</tr>";
		unset($chklist);
		 		
}
        $message .= '</table><br>';
        $message .= "<br>Regards,<br>CGFB Operation Team";
		
					
		$to1 = 'planning@cgfb.com.au' ;
		$toname1 = 'Planning Manager';
		
		$to2 = 'clientservices@cgfb.com.au' ;
		$toname2 = 'Fransis Walmsley';
		
		$from = "alert@cgfb.com.au";
		$from_name = "CGFB Operation Team";
		
		$subject = "Daily Missing Planning Document Report";
		
		     $to3 = "manojsoniephp@gmail.com";
	
			send_email($toname1, $to1, 'CGFB Operation Team', 'planning@cgfb.com.au', $subject, $message, $attachmentsend='');
   			send_email($toname2, $to2, 'CGFB Operation Team', 'planning@cgfb.com.au', $subject, $message, $attachmentsend='');
			send_email($toname2, $to3, 'CGFB Operation Team', 'planning@cgfb.com.au', $subject, $message, $attachmentsend='');
		
		

	