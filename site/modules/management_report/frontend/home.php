<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('design_report_hide');
$tablebusiness = new Fw_Db_Table('business');
$tablebs = new Fw_Db_Table('business_sellers');
$tablebc = new Fw_Db_Table('bus_customers');
$where = " WHERE business.bsn_status like '%|2|%' ";
$fwViewData['ran'] =  rand(100000,999999);

// Save customer budget
$budget = $fwRequest->getParam('savebudget', '');
if(!empty($budget)) {
	$dt = date('d-m-Y h:i:sa');
        $user = $_SESSION['user']['user_name'];
        $budgetData = $fwRequest->getParam('cust_budget', '');
	$key = array_keys($budgetData);
	$ky = $key[0];
	
	$budgDetail['dpn_dr_cust_budget'] = $budgetData[$ky];
	$budgDetail['dpn_dr_budg_user'] = $user;
	$budgDetail['dpn_dr_budg_date'] = $dt;
	
	$table_dpn->setWhere('dpn_unique_id = '.$ky);
	$detail = $table_dpn->updateRow($budgDetail);		
}
//End customer budget

// Sava Percentage Complete
$saveper = $fwRequest->getParam('saveper', '');
if(!empty($saveper)) {

    $percData = $fwRequest->getParam('percentage', '');
	$key = array_keys($percData);
	$ky = $key[0];
	$percDetail['dpn_dr_per_complete'] = $percData[$ky];

	$table_dpn->setWhere('dpn_unique_id = '.$ky);
	$detail = $table_dpn->updateRow($percDetail);		
}
//End percentage complete


// Sava project plan checked
$ppnic = $fwRequest->getParam('ppnic', '');
if(!empty($ppnic)) {

        $pp_by_nick = $fwRequest->getParam('pp_by_nick', '');
	$key = array_keys($pp_by_nick);
	$ky = $key[0];
	$ppnDetail['bcust_mr_pp_nick'] = $pp_by_nick[$ky];

	$tablebc->setWhere('bcust_id = '.$ky);
	$detail = $tablebc->updateRow($ppnDetail);		
}
//End project plan checked

// Sava Goal date for Da
$goal_date = $fwRequest->getParam('goal_date', '');
if(!empty($goal_date)) {

    $goal_date_da = $fwRequest->getParam('goal_date_da', '');
	$key = array_keys($goal_date_da);
	$ky = $key[0];
	$goalDetail['bcust_mr_goal_date'] = $goal_date_da[$ky];
	$tablebc->setWhere('bcust_id = '.$ky);
	$detail = $tablebc->updateRow($goalDetail);		
}
//End Goal date for Da

// Sava Likely Date
$likely_date = $fwRequest->getParam('likely_date', '');
if(!empty($likely_date)) {
	$likely_da = $fwRequest->getParam('likely_da', '');
	$key = array_keys($likely_da);
	$ky = $key[0];
	$likelyDetail['bcust_mr_likely_da_dt'] = $likely_da[$ky];
	$tablebc->setWhere('bcust_id = '.$ky);
	$detail = $tablebc->updateRow($likelyDetail);		
}
//End Likely Date
	
// Sava CSBD DA
$csbd_day = $fwRequest->getParam('csbd_day', '');
if(!empty($csbd_day)) {
	$csbd_ba = $fwRequest->getParam('csbd_ba', '');
	$key = array_keys($csbd_ba);
	$ky = $key[0];
	$csbdDetail['bsn_latest_csbd'] = $csbd_ba[$ky];
	$tablebusiness->setWhere('bsn_id = '.$ky);
	$detail = $tablebusiness->updateRow($csbdDetail);		
}
//End CSBD Date
	
	
$clear = $fwRequest->getParam('clear', '');

$searchkey = $fwRequest->getParam('searchkey', '');
	
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
		
  if($searchkey):

		$where .= " AND business.bsn_address LIKE '%".$searchkey."%' OR  bus_customers.bcust_fname LIKE '%".$searchkey."%'  OR  bus_customers.bcust_lname LIKE '%".$searchkey."%' ";
			
			$_SESSION['searchkey'] = $searchkey;
			$fwViewData['searchkey']=$_SESSION['searchkey'];
		
		elseif($_SESSION['searchkey'] && $pagenum > 0):
		
$where .= " AND business.bsn_address LIKE '%".$_SESSION['searchkey']."%' OR  bus_customers.bcust_fname LIKE '%".$$_SESSION['searchkey']."%'  OR  bus_customers.bcust_lname LIKE '%".$$_SESSION['searchkey']."%' ";
			
		$fwViewData['searchkey']=$_SESSION['searchkey'];
  endif;

  if($clear)
  {
	unset($_SESSION['searchkey']);
	$_SESSION['searchkey']='';
	$searchkey='';
	$fwViewData['searchkey']='';
	$where = " WHERE business.bsn_dr_hide = 0 ";
  }

		
$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        bus_customers.bcust_misc_email1, business.bsn_id, business.bsn_name,  business.bsn_sub_status, bus_customers.bcust_mr_pl_manager,
        bus_customers.bcust_id, bus_customers.bcust_mr_pl_type, 
	    bus_customers.bcust_mr_pp_req, bus_customers.bcust_mr_arch_pp, bus_customers.bcust_mr_reday_nick, bus_customers.bcust_mr_pr_readyfor,
        bus_customers.bcust_mr_pp_nick, bus_customers.bcust_mr_ppsigned,  business.bsn_ptt_d_type,
        bus_customers.bcust_mr_goal_date, bus_customers.bcust_mr_da_lodged, bus_customers.bcust_mr_likely_da_dt,
	    bus_customers.bcust_mr_ba_lodged,   business_sellers.bs_traffic_light, business_sellers.bs_tl_user,
	    business_sellers.bs_tl_date, business.bsn_address, business.bsn_status_sys_date, business.bsn_latest_csbd
	    from business_sellers 		
	    Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	    Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
	" . $where. " Group By business.bsn_id " ;		
		

if($sql){$userData = $fwDb->query($sql);}

//$fwViewData['total'] = sizeof($userData);
$total2 = sizeof($userData);

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
foreach($setdata2 as $k => $v)
{
	
		$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$v['bsn_id'];	
		$dayscount='';
		
		$sqla = "Select document_check_list.* from document_check_list
			      where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 64";
		$data = $fwDb->queryOne($sqla);
	
		if(!empty($data['doc_file_name']))
				 {
					$ccdate = $data['doc_date_uploaded'];
					$Statusdate = changedate_y_m_d($ccdate);
					$curdate_y_m_d = date('Y-m-d');
					$hiadayscount = daysDifference($curdate_y_m_d, $Statusdate);
				   
				} else { $ccdate = ''; 
				         $hiadayscount='';
					}
	
	
		// Survey Uploaded
		
		$sql_hia = "Select doc_file_name, doc_date_uploaded from document_check_list where  doc_bsn_id  = ". $v['bsn_id']
		         . " And doc_name_id = 64 ";
		$hiaData = $fwDb->queryOne($sql_hia);
	
	
		$Statusdate = changedate_y_m_d($hiaData['doc_date_uploaded']);
		
		if(!empty($Statusdate))
		{
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		}
		
		$sql_73 = "Select  doc_date_uploaded from document_check_list where  doc_bsn_id  = ". $v['bsn_id']
		         . " And doc_name_id = 73 ";
		$data73 = $fwDb->queryOne($sql_73);

		$sqlpm = "select prd_name from person_responsible_detail where prd_prm_id = 8 and prd_bsn_id = ". $v['bsn_id'];
		$pmData = $fwDb->queryOne($sqlpm);
		
		$sqloa = "select prd_name from person_responsible_detail where prd_prm_id = 6 and prd_bsn_id = ". $v['bsn_id'];
		$oaData = $fwDb->queryOne($sqloa);
	
	    $sql663 = "select bt_completed_date from business_tasks where bt_task_id = 663 and bt_bsn_id = ". $v['bsn_id'];
		$data663 = $fwDb->queryOne($sql663);
	
	     if($hiaData['doc_date_uploaded'] <> '0000-00-00 00:00:00') {
			$date = $hiaData['doc_date_uploaded']; // date you want to upgade
      	    $date_28 = date("Y-m-d", strtotime($date ." +28 day") );
		} else {
			$date_28='';
		}
	
	
	     $sql328 = "Select bt_complete, bt_task_not_required from business_tasks
			        where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 328";
		 $data328 = $fwDb->queryOne($sql328);		  
	
	    if($data328['bt_task_not_required'] == 1) {
		      $uid328 = "Not Required" ;	
		} else if($data328['bt_complete'] == 1) {
			 $uid328 = "Yes" ;
		} else if($data328['bt_complete'] == 0) {
			 $uid328 = "No" ;
		}
	
	     
		 
		 $sql374 = "Select bt_complete, bt_task_not_required from business_tasks
			        where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 374";
		 $data374 = $fwDb->queryOne($sql374);		  
	
	    if($data374['bt_task_not_required'] == 1) {
		      $uid374 = "Not Required" ;	
		} else if($data374['bt_complete'] == 1) {
			 $uid374 = "Yes" ;
		} else if($data374['bt_complete'] == 0) {
			 $uid374 = "No" ;
		}
	
	
		$setdata2[$k]['dayscount'] = $dayscount;
		$setdata2[$k]['hiadayscount'] = $hiadayscount;
		$setdata2[$k]['hia_signed_date'] = changedate_d_m_y($hiaData['doc_date_uploaded']);
		$setdata2[$k]['bcust_mr_pl_manager'] = $v['bcust_mr_pl_manager'];
		$setdata2[$k]['prd_name'] = $pmData['prd_name'];
		$setdata2[$k]['overarchi'] = $oaData['prd_name'];
		$setdata2[$k]['bt_completed_date_663'] = changedate_d_m_y($data663['bt_completed_date']);
		$setdata2[$k]['doc_date_uploaded_73'] = changedate_d_m_y($data73['doc_date_uploaded']);
		$setdata2[$k]['date_28'] = changedate_d_m_y($date_28);
		
		$setdata2[$k]['uid328'] = $uid328;
		$setdata2[$k]['uid374'] = $uid374;
		
		$k++;
			
}
	$fwViewData['list'] =  $setdata2;
 }
}


	//$sortbydesigner = $fwRequest->getParam('sortbydesigner','');
	//if($sortbydesigner):

		 foreach ($setdata2 as $key => $row) {
	   
			 $desig[$key]  = $row['dayscount'];
		}
			
			array_multisort($desig, SORT_ASC, $setdata2);
			
	
		$fwViewData['list'] =  $setdata2;
	//endif;
	

$sql_type = "Select * from management_rep_pl_type";
$fwViewData['typeData'] = $fwDb->query($sql_type);
	
	
$submit = $fwRequest->getParam('print', '');
if(!empty($submit))
{
	$heading ='Management Report';
	$fname ='';
	$html="<html><body>";
	
	$html .= '<table border="1" width="100%" cellpadding="5">';
	$html .= '<tr><th style="width:11%";>Project Details</th><th>Trafic Light</th><th>Hia Signed Date</th><th style="width:8%";>Planning Manager</th>';
	$html .= '<th style="width:3%";>Days</th><th>Planning Type</th>';
	$html .= '<th>Ready for Nick to Check</th><th>PP Ready for customer sign off?</th>';
	$html .= '<th>Project Plans checked by Nick?</th><th>Project Plans signed off by Client</th>';
	$html .= '<th>Goal Date for DA to be lodged</th><th>Da lodged</th><th>Likley DA Approval Date</th><th>DA Complete</th>';
	$html .= '<th>Ba lodged</th><th>CSBD (Day of BA)</th>';
	$html .= '</tr>';
	foreach($setdata2 as $kp => $vp)
	{
			
		if($vp['bcust_mr_reday_nick'] == "No") { $b4 = 'style="background-color:#F00;"'; } else {$b4 =''; }
		if($vp['bcust_mr_pr_readyfor'] == "No") { $b5 = 'style="background-color:#F00;"'; } else {$b5 =''; }

	   // if($vp['bcust_mr_ba_lodged'] == "No") { $b8 = 'style="background-color:#F00;"'; } else {$b8 =''; }
		if($vp['uid328'] == "No") { $b7 = 'style="background-color:#F00;"'; } else {$b7 =''; }
		
		if($vp['bs_traffic_light'] == 1) { $tlb = 'style="background-color:#00CC33;"'; }
		if($vp['bs_traffic_light'] == 2) { $tlb = 'style="background-color:#ff7f27;"'; }
		if($vp['bs_traffic_light'] == 3) { $tlb = 'style="background-color:#F00;"'; }
		
		if($vp['bcust_mr_ba_lodged'] == "Cant Lodge") { $cl = 'style="background-color:#F00;"'; } else {$cl =''; }
		
		$html .= '<tr>';
	
		$html .= '<td>'.stripslashes($vp['bsn_address']).'</td>';
		$html .= "<td ".$tlb.">".$vp['bs_tl_user']."<br>".$vp['bs_tl_date']."</td>";
		$html .= '<td>'.$vp['hia_signed_date'].'</td>';
		$html .= '<td>'.$vp['prd_name'].'</td>';
		$html .= '<td>'.$vp['dayscount'].'</td>';
		$html .= '<td>'.$vp['bcust_mr_pl_type'].'</td>';
		
	
	
		$html .= "<td ". $b4.">".$vp['bcust_mr_reday_nick'].'</td>';
		$html .= "<td ". $b5.">".$vp['bcust_mr_pr_readyfor'].'</td>';
		$html .= '<td>'.$vp['bt_completed_date_663'].'</td>';
		$html .= "<td>".$vp['doc_date_uploaded_73'].'</td>';
		
		$html .= '<td>'.$vp['date_28'].'</td>';
		$html .= "<td ". $b7.">".$vp['uid328'].'</td>';
		$html .= '<td>'.$vp['bcust_mr_likely_da_dt'].'</td>';
		$html .= "<td>".$vp['uid374'].'</td>';
		
		$html .= "<td ". $cl.">".$vp['bcust_mr_ba_lodged'].'</td>';
		$html .= '<td>'.$vp['bsn_latest_csbd'].'</td>';
		
		
		$html .= '</tr>';
		
	}
	

	$html .="</table></body></html>";
	$html = utf8_encode($html);
	
	create_management_report($heading,$html,$fname);	
}
	
	
$sqlt = "select * from management_report_titles where mr_id = 1";
$fwViewData['titles'] = $fwDb->queryOne($sqlt);	