<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$tablebusiness = new Fw_Db_Table('business');
$tablebs = new Fw_Db_Table('business_sellers');
$table_dpn = new Fw_Db_Table('document_proposal_name');
$tableb_bc = new Fw_Db_Table('bus_customers');

$sqltype = "select * from design_report_type ";
$fwViewData['typeData'] = $fwDb->query($sqltype);

$sqlH = "Select  admin_doc_id, admin_doc_name from admin_document_check_list_mini
	 order by admin_doc_order ";
$colhead = $fwDb->query($sqlH);
$tottask = count($colhead);
$fwViewData['colhead'] = $colhead;

$where  = " where dpn_pdcr_hide = 0 AND STR_TO_DATE( dpn_created_date, '%d-%m-%Y' ) >= CURDATE( ) - INTERVAL 540 DAY";

$hide = $fwRequest->getParam('hide', '');

if(!empty($hide))
{
	$keyh = array_keys($hide);
	$kyh = $keyh[0];
	$hideDetail['dpn_pdcr_hide'] = $hide[$kyh];
        $table_dpn->setWhere('dpn_unique_id = '.$kyh);
	$detail = $table_dpn->updateRow($hideDetail);	
}	

$unhide = $fwRequest->getParam('unhide', '');
if(!empty($unhide))
{
$where  = " where 1 = 1";	
}

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

// End survey details

$hideupdate = $fwRequest->getParam('hideupdate', '');

if($hideupdate)
{
	$hide = $fwRequest->getParam('hide', '');
	$ke=0;
	
	foreach($hide as $k=>$v)
        {
	  if($v=='on') { $val = 1; } else { $val = 0; }
	  
	  $a = explode('_',$k);
	  	
	  if($ke == $a[0])
	  {	
	  }
	  else {
		 
		  $detail2['dpn_unique_id'] = $a[0];
		  $detail2['dpn_dr_hide'] = $val;
		  
		  if(!empty($detail2['dpn_unique_id'])) {
		 	  $table_dpn->setWhere('dpn_unique_id = '.$a[0]);
			  $detail= $table_dpn->updateRow($detail2);
		  }
	  }
	  $ke = $a[0];
	 
    }
}	

$searchdesigner = $fwRequest->getParam('searchdesigner', '');
if(!empty($searchdesigner)) {
	$design = $fwRequest->getParam('design', '');

	if(!empty($design)) {
		$_SESSION['design'] = $design;	
	}
}
 
  
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
	$_SESSION['searchkey']='';
	$searchkey='';
	$fwViewData['searchkey']='';
	unset($_SESSION['design']);
	unset($_SESSION['reno_only']);
	unset($_SESSION['type']);
	$where  = " where dpn_dr_hide = 0";	
 }



 $sql = "Select  dpn_bsn_id, dpn_unique_id, dpn_proposal_number, dpn_dr_type_new, dpn_pdcr_hide from document_proposal_name " .$where;

if($sql){$userData = $fwDb->query($sql);}


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
	            bus_customers.bcust_lname, business.bsn_id, business.bsn_name,  business.bsn_address, business.bsn_status_sys_date
	            from business_sellers 		
	            Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	            Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
	            where business.bsn_id = " .$v['dpn_bsn_id'];
		
	$busData = $fwDb->queryOne($sql_bus);	
	
	
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
	
		
	$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$v['dpn_bsn_id'];	
	
		// Person Responsible
		 
		$sqlpr = "Select person_responsible_detail.prd_name from person_responsible_detail
			  where person_responsible_detail.prd_bsn_id = ". $v['dpn_bsn_id'] . 
			" And person_responsible_detail.prd_position = 'Designer' ";
		$dataDesig = $fwDb->queryOne($sqlpr);
			
		// End Person Responsible.		

				$setdata2[$k]['chknoData'] = $v['dpn_unique_id'];
				$setdata2[$k]['bsn_id'] = $v['dpn_bsn_id'];
				$setdata2[$k]['bs_customers_id'] = $busData['bs_customers_id']; 
				$setdata2[$k]['bsn_address'] = $busData['bsn_address'];
				$setdata2[$k]['bcust_fname'] = $busData['bcust_fname'];
				$setdata2[$k]['bcust_lname'] = $busData['bcust_lname'];
				$setdata2[$k]['link'] = $link;
				$setdata2[$k]['reno_checklist_no'] = $data_rcn['dpn_unique_id'];
			        $setdata2[$k]['designer'] = $dataDesig['prd_name'];
				$setdata2[$k]['dayscount'] = $dayscount;
		
				foreach($colhead as $kh => $kv)
				{
			
				    $taskid = $kv['admin_doc_id'];
					
				    $sql2 = "Select document_check_list_mini.doc_file_name, doc_name_id , doc_not_required from document_check_list_mini
					     where document_check_list_mini.doc_bsn_id = ". $v['dpn_bsn_id']. "
					     And document_check_list_mini.doc_name_id = " .$kv['admin_doc_id'] ."
					     And document_check_list_mini.doc_checklist_number = ".$v['dpn_proposal_number'];
				   
				    $data2 = $fwDb->queryOne($sql2);
				    
				
				    
				//   if($data2['bt_task_not_required'] == 1)
//				    {
//					   $taskdata[$taskid] = 'N / R'; 
//				    } else {
//					   $taskdata[$taskid] = changedate_d_m_y($data2['bt_completed_date']);
//				   }
				  
				  
				if($data2['doc_not_required'] == 1) {
					   $taskdata[$taskid] = 'N / R'; 
				    } else {   
				   
					   if(empty($data2)) {
						  $taskdata[$taskid] = -1; 
					   }
					   elseif(!empty($data2['doc_file_name']))
					   {
						   $taskdata[$taskid] = $data2['doc_file_name'];
					   } 
					   else {
						   $taskdata[$taskid] = $data2['doc_name_id'];  
					   }
				    }
				   
				}
				
			
				
				$setdata2[$k]['task'] = $taskdata;
				$k++;
						
}
		
	$fwViewData['list'] =  $setdata2;
 }
}

foreach ($setdata2 as $key => $row) {
	   
			 $dayscoun[$key]  = $row['dayscount'];
		   }
			
			array_multisort($dayscoun, SORT_ASC, $setdata2);
			$fwViewData['list'] =  $setdata2;

	
	
	
	$fwViewData['list'] =  $setdata2;
	