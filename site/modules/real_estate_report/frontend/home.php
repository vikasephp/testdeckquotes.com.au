<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');

$searchaddr = $fwRequest->getParam('searchaddr', '');
$where = "WHERE 1=1 ";
$fwViewData['ran'] =  rand(100000,999999);
	
	
if(!empty($searchaddr)) {
	$searchkey = $fwRequest->getParam('searchkey', '');
	
}	
	
if($keyword):
$where .= "AND business.bsn_sub_status LIKE '%".$keyword."%'";
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= "AND business.bsn_sub_status LIKE '%".$_SESSION['keyword']."%'";
	
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;
   
   
if($searchkey):

$where .= " AND business.bsn_address LIKE '%".$searchkey."%'";
	
	$_SESSION['searchkey'] = $searchkey;
	$fwViewData['searchkey']=$_SESSION['searchkey'];

elseif($_SESSION['searchkey'] && $pagenum > 0):

	$where .= " AND business.bsn_address LIKE '%".$_SESSION['searchkey']."%'";
	
	$fwViewData['searchkey']=$_SESSION['searchkey'];
endif; 
  
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
		

$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
 		bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2,bus_customers.bcust_misc_moble,
		bus_customers.bcust_misc_business, bus_customers.bcust_misc_home,business.bsn_advert_text, business.bsn_id,
		business.bsn_name,  business.bsn_sub_status,
		business.bsn_status_sys_date, business.bsn_address,  business.bsn_cp_incl_choices
		from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id  
		 ". $where. " And  business.bsn_proj_cust_type = 2 Order By business.bsn_status_sys_date DESC";



if($sql){$userData = $fwDb->query($sql);}

$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 100;
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
		$sqla = "Select document_check_list.* from document_check_list
			      where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 64";
		$data = $fwDb->queryOne($sqla);
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
		
		//$ccdate = $v['bsn_status_sys_date'];
		//$Statusdate = changedate_y_m_d($ccdate);
		//$curdate_y_m_d = date('Y-m-d');
		//$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
	   
		
		// Uid 476 starts
				
				$sqluid476 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 476";
		     	$data476 = $fwDb->queryOne($sqluid476);
		
		// Uid 476 ends
		
		
		// Uid 271 starts
				
				$sqluid271 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 271";
		     	$data271 = $fwDb->queryOne($sqluid271);
		
		// Uid 271 ends
		
		// Uid 528 starts
				
				$sqluid528 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 528";
				$data528 = $fwDb->queryOne($sqluid528);
	
		// Uid 528 ends
		
		// Uid 377 starts
				
				$sqluid377 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 377";
				$data377 = $fwDb->queryOne($sqluid377);
	
		// Uid 377 ends
		
		
		// Uid 518 starts
				
				$sqluid518 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 518";
				$data518 = $fwDb->queryOne($sqluid518);
	
		// Uid 518 ends
		
		// Uid 359 starts
				
				$sqluid359 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 359";
				$data359 = $fwDb->queryOne($sqluid359);
	
		// Uid 359 ends

		
		// Uid 40 planning assessment report
				
			$sql44 = "Select document_check_list.* from document_check_list
			          where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 44";
			$data44 = $fwDb->queryOne($sql44);
				
		// Uid 40 ends
		
		
		// Phone follow ups
		
		 $sqlalert = "Select count(*) as tot from  business_alert
		         where be_business_id = ".$v['bsn_id'] . " AND business_alert.be_alert_active = 'Yes' ";
         $alertData = $fwDb->queryOne($sqlalert);
				
		//
		
		// Last follow up date
		
		 $lfd = "Select max(sf_date) as last_followup_date from  sales_followup where sf_pid = ".$v['bsn_id'];
         $lfdData = $fwDb->queryOne($lfd);
		// Last follow up date ends
		
		
		// Uid 45 Signed Design Agreement
				
			$sql45 = "Select document_check_list.* from document_check_list
			          where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 45";
			$data45 = $fwDb->queryOne($sql45);
				
		// Uid 45 ends
		
		
		 $sqlcount = "Select count(*) as tottasks from  business_tasks
		              where bt_bsn_id = ".$v['bsn_id'] . " AND business_tasks.bt_task_status_id = 1 ";
         $taskcount = $fwDb->queryOne($sqlcount);
		
		 $sqldone = "Select count(*) as taskcomplete from  business_tasks
		              where bt_bsn_id = ".$v['bsn_id'] . " AND business_tasks.bt_task_status_id = 1 AND business_tasks.bt_complete = 1";
         $taskdone = $fwDb->queryOne($sqldone);
		
		if(!count($taskdone) > 0 ) {  $taskdone['taskcomplete'] = 0; }
		
		
		 $sqlinclusion = "Select count(*) as totinctasks from  business_tasks
		                 where bt_bsn_id = ".$v['bsn_id'] . " AND business_tasks.bt_task_status_id = 5 ";
         $taskinclusion = $fwDb->queryOne($sqlinclusion);
		
		 $sqlincdone = "Select count(*) as taskincomp from  business_tasks
		              where bt_bsn_id = ".$v['bsn_id'] . " AND business_tasks.bt_task_status_id = 5 AND business_tasks.bt_complete = 1";
         $taskincdone = $fwDb->queryOne($sqlincdone);
		
		if(!count($taskincdone) > 0 ) {  $taskincdone['taskincomp'] = 0; }
		
		
		// Uid 370 Current Project Inclusions
				
			$sql370 = "Select document_check_list.* from document_check_list
			          where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 370";
			$data370 = $fwDb->queryOne($sql370);
			
			
		// Uid 370 ends
		
		
		$setdata2[$k]['bsn_id'] = $v['bsn_id'];
		$setdata2[$k]['bsn_address'] = $v['bsn_address'];
		$setdata2[$k]['hia_sign_date'] = changedate_d_m_y($ccdate);
		$setdata2[$k]['link'] = $link;
		$setdata2[$k]['prd_name'] = $v['prd_name'];
		$setdata2[$k]['tot'] = $alertData['tot'];
		
		$setdata2[$k]['bsn_cp_incl_choices'] = $v['bsn_cp_incl_choices'];
		
		$setdata2[$k]['dayscount'] = $dayscount;
		$setdata2[$k]['uid476complete'] = $data476['bt_complete'];
		$setdata2[$k]['uid476'] =  $data476['bt_completed_date'];
		$setdata2[$k]['uid271complete'] = $data271['bt_complete'];
		$setdata2[$k]['uid271'] = $data271['bt_completed_date'];
		
		$setdata2[$k]['uid528complete'] = $data528['bt_complete'];
		$setdata2[$k]['uid528'] = $data528['bt_completed_date'];
		
		$setdata2[$k]['uid377complete'] = $data377['bt_complete'];
		$setdata2[$k]['uid377'] = $data377['bt_completed_date'];
		
		$setdata2[$k]['uid518complete'] = $data518['bt_complete'];
		$setdata2[$k]['uid518'] = $data518['bt_completed_date'];
		
		
		$setdata2[$k]['uid359complete'] = $data359['bt_complete'];
		$setdata2[$k]['uid359'] = $data359['bt_completed_date'];
		
		$setdata2[$k]['uid370doc'] = $data370['doc_file_name'];
		$setdata2[$k]['uid370'] = changedate_d_m_y($data370['doc_date_uploaded']);
		
	
		$setdata2[$k]['bcust_fname'] = $v['bcust_fname'];
		$setdata2[$k]['bcust_lname'] = $v['bcust_lname'];
		
		$setdata2[$k]['bcust_misc_email1'] = $v['bcust_misc_email1'];
		$setdata2[$k]['bcust_misc_email2'] = $v['bcust_misc_email2'];
		$setdata2[$k]['bcust_misc_moble'] = $v['bcust_misc_moble'];
		$setdata2[$k]['bcust_misc_business'] = $v['bcust_misc_business'];
		$setdata2[$k]['bcust_misc_home'] = $v['bcust_misc_home'];
		
		$setdata2[$k]['total_task'] = $taskcount['tottasks'];
		$setdata2[$k]['taskdone'] = $taskdone['taskcomplete'];
		
		
		$setdata2[$k]['total_inc_task'] = $taskinclusion['totinctasks'];
		$setdata2[$k]['task_inc_done'] = $taskincdone['taskincomp'];
		
		
}
 
 foreach ($setdata2 as $key => $row) {
    // replace 0 with the field's index/key
    $dates[$key]  = $row['dayscount'];
}
	array_multisort($dates, SORT_ASC, $setdata2);

 	$fwViewData['list'] =  $setdata2;
 	
 }
}

//$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Real Estate Report";

$submitdownload = $fwRequest->getParam('download', '');
if($submitdownload) {
 	$pdfData = $fwRequest->getParam('pdf', '');
	
	if($pdfData) {
	$data='(';
	foreach($pdfData as $k1 => $v1)
	{
		$data .= $k1 .",";
	}
	$data .= "0)";
	
	}
		
	
	$html = '';	
	
	
	$sqlP = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
		bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2,bus_customers.bcust_misc_moble,bus_customers.bcust_misc_business,
		bus_customers.bcust_misc_home,business.bsn_advert_text,  business.bsn_id, business.bsn_name,  
		business.bsn_sub_status, business.bsn_status_sys_date, business.bsn_address ,  person_responsible_detail.prd_name
		from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id  
		Right JOIN person_responsible_detail ON  business_sellers.bs_business_id = person_responsible_detail.prd_bsn_id And 
		person_responsible_detail.prd_prm_id = 10 "
		. $where. " And  business.bsn_status like '%|5|%' And business.bsn_id IN ".$data." Order By business.bsn_status_sys_date DESC";
	
	
	if($sqlP){$userDataP = $fwDb->query($sqlP);}
	
foreach($userDataP as $k => $v)
{
		$sqla = "Select document_check_list.* from document_check_list
			      where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 64";
		$data = $fwDb->queryOne($sqla);
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
		

				
				$sqluid476 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 476";
		     	$data476 = $fwDb->queryOne($sqluid476);

				
				$sqluid271 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 271";
		     	$data271 = $fwDb->queryOne($sqluid271);
		
				$sqluid528 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 528";
				$data528 = $fwDb->queryOne($sqluid528);
	
			
				$sqluid377 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 377";
				$data377 = $fwDb->queryOne($sqluid377);
	
				
				$sqluid518 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 518";
				$data518 = $fwDb->queryOne($sqluid518);
				
				$sqluid359 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 359";
				$data359 = $fwDb->queryOne($sqluid359);
	

				
			$sql44 = "Select document_check_list.* from document_check_list
			          where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 44";
			$data44 = $fwDb->queryOne($sql44);
				

		    $sqlalert = "Select count(*) as tot from  business_alert
		         where be_business_id = ".$v['bsn_id'] . " AND business_alert.be_alert_active = 'Yes' ";
            $alertData = $fwDb->queryOne($sqlalert);

		
		    $lfd = "Select max(sf_date) as last_followup_date from  sales_followup where sf_pid = ".$v['bsn_id'];
            $lfdData = $fwDb->queryOne($lfd);

			$sql45 = "Select document_check_list.* from document_check_list
			          where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 45";
			$data45 = $fwDb->queryOne($sql45);
		
		
		$setdataP[$k]['bsn_id'] = $v['bsn_id'];
		$setdataP[$k]['bsn_address'] = $v['bsn_address'];
		$setdataP[$k]['hia_sign_date'] = changedate_d_m_y($ccdate);
		$setdataP[$k]['link'] = $link;
		$setdataP[$k]['prd_name'] = $v['prd_name'];
		$setdataP[$k]['tot'] = $alertData['tot'];
		$setdataP[$k]['dayscount'] = $dayscount;
		$setdataP[$k]['uid476complete'] = $data476['bt_complete'];
		$setdataP[$k]['uid476'] =  $data476['bt_completed_date'];
		$setdataP[$k]['uid271complete'] = $data271['bt_complete'];
		$setdataP[$k]['uid271'] = $data271['bt_completed_date'];
		$setdataP[$k]['uid528complete'] = $data528['bt_complete'];
		$setdataP[$k]['uid528'] = $data528['bt_completed_date'];
		$setdataP[$k]['uid377complete'] = $data377['bt_complete'];
		$setdataP[$k]['uid377'] = $data377['bt_completed_date'];
		$setdataP[$k]['uid518complete'] = $data518['bt_complete'];
		$setdataP[$k]['uid518'] = $data518['bt_completed_date'];
		$setdataP[$k]['uid359complete'] = $data359['bt_complete'];
		$setdataP[$k]['uid359'] = $data359['bt_completed_date'];
		$setdataP[$k]['bcust_fname'] = $v['bcust_fname'];
		$setdataP[$k]['bcust_lname'] = $v['bcust_lname'];
		$setdataP[$k]['bcust_misc_email1'] = $v['bcust_misc_email1'];
		$setdataP[$k]['bcust_misc_email2'] = $v['bcust_misc_email2'];
		$setdataP[$k]['bcust_misc_moble'] = $v['bcust_misc_moble'];
		$setdataP[$k]['bcust_misc_business'] = $v['bcust_misc_business'];
		$setdataP[$k]['bcust_misc_home'] = $v['bcust_misc_home'];
		
}
 
 
 //db($setdataP);
 
 
 foreach ($setdataP as $key => $row) {
    // replace 0 with the field's index/key
    $dates[$key]  = $row['dayscount'];
}
	array_multisort($dates, SORT_ASC, $setdataP);

// db($setdata2);
// exit;

	$html .= '<table class="first" cellpadding="5" border="1" style="border:1px solid #CCC">';
	$html .= "<tr>";
	$html .= "<th>Address</th> <th>Inclusion<br>Coordinator </th><th>Day Count</th><th>Active<br>Alerts</th><th>UID476</th>
	          <th>UID271</th><th>UID528</th><th>UID377</th><th>UID518</th><th>UID359</th>";
	$html .= "</tr>";
	
	foreach($setdataP as $k => $v)
	{
		$html .= "<tr>";
		$html .= "<td>" . $v['bsn_address']. "</td>"; 
		$html .= "<td>".  $v['prd_name'] ."</td>";
		$html .= "<td>".  $v['dayscount'] ."</td>";
		$html .= "<td>".  $v['tot'] ."</td>"; 
		$html .= "<td>".  changedate_d_m_y($v['uid476']) ."</td>"; 
		$html .= "<td>".  changedate_d_m_y($v['uid271']) ."</td>";
		$html .= "<td>".  changedate_d_m_y($v['uid528']) ."</td>";
		$html .= "<td>".  changedate_d_m_y($v['uid377']) ."</td>";
		$html .= "<td>".  changedate_d_m_y($v['uid518']) ."</td>";
		$html .= "<td>".  changedate_d_m_y($v['uid359']) ."</td>";
		$html .= "</tr>";
		
	}
    $html .= "</table>";
	
	$heading = "Inclusion Report";
	$fname = "";
	
	
	create_inclusion_report($heading,$html,$fname);
	
}