<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$tablebusiness = new Fw_Db_Table('business');
$tablebs = new Fw_Db_Table('business_sellers');
$table_dpn = new Fw_Db_Table('document_proposal_name');
$tableb_bc = new Fw_Db_Table('bus_customers');

$tablela = new Fw_Db_Table('design_report_last_audit');

$sqltype = "select * from design_report_type ";
$fwViewData['typeData'] = $fwDb->query($sqltype);

$where  = " where dpn_dr_hide = 0 ";

$searchtype = $fwRequest->getParam('searchtype', '');
if(!empty($searchtype) || isset($_SESSION['type']))
{
	$type = $fwRequest->getParam('type', '');
	if(empty($type))
	{
		$type = $_SESSION['type'];
	}
	
	$where .= " and dpn_dr_type_new =  ".$type;
	
	if(!empty($type)) {
		$_SESSION['type'] = $type;	
	}	
}


$fwViewData['ran'] =  rand(100000,999999);

$incpr = $fwRequest->getParam('incpr', '');
if($incpr)
{	
	$keyi = array_keys($incpr);
	$kyi = $keyi[0];
	$incprDetail['bsn_showin_cpr'] = $incpr[$kyi];
	$tablebusiness->setWhere('bsn_id = '.$kyi);
	$detail = $tablebusiness->updateRow($incprDetail);
}

$go_ahead = $fwRequest->getParam('go_ahead', '');
if($go_ahead)
{	
	$keyi = array_keys($go_ahead);
	$kyi = $keyi[0];
	$goDetail['dpn_dcr_go_ahead'] = $go_ahead[$kyi];
	$table_dpn->setWhere('dpn_unique_id = '.$kyi);
	$detail = $table_dpn->updateRow($goDetail);
}

// Latest Css Start
$dpn_dcr_latest_css = $fwRequest->getParam('dpn_dcr_latest_css', '');

if(!empty($dpn_dcr_latest_css))
{
	$keyla = array_keys($dpn_dcr_latest_css);
	$kyla = $keyla[0];
	$cssDetail['dpn_dcr_latest_css'] = $dpn_dcr_latest_css[$kyla];
	$cssDetail['dpn_dcr_latest_css_user'] = $_SESSION['user']['user_name'];
        $table_dpn->setWhere("dpn_unique_id =". $kyla);
	$data = $table_dpn->updateRow($cssDetail);
}
// Latest Css Ends



$hide = $fwRequest->getParam('hide', '');

if(!empty($hide))
{
	$keyh = array_keys($hide);
	$kyh = $keyh[0];
	$hideDetail['dpn_dr_hide'] = $hide[$kyh];
        $table_dpn->setWhere('dpn_unique_id = '.$kyh);
	$detail = $table_dpn->updateRow($hideDetail);	
}	

$searchdesigner = $fwRequest->getParam('searchdesigner', '');
if(!empty($searchdesigner)) {
	$design = $fwRequest->getParam('design', '');

	if(!empty($design)) {
		$_SESSION['design'] = $design;	
	}
}
 

$reno_only = $fwRequest->getParam('reno_only', '');
if(!empty($reno_only)) {
		$_SESSION['reno_only'] = $reno_only;	
	}

   
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
		
$ord = " Order By document_check_list.doc_date_uploaded DESC ";


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
	$_SESSION['searchkey']='';
	$searchkey='';
	$fwViewData['searchkey']='';
	unset($_SESSION['design']);
	unset($_SESSION['reno_only']);
	isset($_SESSION['type']);
	$where  = " where dpn_dr_hide = 0";	
 }

 $sql = "Select  dpn_bsn_id, dpn_unique_id, dpn_budget, dpn_dr_survey_imp_user, dpn_dr_survey_date, dpn_dr_budg_user, 
	  dpn_dr_estimate_cost, dpn_dr_likely_value, dpn_dcr_value, dpn_dr_hide,  dpn_dr_sqm,
	  dpn_dr_last_audit, dpn_dr_erc, dpn_dr_r_plus_e, dpn_dr_ebc_comm, dpn_dr_erc_comm,
	  dpn_dr_likey_comm, dpn_dcr_go_ahead, dpn_dcr_latest_css, dpn_dcr_latest_css_user,dpn_dcr_ranking,
	  dpn_proposal_number, dpn_customer_designer
	  from document_proposal_name " .$where;

if($sql){$userData = $fwDb->query($sql);}



$sqltot = "Select dpn_bsn_id from document_proposal_name ". $where ." and dpn_dcr_go_ahead" ;
$totdata = $fwDb->query($sqltot);
$tc = sizeof($totdata);


$fwViewData['tot'] = $tc;


$sqlval = "select sum(dpn_dcr_value) as valtot from document_proposal_name ". $where;

$fwViewData['valuedata'] = $fwDb->queryOne($sqlval);


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
	 
	 	
$sql_bus = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
           bus_customers.bcust_misc_email1, bus_customers.bcust_misc_email2, bus_customers.bcust_misc_moble, bus_customers.bcust_misc_business,
	   bus_customers.bcust_misc_home,  business.bsn_id, business.bsn_name,  business.bsn_address,
	   business.bsn_address_same, business.bsn_showin_cpr
	   from business_sellers 		
	   Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	   Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
	   where business.bsn_id = " .$v['dpn_bsn_id'];
		
	$busData = $fwDb->queryOne($sql_bus);	
		
	$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$v['dpn_bsn_id'];	
	
	
	$sql45 = "Select doc_date_uploaded from document_check_list
	           where doc_name_id = 45 and doc_bsn_id = ".$v['dpn_bsn_id'];
	
	$data45 = $fwDb->queryOne($sql45);
		
		$dayscount='';
			
		$Statusdate = changedate_y_m_d($data45['doc_date_uploaded']);
		
		if(!empty($Statusdate))
		{
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		}
		
	$sqlmp = "SELECT document_check_list_mini.doc_file_name, doc_date_uploaded, document_proposal_name.dpn_unique_id
			FROM document_proposal_name
			inner join document_check_list_mini ON ( document_proposal_name.dpn_bsn_id = document_check_list_mini.doc_bsn_id
			AND document_proposal_name.dpn_proposal_number = document_check_list_mini.doc_checklist_number )
			WHERE doc_name_id =20
			AND document_proposal_name.dpn_bsn_id = " .  $v['dpn_bsn_id'] ." and doc_checklist_number = " .$v['dpn_proposal_number'];	
		
	$mpData = $fwDb->queryOne($sqlmp);

		// Renovation Checklist Number End

   
		
		$plandaycount ='';
		if($mpData['doc_date_uploaded'] !== '0000-00-00 00:00:00')
		{
			$curdate_y_m_d = date('Y-m-d');
			$plandaycount = daysDifference($curdate_y_m_d, $mpData['doc_date_uploaded']);
		}
		

				$setdata2[$k]['chknoData'] = $v['dpn_unique_id'];
				$setdata2[$k]['bsn_id'] = $v['dpn_bsn_id'];
				$setdata2[$k]['bs_customers_id'] = $busData['bs_customers_id']; 
				$setdata2[$k]['bsn_address'] = $busData['bsn_address'];
				$setdata2[$k]['bcust_fname'] = $busData['bcust_fname'];
				$setdata2[$k]['bcust_lname'] = $busData['bcust_lname'];
				$setdata2[$k]['bcust_misc_email1'] = $busData['bcust_misc_email1'];
				$setdata2[$k]['bcust_misc_email2'] = $busData['bcust_misc_email2'];
				$setdata2[$k]['bcust_misc_moble'] = $busData['bcust_misc_moble'];
				$setdata2[$k]['bcust_misc_business'] = $busData['bcust_misc_business'];
				$setdata2[$k]['bcust_misc_home'] = $busData['bcust_misc_home'];
				$setdata2[$k]['bsn_showin_cpr'] = $busData['bsn_showin_cpr'];
				$setdata2[$k]['link'] = $link;
				$setdata2[$k]['reno_checklist_no'] = $data_rcn['dpn_unique_id'];
				$setdata2[$k]['dayscount'] = $dayscount;
				
				$setdata2[$k]['lmp_date'] = changedate_d_m_y($mpData['doc_date_uploaded']);
				$setdata2[$k]['lmp_doc_file_name'] =$mpData['doc_file_name'];
				$setdata2[$k]['plandaycount'] = $plandaycount;
				
				
				$k++;
				
		
}
 		

	$fwViewData['list'] =  $setdata2;
 	
 }
}


		foreach ($setdata2 as $key => $row) {
	   
			 $desig[$key]  = $row['dayscount'];
		   }
			
				array_multisort($desig, SORT_ASC, $setdata2);
			
				//array_multisort($desig, SORT_DESC, $setdata2);
			
	
	
		$fwViewData['list'] =  $setdata2;




	
	if(!empty($design) || isset($_SESSION['design'])) {
		foreach($setdata2 as $m1 => $s1)
		{
			if($s1['designer'] <> $_SESSION['design']) 
			{
				unset($setdata2[$m1]);	 
			}
		}
	}
	

	
	
	$fwViewData['list'] =  $setdata2;
	
	
$print = $fwRequest->getParam('print', 0);

if($print)
{
	$heading = "Design Conversion Report";
	
	$html = "<html>";
	$html .= '<table cellpadding="10">';
	$html .= '<tr>';
	$html .= '<th style="width:9%;">Checklist Number</th><th style="width:34%;">Customer Details</th>
	          <th style="width:10%;">Day Count</th><th style="width:18%;">Designer</th>
		  <th style="width:14%;">Value</th> <th style="width:15%;">Latest Merged Plan</th>';
	$html .= '</tr>';	
	
	foreach($setdata2 as $k=>$v)
	{
		$html .= '<tr nobr="true">';
		$html .= '<td>' . $v['chknoData']. '</td>';	
		$html .= '<td>' . $v['bcust_fname']. ' '.$v['bcust_lname'].'<br>'. $v['bsn_address'].'</td>';
		$html .= '<td>' . $v['dayscount']. '</td>';
		$html .= '<td>' . $v['dpn_customer_designer']. '</td>';
		$html .= '<td>$' . number_format($v['dpn_dcr_value'],2). '</td>';
		$html .= '<td>' . $v['lmp_date'].'</td>';
	
		$html .= '</tr>';
	
	}
	$html .= '</table></html>'; 
	$fname = "Test";
	create_conversion_pdf($heading, $html, $fname);
}
	

$sqldp = "select * from design_profit where dp_id = 1";
$dpdata = $fwDb->queryOne($sqldp);
$fwViewData['dpdata'] = $dpdata;
