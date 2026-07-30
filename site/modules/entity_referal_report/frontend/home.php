<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$tablebusiness = new Fw_Db_Table('business');
$tablebs = new Fw_Db_Table('business_sellers');
$table_dpn = new Fw_Db_Table('document_proposal_name');
$tableb_bc = new Fw_Db_Table('bus_customers');
$tablela = new Fw_Db_Table('entity_report_last_audit');

//	echo "you there".MODULES_DIR; exit('<br>checking');
require_once(MODULES_DIR . 'mergePDFv2/vendor/autoload.php');
require_once(MODULES_DIR . 'PDFMerger-master/PDFMerger.php');

//use PDFMerger\PDFMerger;

$projectname = $fwRequest->getParam('projectname', '');
if(!empty($projectname)) {
	$_SESSION['projectname'] = $projectname;	
}

$ord =  " ORDER BY if( dpn_appl_submitted = ' '
        OR dpn_appl_submitted IS  NULL , 0, 1 ) , STR_TO_DATE( dpn_appl_submitted, '%d-%m-%Y' ) DESC ";

$sqltype = "select * from design_report_type ";
$fwViewData['typeData'] = $fwDb->query($sqltype);
$sort_project = $fwRequest->getParam('sort_project', '');


$audit_whole = $fwRequest->getParam('audit_whole', '');

if(!empty($audit_whole))
{
	$keyla = array_keys($audit_whole);
	$kyla = $keyla[0];
	$lahDetail['la_last_audit'] = $audit_whole[$kyla];
	$lahDetail['la_last_audit_date'] = date('d-m-Y');
	$lahDetail['la_last_audit_user'] = $_SESSION['user']['user_name'];
        $tablela->setWhere('la_id = 1');
	$detail_lah = $tablela->updateRow($lahDetail);
}
$sqlwla = "select * from entity_report_last_audit ";
$fwViewData['wlaData'] = $fwDb->queryOne($sqlwla);


$sort_uid = $fwRequest->getParam('sort_uid', '');
if(!empty($sort_uid)) {
	$ord = " Order by dpn_id ";	
}

$sort_appsub = $fwRequest->getParam('sort_appsub', '');
if(!empty($sort_appsub)) {
	$ord =  " ORDER BY if( dpn_appl_submitted <> ' '
        OR dpn_appl_submitted IS NOT NULL , 1, 0 ) , STR_TO_DATE( dpn_appl_submitted, '%d-%m-%Y' ) DESC ";	
}



$where  = " and dpn_err_hide = 0 ";
$unhide = $fwRequest->getParam('unhide', '');
if($unhide) {
$where  = "";	
}

// Service Required Start
$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys_3 = array_keys($hide);
	 $ky_3  = $keys_3[0];
	 $val_3 = $hide[$ky_3];
	
	  $detail2['dpn_err_hide'] = $val_3;
	  $table_dpn->setWhere("dpn_unique_id = ".$ky_3);
	  if($table_dpn->rowExists())
	  {
		 $this_id = $table_dpn->updateRow($detail2);
	  }	  	
}
// Service Required Ends


// Service Required Start
$service = $fwRequest->getParam('service', '');
if($service)
{
	 $keys_2 = array_keys($service);
	 $ky_2 = $keys_2[0];
	 $val_2 = $service[$ky_2];
	
	 $dt = date('d-m-Y');
	 $user = $_SESSION['user']['user_name'];
	 
	  $detail['dpn_err_service_req'] = $val_2;
	  $detail['dpn_err_service_date'] = $dt;
	  $detail['dpn_err_service_user'] = $user;
	  
	  
	  $table_dpn->setWhere("dpn_unique_id = ".$ky_2);
	  if($table_dpn->rowExists())
	  {
		 $this_id = $table_dpn->updateRow($detail);
	  }	  	
}
// Service Required Ends	

 


  
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
		

  $searchkey = $fwRequest->getParam('searchkey', '');
  
  if($searchkey):


  $where .= " AND (document_proposal_name.dpn_unique_id LIKE '%".$searchkey."%') ";
			
		$_SESSION['searchkey'] = $searchkey;
		$fwViewData['searchkey']=$_SESSION['searchkey'];
		
  elseif($_SESSION['searchkey'] && $pagenum > 0):
		
   $where .= " AND ( document_proposal_name.dpn_unique_id LIKE '%".$_SESSION['searchkey']."%')' ";
			
		$fwViewData['searchkey']=$_SESSION['searchkey'];
		
  endif;

  $clear = $fwRequest->getParam('clear', '');	
  if($clear)
  {
	unset($_SESSION['searchkey']);
	unset($_SESSION['projectname']);
	$_SESSION['searchkey']='';
	$searchkey='';
	$projectname='';
	$fwViewData['searchkey']='';
	$where  = " and dpn_err_hide = 0";	
 }



 $sql = "Select  dpn_id, dpn_bsn_id, dpn_unique_id, dpn_proposal_number, dpn_err_service_req, dpn_err_hide , dpn_appl_submitted,
 	 dpn_err_cust_emailed, dpn_err_emails_date, dpn_err_emails_user, dpn_err_service_date, dpn_err_service_user, dpn_err_traffic_light,
	 dpn_err_traffic_light_date, dpn_err_traffic_light_user,dpn_err_icon_suff, dpn_err_icon_suff_date, dpn_err_icon_suff_user,
	 dpn_err_does_icon, dpn_water_ref, dpn_electric_ref, dpn_gas_ref, dpn_storm_ref, dpn_water_ref_date, dpn_water_ref_user, 
	 dpn_electric_ref_date, dpn_electric_ref_user, dpn_gas_ref_date, dpn_gas_ref_user, dpn_storm_ref_date, dpn_storm_ref_user,
	 dpn_add_to_er_date, dpn_er_type, dpn_er_tree_survey,  	dpn_er_app_sub_date, dpn_er_app_sub_user , dpn_tree_ref, dpn_tree_ref_date,
	 dpn_tree_ref_user, dpn_heritage_ref, dpn_heritage_ref_date, dpn_heritage_ref_user
     from document_proposal_name where ( dpn_err_add = 1 OR  dpn_add_to_er = 1 ) " .$where .$ord;

if($sql){$userData = $fwDb->query($sql);}
$design_phase = 0;
$planning = 0;
$construction =0;

foreach($userData as $k1=>$v1)
{
	$sqlcn = "select bsn_status from business where bsn_id = ".$v1['dpn_bsn_id'];
	$stdata = $fwDb->queryOne($sqlcn);
	$status_string = "'".$stdata['bsn_status']."'";
	if(strpos($status_string, '|12|') > 0) { $design_phase++ ; }
	if(strpos($status_string, '|2|') > 0) { $planning++ ; }
	if(strpos($status_string, '|3|') > 0) { $construction++ ; }
}

$fwViewData['design_phase'] = $design_phase;
$fwViewData['planning'] = $planning;
$fwViewData['construction'] = $construction;

$total2 = sizeof($userData);
$fwViewData['active'] =  $total2;

if(empty($pagenum)) { $pagenum = 1; }

$fwViewData['total'] =  $total2 - ($pagenum-1)*300;

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 500;
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

 $setdata2 = $fwDb->query($sql2);
 
 $k = 0;
foreach($setdata2 as $k2 => $v)
{	
		
	$sql_bus = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, 
	            bus_customers.bcust_lname, business.bsn_id, business.bsn_name,  business.bsn_address, business.bsn_status_sys_date,
				business.bsn_status from business_sellers 		
	            Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	            Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
	            where business.bsn_id = " .$v['dpn_bsn_id'];	
		
	
	$busData = $fwDb->queryOne($sql_bus);	
	
	$status_string = "'".$busData['bsn_status']."'";
	$status='';
	
		if(strpos($status_string, '|1|') > 0) { $status .= "Convert<br>" ; }
		if(strpos($status_string, '|2|') > 0) { $status .= "Planning Approvals<br>" ; }	
		if(strpos($status_string, '|3|') > 0) { $status .= "Construction<br>" ; }
		if(strpos($status_string, '|4|') > 0) { $status .= "Complete<br>" ; }
		if(strpos($status_string, '|5|') > 0) { $status .= "Inclusions<br>" ; }
		if(strpos($status_string, '|6|') > 0) { $status .= "Pre-construction<br>" ; }
	    if(strpos($status_string, '|12|') > 0) { $status .= "Design Phase<br>" ; }
		if(strpos($status_string, '|15|') > 0) { $status .= "Lost" ; }
		
		$dayscount='';
			
		$Statusdate = changedate_y_m_d($v['dpn_add_to_er_date']);
		
		if(!empty($Statusdate))
		{
			$curdate_y_m_d = date('d-m-Y');
			$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		}
		
		
		
	      $link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$v['dpn_bsn_id'];	
	
	      $sql517 = "Select doc_date_uploaded, doc_not_required, doc_file_name from document_check_list
		           where doc_name_id = 517 and doc_bsn_id = ".$v['dpn_bsn_id'] ;
		   
	      $data517 = $fwDb->queryOne($sql517);
	     
	      
	      $sql518 = "Select doc_date_uploaded, doc_not_required, doc_file_name from document_check_list
		           where doc_name_id = 518 and doc_bsn_id = ".$v['dpn_bsn_id'];
	
	      $data518 = $fwDb->queryOne($sql518);
	 
	      $sql627 = "Select doc_date_uploaded, doc_not_required, doc_file_name from document_check_list
		           where doc_name_id = 627 and doc_bsn_id = ".$v['dpn_bsn_id'];
	
	      $data627 = $fwDb->queryOne($sql627);
	  		
	      $sql628 = "Select doc_date_uploaded, doc_not_required, doc_file_name from document_check_list
		           where doc_name_id = 628 and doc_bsn_id = ".$v['dpn_bsn_id'];
	
	      $data628 = $fwDb->queryOne($sql628);
	      
	      $sql629 = "Select doc_date_uploaded, doc_not_required, doc_file_name from document_check_list
		           where doc_name_id = 629 and doc_bsn_id = ".$v['dpn_bsn_id'];
	      $data629 = $fwDb->queryOne($sql629);
	  
	      $sql630 = "Select doc_date_uploaded, doc_not_required, doc_file_name from document_check_list
		           where doc_name_id = 630 and doc_bsn_id = ".$v['dpn_bsn_id'];
	      $data630 = $fwDb->queryOne($sql630);
	      
		  
		  $sql716 = "Select doc_date_uploaded, doc_not_required, doc_file_name from document_check_list
		           where doc_name_id = 716 and doc_bsn_id = ".$v['dpn_bsn_id'];
	      $data716  = $fwDb->queryOne($sql716);
		  
		  $sql717 = "Select doc_date_uploaded, doc_not_required, doc_file_name from document_check_list
		           where doc_name_id = 717 and doc_bsn_id = ".$v['dpn_bsn_id'];
	      $data717  = $fwDb->queryOne($sql717);
		  
		  
	      $sql230 = "Select doc_date_uploaded, doc_not_required, doc_file_name from document_check_list
		           where doc_name_id = 230 and doc_bsn_id = ".$v['dpn_bsn_id'];
	      $data230 = $fwDb->queryOne($sql230);
	  		
	      $sql_mini_136 = "Select doc_date_uploaded, doc_not_required, doc_file_name from document_check_list_mini
		               where doc_name_id = 136 and doc_bsn_id = ".$v['dpn_bsn_id'] . " and doc_checklist_number = " .$v['dpn_proposal_number'];
	      $data_mini_136 = $fwDb->queryOne($sql_mini_136);
	      
	      $sql_mini_20 = "Select doc_date_uploaded, doc_not_required, doc_file_name from document_check_list_mini
		               where doc_name_id = 20 and doc_bsn_id = ".$v['dpn_bsn_id']. " and doc_checklist_number = " .$v['dpn_proposal_number'];
	      $data_mini_20 = $fwDb->queryOne($sql_mini_20);
	      
	      $sql675 = "Select bt_completed_date, bt_complete from business_tasks
			 where business_tasks.bt_bsn_id = ". $v['dpn_bsn_id']. " And business_tasks.bt_task_id = 675" ;
			 
	      $data675 = $fwDb->queryOne($sql675);	 
			 
	      $sql635 = "Select doc_date_uploaded, doc_not_required, doc_file_name from document_check_list
		           where doc_name_id = 635 and doc_bsn_id = ".$v['dpn_bsn_id'];
	      $data635 = $fwDb->queryOne($sql635);		 
		
	
	       $sql636 = "Select doc_date_uploaded, doc_not_required, doc_file_name from document_check_list
		           where doc_name_id = 636 and doc_bsn_id = ".$v['dpn_bsn_id'];
	      $data636 = $fwDb->queryOne($sql636);	
	      
	       $sql632 = "Select doc_date_uploaded, doc_not_required, doc_file_name from document_check_list
		           where doc_name_id = 632 and doc_bsn_id = ".$v['dpn_bsn_id'];
	      $data632 = $fwDb->queryOne($sql632);		 
			 
	      $sql_mini_137 = "Select doc_date_uploaded, doc_not_required, doc_file_name from document_check_list_mini
		               where doc_name_id = 137 and doc_bsn_id = ".$v['dpn_bsn_id']. " and doc_checklist_number = " .$v['dpn_proposal_number'];
	      $data_mini_137 = $fwDb->queryOne($sql_mini_137);
	
	
	     $sql_mini_138 = "Select doc_date_uploaded, doc_not_required, doc_file_name from document_check_list_mini
		               where doc_name_id = 138 and doc_bsn_id = ".$v['dpn_bsn_id']. " and doc_checklist_number = " .$v['dpn_proposal_number'];
	     $data_mini_138 = $fwDb->queryOne($sql_mini_138);
	
	     $sql123 = "Select bt_completed_date, bt_complete from proposal_tasks
                        where proposal_tasks.bt_bsn_id = ". $v['dpn_bsn_id']. " And proposal_tasks.bt_task_id = 123 and bt_complete = 1" ;
			 
	      $data123 = $fwDb->queryOne($sql123); 	
		
		
		 if(!empty($busData['bsn_name']) ) {
	  			

				$setdata2[$k]['dpn_unique_id'] = $v['dpn_unique_id'];
				$setdata2[$k]['bsn_id'] = $v['dpn_bsn_id'];
				$setdata2[$k]['bs_customers_id'] = $busData['bs_customers_id']; 
				$setdata2[$k]['bsn_name'] = $busData['bsn_name'];
				$setdata2[$k]['bcust_fname'] = $busData['bcust_fname'];
				$setdata2[$k]['bcust_lname'] = $busData['bcust_lname'];
				$setdata2[$k]['link'] = $link;
				$setdata2[$k]['reno_checklist_no'] = $data_rcn['dpn_unique_id'];
				$setdata2[$k]['status'] = $status;
			    $setdata2[$k]['status_string'] = $status_string;
			
			
				
				$setdata2[$k]['dayscount'] = $dayscount;
				
				if($data517['doc_not_required'] == 1) {
					$setdata2[$k]['doc_date_uploaded_517'] = 'N/R';
				} else {
					$setdata2[$k]['doc_date_uploaded_517'] = changedate_d_m_y($data517['doc_date_uploaded']);
					$setdata2[$k]['doc_file_name'] = $data517['doc_file_name'];
				}
				
				if($data518['doc_not_required'] == 1) {
					$setdata2[$k]['doc_date_uploaded_518'] = 'N/R';
				} else {
					$setdata2[$k]['doc_date_uploaded_518'] = changedate_d_m_y($data518['doc_date_uploaded']);
					$setdata2[$k]['doc_file_name_518'] = $data518['doc_file_name'];
				}
				
				if($data627['doc_not_required'] == 1) {
					$setdata2[$k]['doc_date_uploaded_627'] = 'N/R';
				} else {
					$setdata2[$k]['doc_date_uploaded_627'] = changedate_d_m_y($data627['doc_date_uploaded']);
					$setdata2[$k]['doc_file_name_627'] = $data627['doc_file_name'];
				}
				
				if($data628['doc_not_required'] == 1) {
					$setdata2[$k]['doc_date_uploaded_628'] = 'N/R';
				} else {
					$setdata2[$k]['doc_date_uploaded_628'] = changedate_d_m_y($data628['doc_date_uploaded']);
					$setdata2[$k]['doc_file_name_628'] = $data628['doc_file_name'];
				}
				
				if($data629['doc_not_required'] == 1) {
					$setdata2[$k]['doc_date_uploaded_629'] = 'N/R';
				} else {
					$setdata2[$k]['doc_date_uploaded_629'] = changedate_d_m_y($data629['doc_date_uploaded']);
					$setdata2[$k]['doc_file_name_629'] = $data629['doc_file_name'];
				}
				
				if($data630['doc_not_required'] == 1) {
					$setdata2[$k]['doc_date_uploaded_630'] = 'N/R';
				} else {
					$setdata2[$k]['doc_date_uploaded_630'] = changedate_d_m_y($data630['doc_date_uploaded']);
					$setdata2[$k]['doc_file_name_630'] = $data630['doc_file_name'];
				}
				
				
				if($data716['doc_not_required'] == 1) {
					$setdata2[$k]['doc_date_uploaded_716'] = 'N/R';
				} else {
					$setdata2[$k]['doc_date_uploaded_716'] = changedate_d_m_y($data716['doc_date_uploaded']);
					$setdata2[$k]['doc_file_name_716'] = $data716['doc_file_name'];
				}
				
				if($data717['doc_not_required'] == 1) {
					$setdata2[$k]['doc_date_uploaded_717'] = 'N/R';
				} else {
					$setdata2[$k]['doc_date_uploaded_717'] = changedate_d_m_y($data717['doc_date_uploaded']);
					$setdata2[$k]['doc_file_name_717'] = $data717['doc_file_name'];
				}
				
				
				if($data230['doc_not_required'] == 1) {
					$setdata2[$k]['doc_date_uploaded_230'] = 'N/R';
				} else {
					$setdata2[$k]['doc_date_uploaded_230'] = changedate_d_m_y($data230['doc_date_uploaded']);
					$setdata2[$k]['doc_file_name_230'] = $data230['doc_file_name'];
				}
				
				if($data_mini_136['doc_not_required'] == 1) {
					$setdata2[$k]['doc_date_uploaded_136'] = 'N/R';
				} else {
					$setdata2[$k]['doc_date_uploaded_136'] = changedate_d_m_y($data_mini_136['doc_date_uploaded']);
					$setdata2[$k]['doc_file_name_136'] = $data_mini_136['doc_file_name'];
				}
				
				if($data_mini_20['doc_not_required'] == 1) {
					$setdata2[$k]['doc_date_uploaded_20'] = 'N/R';
				} else {
					$setdata2[$k]['doc_date_uploaded_20'] = changedate_d_m_y($data_mini_20['doc_date_uploaded']);
					$setdata2[$k]['doc_file_name_20'] = $data_mini_20['doc_file_name'];
				}
				
				$setdata2[$k]['bt_completed_date'] = changedate_d_m_y($data675['bt_completed_date']);
				$setdata2[$k]['bt_complete'] = $data675['bt_complete'];
				
				
				if($data635['doc_not_required'] == 1) {
					$setdata2[$k]['doc_date_uploaded_635'] = 'N/R';
				} else {
					$setdata2[$k]['doc_date_uploaded_635'] = changedate_d_m_y($data635['doc_date_uploaded']);
					$setdata2[$k]['doc_file_name_635'] = $data635['doc_file_name'];
				}
				
				if($data636['doc_not_required'] == 1) {
					$setdata2[$k]['doc_date_uploaded_636'] = 'N/R';
				} else {
					$setdata2[$k]['doc_date_uploaded_636'] = changedate_d_m_y($data636['doc_date_uploaded']);
					$setdata2[$k]['doc_file_name_636'] = $data636['doc_file_name'];
				}
				
				if($data632['doc_not_required'] == 1) {
					$setdata2[$k]['doc_date_uploaded_632'] = 'N/R';
				} else {
					$setdata2[$k]['doc_date_uploaded_632'] = changedate_d_m_y($data632['doc_date_uploaded']);
					$setdata2[$k]['doc_file_name_632'] = $data632['doc_file_name'];
				}
				
				
				if($data_mini_137['doc_not_required'] == 1) {
					$setdata2[$k]['doc_date_uploaded_137'] = 'N/R';
				} else {
					$setdata2[$k]['doc_date_uploaded_137'] = changedate_d_m_y($data_mini_137['doc_date_uploaded']);
					$setdata2[$k]['doc_file_name_137'] = $data_mini_137['doc_file_name'];
				}
				
				if($data_mini_138['doc_not_required'] == 1) {
					$setdata2[$k]['doc_date_uploaded_138'] = 'N/R';
				} else {
					$setdata2[$k]['doc_date_uploaded_138'] = changedate_d_m_y($data_mini_138['doc_date_uploaded']);
					$setdata2[$k]['doc_file_name_138'] = $data_mini_138['doc_file_name'];
				}
				
				$setdata2[$k]['bt_completed_date_123'] = changedate_d_m_y($data123['bt_completed_date']);
				
				$k++;
				
		 }
						
}
		
	$fwViewData['list'] =  $setdata2;
 }
}

	  if(!empty($sort_project)) {
 		foreach ($setdata2 as $key => $row) {
		 
     		 $desig[$key]  = $row['bsn_name'];
		}
		
		array_multisort($desig, SORT_ASC, $setdata2);
		
		$fwViewData['list'] =  $setdata2;
	  }
	  
	  
	  if(!empty($projectname))
	  {
		foreach ($setdata2 as $key1 => $row1) {
		 
     		 if(stripos($row1['bsn_name'] , $projectname) == false ) { unset($setdata2[$key1]); }
		}
		
		$fwViewData['list'] =  $setdata2;
	  }
		
		
$design_phase = $fwRequest->getParam('design_phase', ''); 
	  if(!empty($design_phase))
	  {
		   foreach ($setdata2 as $key2 => $row2)
		   {
		 
     		if(strpos($row2['status_string'], '|12|') <= 0)
			  {
				  unset($setdata2[$key2]); 
			 }
		  }
		  
		  $fwViewData['list'] =  $setdata2;
	  }
	  
	  
	  $planning = $fwRequest->getParam('planning', ''); 
	  if(!empty($planning))
	  {
		   foreach ($setdata2 as $key2 => $row2)
		   {
		 
     		if(strpos($row2['status_string'], '|2|') <= 0)
			  {
				  unset($setdata2[$key2]); 
			 }
		  }
		  
		  $fwViewData['list'] =  $setdata2;
	  }	
		
		
	 	  
	  $construction = $fwRequest->getParam('construction', ''); 
	  if(!empty($construction))
	  {
		   foreach ($setdata2 as $key2 => $row2)
		   {
		 
     		if(strpos($row2['status_string'], '|3|') <= 0)
			  {
				  unset($setdata2[$key2]); 
			 }
		  }
		  
		  $fwViewData['list'] =  $setdata2;
	  }	  		
		
$thisTable = new Fw_Db_Table("entity_report_type");

$fwViewData['typedetail'] = $thisTable->getAllRows();	


//---------- Generate Pdf Starts --------------

$generate = $fwRequest->getParam('generate', '');
if(!empty($generate))
{
	$bsn_id = $fwRequest->getParam('bsn_id', '');
	$dpn_unique_id = $fwRequest->getParam('dpn_unique_id', '');
	

	$first_page = 'er_first_'.$bsn_id.'.pdf';
	$last_page  = 'er_last_'.$bsn_id.'.pdf';
	
	$sql = "Select doc_name_id , doc_file_name from document_check_list where doc_bsn_id = ".$bsn_id ." 
	        and doc_name_id IN (672,673, 421, 674, 424) order by FIELD(doc_name_id,672,673, 421, 674,424) ";
	$dcl = $fwDb->query($sql);

	$sql_bus = "SELECT  bus_customers.bcust_fname, bus_customers.bcust_lname, business.bsn_id, business.bsn_name,  
	             business.bsn_address
	            from business_sellers 		
	            Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	            Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
	            where business.bsn_id = " .$bsn_id;
		    
	$busdetails = $fwDb->queryOne($sql_bus);

	

	$html = '<html><body style="font-size:36px;">';
	$html .= '<p><h1> Entity Referral Progress </h1></p>';
	$html .= '<p>Project : '. $busdetails["bsn_name"] .'</p>';
	$html .= '<p>'. $busdetails["bcust_fname"].' '.$busdetails["bcust_lname"].'</p>';
	$html .= '<p>At Canberra Granny Flat Builders and Fixed Price Extensions, we are committed to managing all 
		     aspects design and construction process to ensure your design can be built as efficiently as possible,
		     whilst maintaining a world class quality. A key step in this process is securing all the relevant approvals 
		     from the ACT Government and related bodies. </p>';
	
	$html .= '<p>One of the more lengthy processes whilst obtaining planning approvals for projects in Canberra is getting 
		    the consent of utility providers. There are a large number of bodies that must consent to a residential 
		    build occurring, with the main three being:</p>';
	
	$html .='<ol>';
	$html .='<li>Icon Water</li>';  
	$html .='<li>Evo Energy</li>';
	$html .='<li>Jemena Gas</li>';
	$html .='</ol>';
	
	$html .= '<p>We recently referred your project to these bodies, in order to ensure we can factor all elements of your design and project 
		     into this fixed price proposal, and to ensure that your project can progress efficiently through the planning 
		     approvals process. </p>';
		     
	$html .= '<p>The following pages contain the results that have been received so far for these referrals, which can
	             be discussed in more detail with our team during the proposal meeting.  </p>';	      
	
	$html .= '</body></html>';
	
	create_er_first_page('Entity Report', $html, $bsn_id,'er_first_');
	
	// Creating Last Page
	$sqlnotes = "Select dpn_er_water_notes, dpn_er_ele_notes, dpn_er_gas_notes, dpn_appl_submitted  from  document_proposal_name
	           where dpn_unique_id = ".$dpn_unique_id;
     
        $notesData = $fwDb->queryOne($sqlnotes);
	
	$sql675 = "Select bt_completed_date, bt_complete from business_tasks
		   where business_tasks.bt_bsn_id = ". $bsn_id. " And business_tasks.bt_task_id = 675" ;
	$data675 = $fwDb->queryOne($sql675);
	
	$sql518 = "Select doc_date_uploaded, doc_not_required, doc_file_name from document_check_list
		   where doc_name_id = 518 and doc_bsn_id = ". $bsn_id;
	$data518 = $fwDb->queryOne($sql518);
	
	$sql123 = "Select bt_completed_date, bt_complete from proposal_tasks
                   where proposal_tasks.bt_bsn_id = ". $bsn_id. " And proposal_tasks.bt_task_id = 123 and bt_complete = 1" ;
			 
	$data123 = $fwDb->queryOne($sql123); 
	
	$html2 =  '<html><body style="font-size:36px;">';
	$html2 .= '<p><h1>Entity Referral Timeline </h1></p>';
	$html2 .= '<p><strong>Icon Water Asset Survey Requested : </strong>'.changedate_d_m_y($data123['bt_completed_date']).'</p>';
	$html2 .= '<p><strong>Icon Water WSCC Assessment Request : </strong>'.changedate_d_m_y($data675['bt_completed_date']).'</p>';
	$html2 .= '<p><strong>WSCC Assessment Received : </strong>'.changedate_d_m_y($data518['doc_date_uploaded']).'</p>';
	$html2 .= '<p><strong>Final Entity Approvals Requested : </strong>'.changedate_d_m_y($notesData['dpn_appl_submitted']).'<br>';
	$html2 .= '<hr></p>';
	$html2 .= '<p><h1>What do these decisions mean for you ? </h1></p>';
	
	$html2 .= '<p><strong>Icon Water</strong></p>';
	$html2 .= '<p>'.$notesData['dpn_er_water_notes'].'</p>';
	$html2 .= '<p><strong>Evo Energy</strong></p>';
	$html2 .= '<p>'.$notesData['dpn_er_ele_notes'].'</p>';
	$html2 .= '<p><strong>Jemena Gas</strong></p>';
	$html2 .= '<p>'.$notesData['dpn_er_gas_notes'].'<br>';
	$html2 .= '<hr></p>';
	$html2 .= '<p>Thank you for allowing us to create this design for you. We are looking forward to working on the 
	              planning approvals for this design, and looking forward to working with you in making this design reality.</p><br>';
		      
	$html2 .= "<p>Kind Regards<br>";
	$html2 .= "Planning Approval Manager<br>";
	$html2 .= "Canberra Fixed Price Extensions & Granny Flat Builders</p>";
		      
	create_er_first_page('Entity Report', $html2, $bsn_id,'er_last_');
	
	
	// End of last page
	 	
	
	$fn = "er_doc_report_".$bsn_id.".pdf";
	
		
	
	$docfile_fp = BASE_DIR.'files/document_check_list_files/'.$first_page;
	$newfile_fp = "new_ff_".$first_page;
			
	shell_exec('gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -sOutputFile='.$newfile_fp.' '.$docfile_fp);	
				
	rename($newfile_fp, BASE_DIR.'files/merged/'.$newfile_fp);
				
	$newfile_fp2 = BASE_DIR.'files/merged/'.$newfile_fp;
	

	
	// Last page
	
	$docfile_lp = BASE_DIR.'files/document_check_list_files/'.$last_page;
	$newfile_lp = "new_lp_".$last_page;
			
	shell_exec('gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -sOutputFile='.$newfile_lp.' '.$docfile_lp);	
				
	rename($newfile_lp, BASE_DIR.'files/merged/'.$newfile_lp);
				
	$newfile_lp2 = BASE_DIR.'files/merged/'.$newfile_lp;
	// end last page
	
	$my_pdf_v2 = new \Jurosh\PDFMerge\PDFMerger;  
	$my_pdf_v2->addPDF($newfile_fp2, 'all');
	
	

	foreach($dcl as $kd =>$vd)
	{
		if($vd['doc_file_name'])
		  {
			  
			  
			if (!is_dir(BASE_DIR.FILE_PATH . 'files/document_check_list_files/')) {
                    mkdir(BASE_DIR.FILE_PATH . 'files/document_check_list_files/', 0777, TRUE);
                } 
			  
			//$source = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/".$vd['doc_file_name'];
			$folder_path = "files/document_check_list_files/";
			 $source = get_file_raw_data($folder_path,$vd['doc_file_name']);
			
			$destination = BASE_DIR.FILE_PATH."files/document_check_list_files/".$vd['doc_file_name'];
			
			
			
			
			copy($source, $destination);  
			
			$docfile = BASE_DIR.'files/document_check_list_files/'.$vd['doc_file_name'];
			$newfile = "new_er_".$vd['doc_file_name'];
			
			shell_exec('gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -sOutputFile='.$newfile.' '.$docfile);	
			
				//sleep(1);
				
			rename($newfile, BASE_DIR.'files/merged/'.$newfile);
				//sleep(1);
				
			$newfile2 = BASE_DIR.'files/merged/'.$newfile;
				
			$my_pdf_v2->addPDF($newfile2, 'all');
		  }
	}
	$my_pdf_v2->addPDF($newfile_lp2, 'all');
	$my_pdf_v2->merge('file',BASE_DIR.'files/merged/'.$fn);
	$fn2 = BASE_URL."files/merged/er_doc_report_".$bsn_id.".pdf";   
	echo "<script>window.open('$fn2', '_blank','toolbar=yes, width=800, height=550'); window.focus();</script>";
}

	