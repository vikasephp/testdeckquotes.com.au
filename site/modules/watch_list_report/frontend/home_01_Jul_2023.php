<?php
$pagenum = $fwRequest->getparam('pagenum','');
$search = $fwRequest->getParam('search', '');
$tablebusiness = new Fw_Db_Table('business');
$table = new Fw_Db_Table('business_sellers');
$searchaddr = $fwRequest->getParam('searchaddr', '');

$ord = " Order By business.bsn_status_sys_date DESC ";

$sortby_ranking = $fwRequest->getParam('sortby_ranking', '');
if($sortby_ranking)
{
 	$ord = " order by business.bsn_rating ";
}


$where = " Where business.bsn_watch_list = 1 ";
if(!empty($searchaddr)) {
	$searchkey = $fwRequest->getParam('searchkey', '');
}

// Doc Sent Start
$docsign = $fwRequest->getParam('docsign', '');

if(!empty($docsign))
{
	
	$keyla = array_keys($docsign);
	$kyla = $keyla[0];
	$signDetail['bsn_wlr_docsign_sent'] = $docsign[$kyla];
	$signDetail['bsn_wlr_docsign_user'] = date('d-m-Y');
	$signDetail['bsn_wlr_docsign_date'] = $_SESSION['user']['user_name'];
        $tablebusiness->setWhere("bsn_id =". $kyla);
	$data = $tablebusiness->updateRow($signDetail);
}
// Doc Sent Ends

// Sunday Appoint to be booked
$sundayappt = $fwRequest->getParam('sundayappt', '');

if(!empty($sundayappt))
{
	$keyla = array_keys($sundayappt);
	$kyla = $keyla[0];
	$signDetail['bsn_wlr_sunday_appt'] = $sundayappt[$kyla];
	$signDetail['bsn_wlr_sunappt_user'] = date('d-m-Y');
	$signDetail['bsn_wlr_sunappt_date'] = $_SESSION['user']['user_name'];
        $tablebusiness->setWhere("bsn_id =". $kyla);
	$data = $tablebusiness->updateRow($signDetail);
}
// Sunday Appoint to be booked


// Sunday  booked
$sunbooked = $fwRequest->getParam('sunbooked', '');

if(!empty($sunbooked))
{
	$keyla = array_keys($sunbooked);
	$kyla = $keyla[0];
	$signDetail['bsn_wlr_sunbook'] = $sunbooked[$kyla];
	$signDetail['bsn_wlr_sunbook_user'] = date('d-m-Y');
	$signDetail['bsn_wlr_sunbook_date'] = $_SESSION['user']['user_name'];
        $tablebusiness->setWhere("bsn_id =". $kyla);
	$data = $tablebusiness->updateRow($signDetail);
}
// Sunday booked

//Par Paperwork courieried
$couriered = $fwRequest->getParam('couriered', '');
if($couriered)
{
	 foreach($couriered as $kp=>$vp)
	 {
		  $id = $kp; 
	 }
	
	  $ppcdetail['bs_wlr_par_couriered'] = $vp;
	  $ppcdetail['bs_wlr_par_cour_date'] = date('d-m-Y');
	  $ppcdetail['bs_wlr_par_cour_user'] = $_SESSION['user']['user_name'];
	  
	  $table->setWhere("bs_business_id = ".$id);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($ppcdetail);
	  }
}
//End 

// Save HIA Sign Date 
$latestcss_date = $fwRequest->getParam('bs_wlr_latest_css', '');
if(!empty($latestcss_date)) {
	
	
	foreach($latestcss_date as $kc=>$vc)
	{
		$cssDetail['bs_wlr_latest_css'] = $vc;
		$cssDetail['bs_wlr_latest_css_user'] = $_SESSION['user']['user_name'];
		$table->setWhere('bs_business_id = '.$kc);
		$detail = $table->updateRow($cssDetail);		
	}
}
//End HIA Sign Date 


// Remove From Report
$watch = $fwRequest->getParam('watch', '');

if(!empty($watch))
{
	$keyla = array_keys($watch);
	$kyla = $keyla[0];
	$waDetail['bsn_watch_list'] = $watch[$kyla];
        $tablebusiness->setWhere("bsn_id =". $kyla);
	$data = $tablebusiness->updateRow($waDetail);
}
// Sunday booked

$clear = $fwRequest->getParam('clear', '');

if($clear)
{
	unset($_SESSION['keyword']);
	unset($_SESSION['plreport_not']);
	unset($_SESSION['searchkey']);
}


$fwViewData['ran'] =  rand(100000,999999);
	
   
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
        bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2,bus_customers.bcust_misc_moble,bus_customers.bcust_misc_business,
	bus_customers.bcust_misc_home,business.bsn_advert_text,  business.bsn_id, business.bsn_name, business.bsn_rating,
	business.bsn_sub_status, business.bsn_status_sys_date, business.bsn_address , business.bsn_rating, business.bsn_watch_list,
	business_sellers.bs_wlr_latest_css, business_sellers.bs_wlr_latest_css_user, business_sellers.bs_wlr_par_couriered,
	business_sellers.bs_wlr_par_cour_date, business.bsn_wlr_docsign_sent, business.bsn_wlr_docsign_user, business.bsn_wlr_docsign_date,
	business.bsn_wlr_sunday_appt, business.bsn_wlr_sunappt_user, business.bsn_wlr_sunappt_date, business.bsn_wlr_sunbook,
	business.bsn_wlr_sunbook_user, business.bsn_wlr_sunbook_date, business_sellers.bs_wlr_par_cour_user,business.bsn_wlr_type
	from business_sellers 		
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " ".$ord;


if($sql){$userData = $fwDb->query($sql);}

$fwViewData['total'] = sizeof($userData);
$total2 = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 300;
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
 

 }
}


foreach($setdata as $k => $v)
{

		$link = $BASE_URL ."business.detail/bsn_id/".$v['bsn_id'];	
		
		$ccdate = $v['bsn_status_sys_date'];
		$Statusdate = changedate_y_m_d($ccdate);
		$curdate_y_m_d = date('Y-m-d');
		$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		
		
		$sql45 = "Select doc_file_name, doc_date_uploaded from document_check_list where  doc_bsn_id  = ". $v['bsn_id']
		         . " And doc_name_id = 45 ";
		$data45 = $fwDb->queryOne($sql45);
		
		$sql44 = "Select doc_file_name, doc_date_uploaded from document_check_list where  doc_bsn_id  = ". $v['bsn_id']
		         . " And doc_name_id = 44 ";
		$data44 = $fwDb->queryOne($sql44);
		
		$sql485 = "Select doc_file_name, doc_date_uploaded from document_check_list where  doc_bsn_id  = ". $v['bsn_id']
		         . " And doc_name_id = 485 ";
		$data485 = $fwDb->queryOne($sql485);
		
		$sql384 = "Select doc_file_name, doc_date_uploaded from document_check_list where  doc_bsn_id  = ". $v['bsn_id']
		         . " And doc_name_id = 384 ";
		$data384 = $fwDb->queryOne($sql384);
		
		
		$sql614 = "Select doc_file_name, doc_date_uploaded from document_check_list where  doc_bsn_id  = ". $v['bsn_id']
		         . " And doc_name_id = 614 ";
		$data614 = $fwDb->queryOne($sql614);
		
		$lfd = "Select max(sf_date) as last_followup_date from  sales_followup where sf_pid = ".$v['bsn_id'];
		$lfdData = $fwDb->queryOne($lfd);
		
		$fdt = "Select max(sf_date) as sf_date from  sales_followup where sf_pid = ".$v['bsn_id'];
		$feedDateData = $fwDb->queryOne($fdt);
		
		$sqlrm = "Select recorded_meeting.* from recorded_meeting
			  where recorded_meeting.rm_bus_id = ". $v['bsn_id'];
		$datarm = $fwDb->query($sqlrm);
		
		$setdata2[$k]['bsn_id'] = $v['bsn_id'];
		$setdata2[$k]['bcust_fname'] = $v['bcust_fname'];
		$setdata2[$k]['bcust_lname'] = $v['bcust_lname'];
		$setdata2[$k]['bcust_misc_email1'] = $v['bcust_misc_email1'];
		$setdata2[$k]['bcust_misc_home'] = $v['bcust_misc_home'];
		$setdata2[$k]['bcust_misc_moble'] = $v['bcust_misc_moble'];
		$setdata2[$k]['bcust_misc_business'] = $v['bcust_misc_business'];
		$setdata2[$k]['bsn_address'] = $v['bsn_address'];
		$setdata2[$k]['bsn_rating'] = $v['bsn_rating'];
		$setdata2[$k]['link'] = $link;
		$setdata2[$k]['dayscount'] = $dayscount;
		$setdata2[$k]['lastfoldt'] = changedate_d_m_y($lfdData['last_followup_date']);
		$setdata2[$k]['status'] = $v['bsn_sub_status'];
		$setdata2[$k]['budget'] = $v['bsn_advert_text'];
		$setdata2[$k]['checklist45'] =  changedate_d_m_y($data45['doc_date_uploaded']);
		$setdata2[$k]['checklist44'] =  changedate_d_m_y($data44['doc_date_uploaded']);
		$setdata2[$k]['doc_485'] = $data485['doc_file_name'];
		$setdata2[$k]['checklist485'] =  changedate_d_m_y($data485['doc_date_uploaded']);
		$setdata2[$k]['doc_384'] = $data384['doc_file_name'];
		$setdata2[$k]['checklist384'] =  changedate_d_m_y($data384['doc_date_uploaded']);
		$setdata2[$k]['doc_614'] = $data614['doc_file_name'];
		$setdata2[$k]['checklist614'] =  changedate_d_m_y($data614['doc_date_uploaded']);
		$setdata2[$k]['bs_wlr_latest_css'] = $v['bs_wlr_latest_css'];
		$setdata2[$k]['bs_wlr_latest_css_user'] = $v['bs_wlr_latest_css_user'];
		$setdata2[$k]['bs_wlr_par_couriered'] = $v['bs_wlr_par_couriered'];
		$setdata2[$k]['bs_wlr_par_cour_date'] = $v['bs_wlr_par_cour_date'];
		$setdata2[$k]['bsn_wlr_docsign_sent'] = $v['bsn_wlr_docsign_sent'];
		$setdata2[$k]['bsn_wlr_docsign_user'] = $v['bsn_wlr_docsign_user'];
		$setdata2[$k]['bsn_wlr_docsign_date'] = $v['bsn_wlr_docsign_date'];
		
		$setdata2[$k]['bsn_wlr_sunday_appt'] = $v['bsn_wlr_sunday_appt'];
		$setdata2[$k]['bsn_wlr_sunappt_user'] = $v['bsn_wlr_sunappt_user'];
		$setdata2[$k]['bsn_wlr_sunappt_date'] = $v['bsn_wlr_sunappt_date'];
		
		$setdata2[$k]['bsn_wlr_sunbook'] = $v['bsn_wlr_sunbook'];
		$setdata2[$k]['bsn_wlr_sunbook_user'] = $v['bsn_wlr_sunbook_user'];
		$setdata2[$k]['bsn_wlr_sunbook_date'] = $v['bsn_wlr_sunbook_date'];
		$setdata2[$k]['bs_wlr_par_cour_user'] = $v['bs_wlr_par_cour_user'];
		$setdata2[$k]['datarm'] = $datarm;
		$setdata2[$k]['sf_date'] = changedate_d_m_y($feedDateData['sf_date']);
		$setdata2[$k]['bsn_wlr_type'] = $v['bsn_wlr_type'];
		
		
}
 $fwViewData['list'] =  $setdata2;


$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Watch List";

$sqltype = "select * from watch_list_type ";
$fwViewData['type'] = $fwDb->query($sqltype);
