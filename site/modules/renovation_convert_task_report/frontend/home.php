<?php
$pagenum = $fwRequest->getparam('pagenum','');
$tablebusiness = new Fw_Db_Table('business');
$searchaddr = $fwRequest->getParam('searchaddr', '');
$searchtype = $fwRequest->getParam('searchtype', '');
$searchchk = $fwRequest->getParam('searchchk', '');
$tabledpn = new Fw_Db_Table('document_renovation_name');

$table_toplink = new Fw_Db_Table('top_links');

$update_link = $fwRequest->getParam('update_link', '');
if(!empty($update_link)){
	$proc = $fwRequest->getParam('proc', '');
        $tlDetail['tl_link'] = $proc;

	$table_toplink->setWhere("tl_slug = 'renovation_convert_task_report'");
	$table_toplink->updateRow($tlDetail);

}


// Save Hide
$hide = $fwRequest->getParam('hide', '');
if(!empty($hide)) {
	$key = array_keys($hide);
	$ky = $key[0];
	$hideDetail['dpn_rdr_hide'] = $hide[$ky];
	$tabledpn->setWhere('dpn_unique_id = '.$ky);
	$hdetail = $tabledpn->updateRow($hideDetail);		
}
// End Hide


// Save Speak to client qualify
$speak = $fwRequest->getParam('speak', '');
if(!empty($speak)) {
	$key = array_keys($speak);
	$ky = $key[0];
	$speakDetail['dpn_rctr_speak'] = $speak[$ky];
	$speakDetail['dpn_rctr_speak_who'] = $_SESSION['user']['user_name'];
	$speakDetail['dpn_rctr_speak_date'] = date('d-m-Y');
	$tabledpn->setWhere('dpn_unique_id = '.$ky);
	$hdetail = $tabledpn->updateRow($speakDetail);		
}
// End speak

// Save intro box sent
$intro = $fwRequest->getParam('intro', '');
if(!empty($intro)) {
	$key = array_keys($intro);
	$ky = $key[0];
	$introDetail['dpn_rctr_intro_box'] = $intro[$ky];
	$introDetail['dpn_rctr_intro_who'] = $_SESSION['user']['user_name'];
	$introDetail['dpn_rctr_intro_date'] = date('d-m-Y');
	$tabledpn->setWhere('dpn_unique_id = '.$ky);
	$hdetail = $tabledpn->updateRow($introDetail);		
}
// End Intro


// Save book onsite
$book = $fwRequest->getParam('book', '');
if(!empty($book)) {
	$key = array_keys($book);
	$ky = $key[0];
	$bookDetail['dpn_rctr_bookonsite'] = $book[$ky];
	$bookDetail['dpn_rctr_bookonsite_who'] = $_SESSION['user']['user_name'];
	$bookDetail['dpn_rctr_bookonsite_date'] = date('d-m-Y');
	$tabledpn->setWhere('dpn_unique_id = '.$ky);
	$hdetail = $tabledpn->updateRow($bookDetail);		
}
// End book onsite


// Save onsite visit
$onsite = $fwRequest->getParam('onsite', '');
if(!empty($onsite)) {
	$key = array_keys($onsite);
	$ky = $key[0];
	$onsiteDetail['dpn_rctr_onsite'] = $onsite[$ky];
	$onsiteDetail['dpn_rctr_onsite_who'] = $_SESSION['user']['user_name'];
	$onsiteDetail['dpn_rctr_onsite_date'] = date('d-m-Y');
	$tabledpn->setWhere('dpn_unique_id = '.$ky);
	$detail = $tabledpn->updateRow($onsiteDetail);		
}
// End onsite visit


// Save follow up
$followup = $fwRequest->getParam('followup', '');
if(!empty($followup)) {
	$key = array_keys($followup);
	$ky = $key[0];
	$followDetail['dpn_rctr_followup'] = $followup[$ky];
	$followDetail['dpn_rctr_followup_who'] = $_SESSION['user']['user_name'];
	$followDetail['dpn_rctr_followup_date'] = date('d-m-Y');
	$tabledpn->setWhere('dpn_unique_id = '.$ky);
	$detail = $tabledpn->updateRow($followDetail);		
}
// End follow up


// Save follow phone call 22 Day
$follow22 = $fwRequest->getParam('follow22', '');
if(!empty($follow22)) {
	$key = array_keys($follow22);
	$ky = $key[0];
	$follow22Detail['dpn_rctr_follow22'] = $follow22[$ky];
	$follow22Detail['dpn_rctr_follow22_who'] = $_SESSION['user']['user_name'];
	$follow22Detail['dpn_rctr_follow22_date'] = date('d-m-Y');
	$tabledpn->setWhere('dpn_unique_id = '.$ky);
	$detail = $tabledpn->updateRow($follow22Detail);		
}
// End follow phone call 22 Day


// Phone Client about 3D Scan
$pc3dscan = $fwRequest->getParam('pc3dscan', '');
if(!empty($pc3dscan)) {
	$key = array_keys($pc3dscan);
	$ky = $key[0];
	$pcDetail['dpn_rctr_pc_3dscan'] = $pc3dscan[$ky];
	$tabledpn->setWhere('dpn_unique_id = '.$ky);
	$detail = $tabledpn->updateRow($pcDetail);		
}
// End Phone Client about 3D Scan



$fwViewData['ran'] =  rand(100000,999999);

$where = " WHERE document_renovation_name.dpn_rdr_hide = 0 ";
$unhide = $fwRequest->getParam('unhide', '');
if($unhide)
{
$where = " WHERE 1 = 1 ";		
}


if(!empty($searchaddr)) {
	$searchkey = $fwRequest->getParam('searchkey', '');
}

   
$flag='';  
if($searchkey):

	$flag = 'true';
	
	$where .= " AND business.bsn_address LIKE '%".$searchkey."%'";
		
		$_SESSION['searchkey'] = $searchkey;
		$fwViewData['searchkey']=$_SESSION['searchkey'];
	
elseif($_SESSION['searchkey'] && $pagenum > 0):
	
		$where .= " AND business.bsn_address LIKE '%".$_SESSION['searchkey']."%'" ;
		$fwViewData['searchkey']=$_SESSION['searchkey'];
endif;   

if(!empty($searchtype)) {
	$project_type = $fwRequest->getParam('project_type', '');
}

if($project_type):

	$flag = 'true';
	$fwViewData['pt']= $project_type;
	$where .= " AND document_renovation_name.dpn_rctr_ptype LIKE '%".$project_type."%'";
		
		$_SESSION['project_type'] = $project_type;
		$fwViewData['project_type']=$_SESSION['project_type'];
	
elseif($_SESSION['project_type'] && $pagenum > 0):
	
		$where .= " AND document_renovation_name.dpn_rctr_ptype LIKE '%".$_SESSION['project_type']."%'" ;
		$fwViewData['project_type']=$_SESSION['project_type'];
endif;




	   
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
		
 
   if($clear)
   {
	unset($_SESSION['searchkey']);
	$_SESSION['searchkey']='';
	$searchkey='';
	$fwViewData['searchkey']='';
	$_SESSION['project_type'] ='';
	$fwViewData['project_type']='';
	$where = "WHERE 1=1 ";
  }

 
     $sql = "Select business.bsn_id, business.bsn_address, business.bsn_status_sys_date , document_renovation_name.* , 
             document_check_list_renovation_count.dcnt_counter 
	     from business 
	     Inner Join document_check_list_renovation_count ON business.bsn_id  = document_check_list_renovation_count.dcnt_bsn_id
	     Right Join document_renovation_name on business.bsn_id  = document_renovation_name.dpn_bsn_id 
		". $where . " Group by document_renovation_name.dpn_unique_id " .$ord;


if($sql){$userData = $fwDb->query($sql);}

$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 1000;
    $last = ceil($rows/$page_rows); 

    if ($pagenum <= 1)
    {
        $pagenum = 1;
    }
    elseif ($pagenum > $last)
    {
        $pagenum = $last;
    }
	$numstartvounter =  $page_rows * ($pagenum-1) + 1;
	$fwViewData['numstartvounter'] = $numstartvounter;
		
    $fwViewData['last'] = $last;
    $fwViewData['lastone'] = $last-1;
	$fwViewData['lasttow'] = $last-2;
    $fwViewData['pagenum'] = $pagenum;
	$pagenatedatanext = $pagenum;
	$pagenatedataprev = $pagenum;
	for($i=0; $i<9; $i++)
		{
		$paginate[$pagenatedatanext] = $pagenatedatanext;
		$pagenatedatanext ++;
		}
		$fwViewData['paginatenext'] = $paginate;
	$pagenatedataprev = $pagenum;	
	for($i=0; $i<9; $i++)
		{
		$paginateprev[$pagenatedataprev] = $pagenatedataprev;
		$pagenatedataprev --;
		}
	$fwViewData['paginateprev'] = array_reverse($paginateprev);
	
    $max = 'limit ' .($pagenum - 1) * $page_rows .',' .$page_rows;
    
    $sql2 =  $sql." ".$max;

if($sql2)
{  
$setdata = $fwDb->query($sql2);
 
foreach($setdata as $k => $v)
{
		
		$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$v['bsn_id'];	
		
		$sq12= "SELECT   bus_customers.bcust_fname, bus_customers.bcust_lname from business_sellers 		
	                Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	                Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
			where business_sellers.bs_business_id = ".$v['bsn_id'];  
	
		 $custdata = $fwDb->queryOne($sq12);
		
		
		 $sqlTask1 = "SELECT renovation_tasks.bt_completed_date FROM renovation_tasks WHERE bt_bsn_id = " .$v['bsn_id'] . "
			      AND bt_task_id = 1 and bt_task_list_number = ".$v['dpn_proposal_number'];
		 $data1 = $fwDb->queryOne($sqlTask1);
		
		$dayscount='';
		if(!empty($data1['bt_completed_date'])) {
		 $Statusdate = changedate_y_m_d($data1['bt_completed_date']);
		 		
				if(!empty($Statusdate))
				{
					$curdate_y_m_d = date('Y-m-d');
					$dayscount = daysDifference($curdate_y_m_d , $Statusdate);
				}
		}
		
		
		$sql34 = "select document_check_list_renovation.doc_file_name from document_check_list_renovation 
		          inner join document_renovation_name On 
			  document_check_list_renovation.doc_bsn_id  = 	document_renovation_name.dpn_bsn_id 	
	         where document_check_list_renovation.doc_name_id = 34 and 
		 document_check_list_renovation.doc_checklist_number  = ".$v['dpn_proposal_number'] . " And 
		 document_check_list_renovation.doc_bsn_id = ".$v['bsn_id'];
		 
		 $docdata34 = $fwDb->queryOne($sql34);
		

		 $sql_9 = "select document_check_list_renovation.doc_file_name from document_check_list_renovation 
		          inner join document_renovation_name On 
			  document_check_list_renovation.doc_bsn_id  = 	document_renovation_name.dpn_bsn_id 	
	         where document_check_list_renovation.doc_name_id = 9 and 
		 document_check_list_renovation.doc_checklist_number  = ".$v['dpn_proposal_number'] . " And 
		 document_check_list_renovation.doc_bsn_id = ".$v['bsn_id'];
		 
		 $data_9 = $fwDb->queryOne($sql_9);


		$sql_2 = "select document_check_list_renovation.doc_file_name from document_check_list_renovation 
		          inner join document_renovation_name On 
			  document_check_list_renovation.doc_bsn_id  = 	document_renovation_name.dpn_bsn_id 	
	         where document_check_list_renovation.doc_name_id = 2 and 
		 document_check_list_renovation.doc_checklist_number  = ".$v['dpn_proposal_number'] . " And 
		 document_check_list_renovation.doc_bsn_id = ".$v['bsn_id'];
		 
		 $data_2 = $fwDb->queryOne($sql_2);
		
		 $sqlTask6 = "SELECT renovation_tasks.bt_completed_date FROM renovation_tasks WHERE bt_bsn_id = " .$v['bsn_id'] . "
			      AND bt_task_id = 6 and bt_task_list_number = ".$v['dpn_proposal_number'];
		 $data6 = $fwDb->queryOne($sqlTask6); 
		
		
		 $sqlTask34 = "SELECT renovation_tasks.bt_completed_date FROM renovation_tasks WHERE bt_bsn_id = " .$v['bsn_id'] . "
			      AND bt_task_id = 34 and bt_task_list_number = ".$v['dpn_proposal_number'];
		 $data34 = $fwDb->queryOne($sqlTask34);
		
		 $sql21 = "select document_check_list_renovation.doc_file_name from document_check_list_renovation 
		          inner join document_renovation_name On 
			  document_check_list_renovation.doc_bsn_id  = 	document_renovation_name.dpn_bsn_id 	
	         where document_check_list_renovation.doc_name_id = 21 and 
		 document_check_list_renovation.doc_checklist_number  = ".$v['dpn_proposal_number'] . " And 
		 document_check_list_renovation.doc_bsn_id = ".$v['bsn_id'];
		
		 $data21 = $fwDb->queryOne($sql21);
		
		 $sqlTask12 = "SELECT renovation_tasks.bt_completed_date FROM renovation_tasks WHERE bt_bsn_id = " .$v['bsn_id'] . "
			      AND bt_task_id = 12 and bt_task_list_number = ".$v['dpn_proposal_number'];
		 $data12 = $fwDb->queryOne($sqlTask12);
		
		 $sqlTask18 = "SELECT renovation_tasks.bt_completed_date FROM renovation_tasks WHERE bt_bsn_id = " .$v['bsn_id'] . "
			      AND bt_task_id = 18 and bt_task_list_number = ".$v['dpn_proposal_number'];
		 $taskdata18 = $fwDb->queryOne($sqlTask18);
		
		
		 $sqlTask19 = "SELECT renovation_tasks.bt_completed_date FROM renovation_tasks WHERE bt_bsn_id = " .$v['bsn_id'] . "
			      AND bt_task_id = 19 and bt_task_list_number = ".$v['dpn_proposal_number'];
		 $data19 = $fwDb->queryOne($sqlTask19);
		

		
		
	 	$sql_ini = "select document_check_list_renovation.doc_file_name from document_check_list_renovation 
		          inner join document_renovation_name On 
			  document_check_list_renovation.doc_bsn_id  = 	document_renovation_name.dpn_bsn_id 	
	         	  where document_check_list_renovation.doc_name_id = 2 and 
			  document_check_list_renovation.doc_checklist_number  = ".$v['dpn_proposal_number'] . " And 
		 	  document_check_list_renovation.doc_bsn_id = ".$v['bsn_id'];
		
		 $data_ini = $fwDb->queryOne($sql_ini);		
		
		
		//
		
				$setdata2[$k]['bsn_id'] = $v['bsn_id'];
				$setdata2[$k]['dpn_unique_id'] = $v['dpn_unique_id'];
				$setdata2[$k]['bsn_address'] = $v['bsn_address'];
				$setdata2[$k]['link'] = $link;
				$setdata2[$k]['bcust_fname'] = $custdata['bcust_fname'];
				$setdata2[$k]['bcust_lname'] = $custdata['bcust_lname'];
				$setdata2[$k]['dayscount'] = $dayscount;
				$setdata2[$k]['dpn_rctr_speak'] = $v['dpn_rctr_speak'];
				$setdata2[$k]['dpn_rctr_speak_who'] = $v['dpn_rctr_speak_who'];
				$setdata2[$k]['dpn_rctr_speak_date'] = $v['dpn_rctr_speak_date'];
				$setdata2[$k]['dpn_rctr_ptype'] = $v['dpn_rctr_ptype'];
				
				$setdata2[$k]['doc_34'] = $docdata34['doc_file_name'];
				$setdata2[$k]['dpn_rctr_valueof_proj'] = $v['dpn_rctr_valueof_proj'];
				$setdata2[$k]['dpn_rctr_intro_box'] = $v['dpn_rctr_intro_box'];
				$setdata2[$k]['dpn_rctr_intro_who'] = $v['dpn_rctr_intro_who'];
				$setdata2[$k]['dpn_rctr_intro_date'] = $v['dpn_rctr_intro_date'];
				$setdata2[$k]['dpn_rctr_bookonsite'] = $v['dpn_rctr_bookonsite'];
				$setdata2[$k]['dpn_rctr_bookonsite_who'] = $v['dpn_rctr_bookonsite_who'];
				$setdata2[$k]['dpn_rctr_bookonsite_date'] = $v['dpn_rctr_bookonsite_date'];	
				$setdata2[$k]['dpn_rctr_onsite'] = $v['dpn_rctr_onsite'];
				$setdata2[$k]['dpn_rctr_onsite_who'] = $v['dpn_rctr_onsite_who'];
				$setdata2[$k]['dpn_rctr_onsite_date'] = $v['dpn_rctr_onsite_date'];
				$setdata2[$k]['date1'] = changedate_d_m_y($data1['bt_completed_date']);
				$setdata2[$k]['date6'] = changedate_d_m_y($data6['bt_completed_date']);
			
			
			        $setdata2[$k]['doc_9'] = $data_9['doc_file_name'];
				$setdata2[$k]['doc_2'] = $data_2['doc_file_name'];
				$setdata2[$k]['date34'] = changedate_d_m_y($data34['bt_completed_date']);
				$setdata2[$k]['doc_21'] = $data21['doc_file_name'];
				$setdata2[$k]['date12'] = changedate_d_m_y($data12['bt_completed_date']);
				$setdata2[$k]['date18'] = changedate_d_m_y($taskdata18['bt_completed_date']);
				
				$setdata2[$k]['dpn_rctr_followup'] = $v['dpn_rctr_followup'];
				$setdata2[$k]['dpn_rctr_followup_who'] = $v['dpn_rctr_followup_who'];
				$setdata2[$k]['dpn_rctr_followup_date'] = $v['dpn_rctr_followup_date'];	
				$setdata2[$k]['date19'] = changedate_d_m_y($data19['bt_completed_date']);
			        
				$setdata2[$k]['dpn_rctr_follow22'] = $v['dpn_rctr_follow22'];
				$setdata2[$k]['dpn_rctr_follow22_who'] = $v['dpn_rctr_follow22_who'];
				$setdata2[$k]['dpn_rctr_follow22_date'] = $v['dpn_rctr_follow22_date'];
				$setdata2[$k]['dpn_rctr_likelihood'] = $v['dpn_rctr_likelihood'];
				$setdata2[$k]['dpn_rctr_pc_3dscan'] = $v['dpn_rctr_pc_3dscan'];
				
			
					
				$setdata2[$k]['dpn_rdr_hide'] = $v['dpn_rdr_hide'];
				$setdata2[$k]['dpn_rctr_budget'] = $v['dpn_rctr_budget'];
}			       $setdata2[$k]['data_ini'] = $data_ini['doc_file_name'];



			
		
			if(!empty($setdata2)) {
	 	       		 foreach ($setdata2 as $key => $row) 
		        	{
					
					$desig[$key]  = $row['dayscount'];
				}
				
					
					array_multisort($desig, SORT_ASC, $setdata2);
				
		   }
		
		
		
 		$fwViewData['list'] =  $setdata2;		
  }
}

$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Renovation Convert Task Report";


 		
$sqlpr = "Select * from renovation_project_types";
$fwViewData['prdetail'] = $fwDb->query($sqlpr); 

$table_toplink->setWhere("tl_slug = 'renovation_convert_task_report'");
$fwViewData['proc_detail'] = $table_toplink->getRow();