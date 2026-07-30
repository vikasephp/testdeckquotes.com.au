<?php
$pagenum = $fwRequest->getparam('pagenum','');

$search = $fwRequest->getParam('search', '');
$table = new Fw_Db_Table('planning_ass_meet');


$meetinoffice = $fwRequest->getParam('meetinoffice', '');

if(!empty($meetinoffice)) {
	
	$meet = $fwRequest->getParam('meet', '');
	
	
	foreach($meet as $k=>$v)
	{
		  $meet = $k; 
	 
		  $detailM['qrm_bsn_id'] = $meet;
		  $detailM['qrm_meet'] = $v;
		  
		  $table->setWhere('qrm_bsn_id = '.$meet);
		  if(!$table->rowExists())
		  {
			$this_id = $table->insertRow($detailM);  
		  }
  		   else {
			 $this_id = $table->updateRow($detailM);
			 // $table->deleteRow();	
		  }
	 
  
  }
 
 
	 
	 
}

$planning = $fwRequest->getParam('planning', '');

if(!empty($planning)) {
	$plreport_not = $fwRequest->getParam('plreport_not', '');
	$_SESSION['plreport_not'] = $plreport_not;
	$fwViewData['pnot'] = $plreport_not;
}

if(!empty($search)) {
	$keyword = $fwRequest->getParam('keyword', '');
	//$_SESSION['keyword'] = $keyword;
}
$clear = $fwRequest->getParam('clear', '');

if($clear)
{
	
	unset($_SESSION['keyword']);
	unset($_SESSION['plreport_not']);
		
}

//unset($_SESSION['keyword']);
$where = "WHERE 1=1 ";
$fwViewData['ran'] =  rand(100000,999999);


	
if($keyword):

$where .= "AND business.bsn_sub_status LIKE '%".$keyword."%'";
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= "AND business.bsn_sub_status LIKE '%".$_SESSION['keyword']."%'";
	
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;
   
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}

if($_SESSION['plreport_not'] && $pagenum > 0) { $plreport_not = 1; }


$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
		bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2,bus_customers.bcust_misc_moble,bus_customers.bcust_misc_business,
		bus_customers.bcust_misc_home,business.bsn_advert_text,  business.bsn_id, business.bsn_name, 
		business.bsn_sub_status, business.bsn_status_sys_date, business.bsn_address 
		from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " Order By business.bsn_status_sys_date DESC";


if($plreport_not == 1 || $_SESSION['plreport_not'] == 1)
{
	$fwViewData['pnot'] = 1;	
	
	$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
		bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2,bus_customers.bcust_misc_moble,bus_customers.bcust_misc_business,
		bus_customers.bcust_misc_home,business.bsn_advert_text,  business.bsn_id, business.bsn_name, 
		business.bsn_sub_status, business.bsn_status_sys_date, business.bsn_address 
		from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Right Join document_check_list on  business_sellers.bs_business_id = document_check_list.doc_bsn_id 
		And length(document_check_list.doc_file_name) = 0 And document_check_list.`doc_name_id` = 44
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " Order By business.bsn_status_sys_date DESC";

}



if($sql){$userData = $fwDb->query($sql);}

//$fwViewData['total'] = sizeof($userData);
$total2 = sizeof($userData);

if(empty($pagenum)) { $pagenum = 1; }

$fwViewData['total'] =  $total2 - ($pagenum-1)*100;

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
		
		
		$sqlmeet = "Select planning_ass_meet.* from planning_ass_meet
					where planning_ass_meet.qrm_bsn_id  = ". $v['bsn_id'];
		$meetdata = $fwDb->queryOne($sqlmeet);
		
		
		
				$ccdate = $v['bsn_status_sys_date'];
				$Statusdate = changedate_y_m_d($ccdate);
				$curdate_y_m_d = date('Y-m-d');
				$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
				   
		
		// Uid 555 starts
				
				$sqluid555 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 555";
		     	$data555 = $fwDb->queryOne($sqluid555);
		
		// Uid 555 ends
		
		
		// Uid 474 starts
				
				$sqluid474 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 474";
		     	$data474 = $fwDb->queryOne($sqluid474);
		
		// Uid 474 ends
		
		
		// Uid 312 starts
				
				$sqluid312 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 312";
				$data312 = $fwDb->queryOne($sqluid312);
	
		// Uid 312 ends
		
		
		// Uid 301 starts
				
				$sqluid301 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 301";
				$data301 = $fwDb->queryOne($sqluid301);
	
		// Uid 301 ends
		
		// Uid 330 starts
				
				$sqluid330 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 330";
				$data330 = $fwDb->queryOne($sqluid330);
	
		// Uid 330 ends
		
		
		// Uid 369 starts
				
				$sqluid369 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 369";
				$data369 = $fwDb->queryOne($sqluid369);
	
		// Uid 369 ends
		
		
		// Uid 340 starts
				
				$sqluid340 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 340";
				$data340 = $fwDb->queryOne($sqluid340);
	
		// Uid 340 ends
		
		// Uid 44 planning assessment report
			
			

			
			$sql44 = "Select document_check_list.* from document_check_list
			          where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 44";
			$data44 = $fwDb->queryOne($sql44);
			
		// Uid 40 ends
		
		
		// Phone follow ups
		
		 $sfu = "Select count(*) as tot from  sales_followup where sf_pid = ".$v['bsn_id'];
         $sfData = $fwDb->queryOne($sfu);
				
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
		
		// Uid 2 need analysis survey support
				
			$sql2 = "Select document_check_list.* from document_check_list
			         where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 2";
			$data2 = $fwDb->queryOne($sql2);
				
		// Uid 2 ends
		
		
		// Uid 302 starts
				
				$sqluid302 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 302";
		     	$data302 = $fwDb->queryOne($sqluid302);
		
		// Uid 302ends
		
		
		// Uid 137 starts
				
				$sqluid137 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 137";
		     	$data137 = $fwDb->queryOne($sqluid137);
		
		// Uid 137 ends
		
		// Uid 206 starts
				
				$sqluid206 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 206";
		     	$data206 = $fwDb->queryOne($sqluid206);
		
		// Uid 206 ends
		
		
		$setdata2[$k]['bsn_id'] = $v['bsn_id'];
		$setdata2[$k]['bsn_address'] = $v['bsn_address'];
		$setdata2[$k]['hia_sign_date'] = changedate_d_m_y($ccdate);
		$setdata2[$k]['link'] = $link;
		$setdata2[$k]['status'] = $v['bsn_sub_status'];
		$setdata2[$k]['dayscount'] = $dayscount;
		$setdata2[$k]['budget'] = $v['bsn_advert_text'];
		
		$setdata2[$k]['meet'] = $meetdata['qrm_meet'];
		
		
		$setdata2[$k]['uid555complete'] = $data555['bt_complete'];
		$setdata2[$k]['uid555'] = $data555['bt_completed_date'];
		
		
		$setdata2[$k]['uid474complete'] = $data474['bt_complete'];
		$setdata2[$k]['uid474'] = $data474['bt_completed_date'];
		
		$setdata2[$k]['uid312complete'] = $data312['bt_complete'];
		$setdata2[$k]['uid312'] = $data312['bt_completed_date'];
		
		$setdata2[$k]['uid301complete'] = $data301['bt_complete'];
		$setdata2[$k]['uid301'] = $data301['bt_completed_date'];
		
		
		$setdata2[$k]['uid330complete'] = $data330['bt_complete'];
		$setdata2[$k]['uid330'] = $data330['bt_completed_date'];
		
		
		$setdata2[$k]['uid369complete'] = $data369['bt_complete'];
		$setdata2[$k]['uid369'] = $data369['bt_completed_date'];
		
		$setdata2[$k]['uid340complete'] = $data340['bt_complete'];
		$setdata2[$k]['uid340'] = $data340['bt_completed_date'];
		
		
		$setdata2[$k]['checklist44'] = $data44['doc_file_name'];
		
		$setdata2[$k]['salesfolloup'] = $sfData['tot'];
		$setdata2[$k]['lastfoldt'] = $lfdData['last_followup_date'];
		
		$setdata2[$k]['checklist45'] = $data45['doc_file_name'];
		
		$setdata2[$k]['checklist2'] = $data2['doc_file_name'];
		
		if($data302['bt_complete'] == 1) {
			$setdata2[$k]['boxsent'] = $data302['bt_completed_date'];	
		}
		
		$setdata2[$k]['uid137complete'] = $data137['bt_complete'];
		$setdata2[$k]['uid137'] = $data137['bt_completed_date'];
		
		
		$setdata2[$k]['uid206complete'] = $data206['bt_complete'];
		$setdata2[$k]['uid206'] = $data206['bt_completed_date'];
		
		$setdata2[$k]['bcust_fname'] = $v['bcust_fname'];
		$setdata2[$k]['bcust_lname'] = $v['bcust_lname'];
		
		$setdata2[$k]['bcust_misc_email1'] = $v['bcust_misc_email1'];
		$setdata2[$k]['bcust_misc_email2'] = $v['bcust_misc_email2'];
		$setdata2[$k]['bcust_misc_moble'] = $v['bcust_misc_moble'];
		$setdata2[$k]['bcust_misc_business'] = $v['bcust_misc_business'];
		$setdata2[$k]['bcust_misc_home'] = $v['bcust_misc_home'];
		
}
 
 	$fwViewData['list'] =  $setdata2;
 }
}

//$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Planning Assesment Quick Report";

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
		business.bsn_sub_status, business.bsn_status_sys_date, business.bsn_address 
		from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id " 
		. $where. " And business.bsn_id IN ".$data." Order By business.bsn_status_sys_date DESC";
	
	
	if($sqlP){$userDataP = $fwDb->query($sqlP);}
	

foreach($userDataP as $k => $v)
{
		$sqla = "Select document_check_list.* from document_check_list
			      where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 64";
		$data = $fwDb->queryOne($sqla);
		$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$v['bsn_id'];	
		
		
				$ccdate = $v['bsn_status_sys_date'];
				$Statusdate = changedate_y_m_d($ccdate);
				$curdate_y_m_d = date('Y-m-d');
				$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
				   
				
				$sqluid555 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 555";
		     	$data555 = $fwDb->queryOne($sqluid555);
		
		
				$sqluid474 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 474";
		     	$data474 = $fwDb->queryOne($sqluid474);
				
				$sqluid312 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 312";
				$data312 = $fwDb->queryOne($sqluid312);
				
				$sqluid301 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 301";
				$data301 = $fwDb->queryOne($sqluid301);
				
				$sqluid330 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 330";
				$data330 = $fwDb->queryOne($sqluid330);
				
				$sqluid369 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 369";
				$data369 = $fwDb->queryOne($sqluid369);
	

				
				$sqluid340 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 340";
				$data340 = $fwDb->queryOne($sqluid340);
	
			    $sql44 = "Select document_check_list.* from document_check_list
			          where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 44";
			    $data44 = $fwDb->queryOne($sql44);
				
	
				 $sfu = "Select count(*) as tot from  sales_followup where sf_pid = ".$v['bsn_id'];
				 $sfData = $fwDb->queryOne($sfu);
						
		
				 $lfd = "Select max(sf_date) as last_followup_date from  sales_followup where sf_pid = ".$v['bsn_id'];
				 $lfdData = $fwDb->queryOne($lfd);

				
				$sql45 = "Select document_check_list.* from document_check_list
						  where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 45";
				$data45 = $fwDb->queryOne($sql45);
					
					
				$sql2 = "Select document_check_list.* from document_check_list
						 where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 2";
				$data2 = $fwDb->queryOne($sql2);
					
				
				$sqluid302 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 302";
		     	$data302 = $fwDb->queryOne($sqluid302);
		
				
				$sqluid137 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 137";
		     	$data137 = $fwDb->queryOne($sqluid137);
		
				
				$sqluid206 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 206";
		     	$data206 = $fwDb->queryOne($sqluid206);
		
		
		
		$setdataP[$k]['bsn_id'] = $v['bsn_id'];
		$setdataP[$k]['bsn_address'] = $v['bsn_address'];
		$setdataP[$k]['hia_sign_date'] = changedate_d_m_y($ccdate);
		$setdataP[$k]['link'] = $link;
		$setdataP[$k]['status'] = $v['bsn_sub_status'];
		$setdataP[$k]['dayscount'] = $dayscount;
		$setdataP[$k]['budget'] = $v['bsn_advert_text'];
		
		$setdataP[$k]['uid555complete'] = $data555['bt_complete'];
		$setdataP[$k]['uid555'] = $data555['bt_completed_date'];
		
		$setdataP[$k]['uid474complete'] = $data474['bt_complete'];
		$setdataP[$k]['uid474'] = $data474['bt_completed_date'];
		
		$setdataP[$k]['uid312complete'] = $data312['bt_complete'];
		$setdataP[$k]['uid312'] = $data312['bt_completed_date'];
		
		$setdataP[$k]['uid301complete'] = $data301['bt_complete'];
		$setdataP[$k]['uid301'] = $data301['bt_completed_date'];
		
		
		$setdataP[$k]['uid330complete'] = $data330['bt_complete'];
		$setdataP[$k]['uid330'] = $data330['bt_completed_date'];
		
		
		$setdataP[$k]['uid369complete'] = $data369['bt_complete'];
		$setdataP[$k]['uid369'] = $data369['bt_completed_date'];
		
		$setdataP[$k]['uid340complete'] = $data340['bt_complete'];
		$setdataP[$k]['uid340'] = $data340['bt_completed_date'];
		
		$setdataP[$k]['checklist44'] = $data44['doc_file_name'];
		
		$setdataP[$k]['salesfolloup'] = $sfData['tot'];
		$setdataP[$k]['lastfoldt'] = $lfdData['last_followup_date'];
		
		$setdataP[$k]['checklist45'] = $data45['doc_file_name'];
		
		$setdataP[$k]['checklist2'] = $data2['doc_file_name'];
		
		if($data302['bt_complete'] == 1) {
			$setdataP[$k]['boxsent'] = $data302['bt_completed_date'];	
		}
		
		$setdataP[$k]['uid137complete'] = $data137['bt_complete'];
		$setdataP[$k]['uid137'] = $data137['bt_completed_date'];
		
		
		$setdataP[$k]['uid206complete'] = $data206['bt_complete'];
		$setdataP[$k]['uid206'] = $data206['bt_completed_date'];
		
		$setdataP[$k]['bcust_fname'] = $v['bcust_fname'];
		$setdataP[$k]['bcust_lname'] = $v['bcust_lname'];
		
		$setdataP[$k]['bcust_misc_email1'] = $v['bcust_misc_email1'];
		$setdataP[$k]['bcust_misc_email2'] = $v['bcust_misc_email2'];
		$setdataP[$k]['bcust_misc_moble'] = $v['bcust_misc_moble'];
		$setdataP[$k]['bcust_misc_business'] = $v['bcust_misc_business'];
		$setdataP[$k]['bcust_misc_home'] = $v['bcust_misc_home'];
		
}
 

 foreach ($setdataP as $key => $row) {
    // replace 0 with the field's index/key
    $dates[$key]  = $row['dayscount'];
}
	array_multisort($dates, SORT_ASC, $setdataP);

// db($setdata2);
// exit;

	$html ='';
	$html .= '<table class="first" cellpadding="5" border="1" style="border:1px solid #CCC">';
	$html .= "<tr>";
	$html .= "<th>Address</th><th>Customer</th> <th witdh='20'>Status </th><th>Day Count</th><th>Budget</th><th>Phone Follow Ups</th>
	          <th>Last Followup Date</th>";
	$html .= "<th>Box Sent</th><th>Face to Face<br>Booked</th><th>Planning<br>Assement Report<br> Delivered </th>";
	
				
	$html .= "</tr>";
	
	foreach($setdataP as $k => $v)
	{
		$html .= "<tr>";
		$html .= "<td>" . $v['bsn_address']. "</td>"; 
		$html .= "<td>" . $v['bcust_fname']." ".$v['bcust_lname']. "</td>"; 
		
		$html .= "<td>".  $v['status'] ."</td>";
		$html .= "<td>".  $v['dayscount'] ."</td>";
		$html .= "<td>".  $v['budget'] ."</td>"; 
		$html .= "<td>".  $v['salesfolloup'] ."</td>"; 
		$html .= "<td>".  $v['lastfoldt'] ."</td>"; 
		
		$html .= "<td>".  changedate_d_m_y($v['boxsent']) ."</td>"; 
		$html .= "<td>".  changedate_d_m_y($v['uid137']) ."</td>";
		$html .= "<td>".  changedate_d_m_y($v['uid206']) ."</td>";
		
		$html .= "</tr>";
		
	}
    $html .= "</table>";
	
	$heading = "Planning Assesment Quick Report";

	$fname = "";
	
	
	create_quick_report($heading,$html,$fname);
	
}
