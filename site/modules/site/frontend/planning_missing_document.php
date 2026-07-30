<?php

$sql = "SELECT  business_sellers.bs_business_id, business.bsn_id, business.bsn_name,  business.bsn_sub_status,
		business.bsn_address , business.bsn_ptt_override
		from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id  
		Right JOIN person_responsible_detail ON  business_sellers.bs_business_id = person_responsible_detail.prd_bsn_id And 
		person_responsible_detail.prd_prm_id = 8 where business.bsn_status like '%|2|%' and business.bsn_ptt_opi = 1 
		Group By business.bsn_id 
		Order By business_sellers.bs_ptt_sub_status_order ASC";
				
$busData = $fwDb->query($sql);

	
$message = '<html><body>';

foreach($busData as $k=>$v)

{	
     
        $sql_chk = "select dpn_unique_id from document_proposal_name where dpn_bsn_id = ".$v['bs_business_id']. " and dpn_archived = 0";
        $chk = $fwDb->query($sql_chk);
		$checklist ='';
		
		foreach($chk as $ck=>$cv) 
		{
			$checklist = $cv['dpn_unique_id'] .",";
		}
	
		$sqla = "Select document_check_list.doc_file_name, document_check_list.doc_date_uploaded from document_check_list
			      where document_check_list.doc_bsn_id = ". $v['bs_business_id'] . " And document_check_list.doc_name_id = 64";
		$data = $fwDb->queryOne($sqla);
		
	   	if(!empty($data['doc_file_name']))
				 {
					$ccdate = $data['doc_date_uploaded'];
					$Statusdate = changedate_y_m_d($ccdate);
					$curdate_y_m_d = date('Y-m-d');
					$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
				   
				} else { $ccdate = ''; 
				         $dayscount='';
					   }
	
	   
	    $sql_DA =  "SELECT project_planning_checklist.* from project_planning_checklist 
		            INNER JOIN planning_project_checklist_admin ON project_planning_checklist.pc_doc_id = planning_project_checklist_admin.ppc_id
					where pc_bsn_id = ".$v['bs_business_id']. " and 
					planning_project_checklist_admin.ppc_required = 'DA' 
					order by pc_id";			
							
		$data_DA = $fwDb -> query($sql_DA);
	
		$docs_DA ='';
		
		foreach($data_DA as $k1=>$v1)
		{
			
			$sql_3 = "select  ppc_dc_uid from planning_project_checklist_admin where ppc_id = ".$v1['pc_doc_id'];
	    	$data_3 = $fwDb->queryOne($sql_3);
			
						
			$sql_4 = "Select document_check_list.doc_file_name, document_check_list.doc_date_uploaded, users.user_name
			           from document_check_list
			           inner join users on document_check_list.doc_user_name  = users.user_id
			           where document_check_list.doc_bsn_id = ". $v['bs_business_id'] . " And document_check_list.doc_name_id = ".$data_3['ppc_dc_uid'];
	    	$data_4 = $fwDb->queryOne($sql_4);
			
			if(empty($v1['pc_live_link']) && empty($data_4['doc_file_name'])) 
			
			{
				
				$docs_DA  .= "<p>".$v1['pc_document']."</p>";
			}
		}
		
		
		$sql_BA =  "SELECT project_planning_checklist.* from project_planning_checklist 
		            INNER JOIN planning_project_checklist_admin ON project_planning_checklist.pc_doc_id = planning_project_checklist_admin.ppc_id
					where pc_bsn_id = ".$v['bs_business_id']. " and 
					planning_project_checklist_admin.ppc_required = 'BA' 
					order by pc_id";			
							
		$data_BA = $fwDb -> query($sql_BA);
	
		$docs_BA ='';
		
		foreach($data_BA as $k1=>$v1)
		{
			
			$sql_3 = "select  ppc_dc_uid from planning_project_checklist_admin where ppc_id = ".$v1['pc_doc_id'];
	    	$data_3 = $fwDb->queryOne($sql_3);
			
						
			$sql_4 = "Select document_check_list.doc_file_name, document_check_list.doc_date_uploaded, users.user_name
			           from document_check_list
			           inner join users on document_check_list.doc_user_name  = users.user_id
			           where document_check_list.doc_bsn_id = ". $v['bs_business_id'] . " And document_check_list.doc_name_id = ".$data_3['ppc_dc_uid'];
	    	$data_4 = $fwDb->queryOne($sql_4);
			
			if(empty($v1['pc_live_link']) && empty($data_4['doc_file_name'])) 
			
			{
				
				$docs_BA  .= "<p>".$v1['pc_document']."</p>";
			}
		}
		
	
		$message .= "<p>Project Name :".$v['bsn_name']."<p>";
		$message .= "<p>Checklist :".$checklist."<p>";
		$message .= "<p>HIA Signed Days :".$dayscount."<p>";
	  
	    $message .= '<table border="1" cellpadding="5">';
		$message .= "<tr><th>DA Missing Document</th>";
		$message .= "<th>BA Missing Document</th></tr>";
		
		$message .= "<td>". $docs_DA. "</td>"; 
		$message .= "<td>". $docs_BA. "</td>"; 
		
		$message .= '</table>';
	
}

$message .= '</body></html><br>';
$message .= "<br>Regards,<br>CGFB Operation Team";
		
					
		$to1 = 'planning@cgfb.com.au' ;
		$toname1 = 'Planning Manager';
		
		$to2 = ' designsmanager@cgfb.com.au' ;
		$toname2 = 'Designs Manager';
		
		$to3 = '  supportplanning@cgfb.com.au' ;
		$toname3 = 'Support Planning';
		
		$from = "planning@cgfb.com.au";
		$from_name = "CGFB Operation Team";
		
		$subject = "Daily Missing Planning DA and BA Documents";
		
		$to = 'manojs@ephpsolutions.com';
		    
	
			send_email($toname1, $to1, 'CGFB Operation Team', 'planning@cgfb.com.au', $subject, $message, $attachmentsend='');
   			send_email($toname2, $to2, 'CGFB Operation Team', 'planning@cgfb.com.au', $subject, $message, $attachmentsend='');
			send_email($toname3, $to3, 'CGFB Operation Team', 'planning@cgfb.com.au', $subject, $message, $attachmentsend='');
			
			 send_email($toname2, $to, 'CGFB Operation Team', 'planning@cgfb.com.au', $subject, $message, $attachmentsend='');