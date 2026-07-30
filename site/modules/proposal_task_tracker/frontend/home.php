<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$tablebusiness = new Fw_Db_Table('business');
$tablebs = new Fw_Db_Table('business_sellers');
$table_dpn = new Fw_Db_Table('document_proposal_name');
$tableb_bc = new Fw_Db_Table('bus_customers');


$sqlH = "Select distinct bst_task_id, bst_ptt_summary from proposal_task_list
	 order by bst_order";
$colhead = $fwDb->query($sqlH);
$tottask = count($colhead);
$fwViewData['colhead'] = $colhead;


$where  = " where dpn_dr_hide = 0";
$red_light = $fwRequest->getParam('red_light', '');
if(!empty($red_light))
{
	$where .= " and dpn_dr_traffic_light = 3 ";	
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
	$where  = " where dpn_dr_hide = 0";	
 }



 $sql = "Select  dpn_bsn_id, dpn_unique_id, dpn_proposal_number from document_proposal_name " .$where;

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
	
		
	$link =  BASE_URL ."business.detail/bsn_id/".$v['dpn_bsn_id'];	
	
		// Person Responsible
		 
		$sqlpr = "Select person_responsible_detail.* from person_responsible_detail
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
			
				$taskid = $kv['bst_task_id'];
					
				    $sql2 = "Select proposal_tasks.* from proposal_tasks
					     where proposal_tasks.bt_bsn_id = ". $v['dpn_bsn_id']. "
					     And proposal_tasks.bt_task_id = " .$kv['bst_task_id'] ."
					     And proposal_tasks.bt_task_list_number = ".$v['dpn_proposal_number'];
				   
				    $data2 = $fwDb->queryOne($sql2);
				    
				   if($data2['bt_task_not_required'] == 1)
				    {
					   $taskdata[$taskid] = 'N / R'; 
				    } else {
					   $taskdata[$taskid] = changedate_d_m_y($data2['bt_completed_date']);
					   
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

$sortbydesigner = $fwRequest->getParam('sortbydesigner','');
	if($sortbydesigner):

		 foreach ($setdata2 as $key => $row) {
	   
			 $desig[$key]  = $row['designer'];
		   }
			if($ascdsc==1) {
				array_multisort($desig, SORT_ASC, $setdata2);
			} else {
				array_multisort($desig, SORT_DESC, $setdata2);
			}
	
	
		$fwViewData['list'] =  $setdata2;
	endif;
	
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
	

$sql_designer = "SELECT DISTINCT prd_name FROM person_responsible_detail
                WHERE `prd_position` = 'designer' ";
$fwViewData['des_data'] = $fwDb->query($sql_designer);


	
	
// Print Task

$bus_id = $fwRequest->getParam('print', 0);

if($bus_id > 0)
{
	
	$sql1 = "SELECT business.bsn_name FROM business WHERE bsn_id = ". $bus_id;
	$busdata = $fwDb->queryOne($sql1);
	

	$sql5 = "SELECT  business_sellers.bs_business_id,  bus_customers.bcust_fname, bus_customers.bcust_lname,
		business.bsn_id, business.bsn_name,  business.bsn_sub_status,
		business.bsn_status_sys_date, business.bsn_address
		from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
		where business.bsn_id = ".$bus_id;
		
	$b_data = $fwDb->queryOne($sql5);
	
	$name = $b_data['bcust_fname']. ' '.$b_data['bcust_lname']. ' '. $b_data['bsn_address'];
	
	
	$sqlT = "select * from proposal_task_list order by bst_order";
	$taskdata = $fwDb->query($sqlT);
	
	
	foreach($taskdata as $tk => $tv)
	{
	
		$sqlbt = "select proposal_tasks.*, users.user_name from proposal_tasks 
		Left join users on proposal_tasks.bt_completed_by = users.user_id
		where bt_task_id = " .$tv['bst_task_id']." And bt_bsn_id = ".$bus_id;		
		
		$taskdetail = $fwDb->queryOne($sqlbt);	
	
			
		$setdata3[$tk]['bst_task_id'] = $tv['bst_task_id'];
		$setdata3[$tk]['bst_task_name'] = $tv['bst_task_name'];
		$setdata3[$tk]['bt_task_not_required'] = $taskdetail['bt_task_not_required'];	
		
		if($taskdetail['bt_complete'] == 1) { $comp = 'Yes'; } else { $comp = 'No'; }
		$setdata3[$tk]['bt_complete'] = $comp;
		
		if($taskdetail['bt_complete'] == 1) {
			$setdata3[$tk]['bt_completed_date'] = $taskdetail['bt_completed_date'];
			} else {
				
			$setdata3[$tk]['bt_completed_date'] =  '';	
			}
		$setdata3[$tk]['user_name'] = $taskdetail['user_name'];	
		
	}
	
	
	$dt = date("l, d F Y");
	$html = "<html><body>";
	

	$html .= '<h1 style = "font-size:90px;text-align:center;"> Proposal Task Tracker Task Summary Report</h1><br>';
	
	$html .= "<h2>".$busdata['bsn_name']."</h2><br>";
	
	$html .= '<br><br>';
	
	$html .= '<br><table border="1" cellpadding="5">
		  <tr><th style="width:6%;"><strong>UID</strong></th><th style="width:54%;"><strong>Task Name</strong></th>
	          <th style="width:8%;"><strong>Complete</strong></th><th style="width:14%;"><strong>Complete Date</strong></th>
		  <th style="width:8%;"><strong>Not Required</strong></th> <th style="width:14%;"><strong>Completed By</strong></th></tr>';
	
	$hiadate = $hiadata['bc_cpr_hia_date'];
	$hia = changedate_y_m_d($hiadate);
	
	$a = 1;
	foreach($setdata3 as $k2 =>$v2)
	{
		$a++;	
		//$day_count='';
//		if(!empty($v2['bt_completed_date']))
//		{
//		$comp_date =  changedate_y_m_d($v2['bt_completed_date']);
//		$day_count = daysDifference($comp_date, $hia);
//		}
		
		$nr='';
		if($v2['bt_task_not_required'] == 1){
		    $nr = "N/R";
		}
		
		$html .= '<tr>';
		$html .= '<td>' . $v2['bst_task_id']. '</td>';
		$html .= '<td>' . $v2['bst_task_name']. '</td>';
		if($v2['bt_complete'] == 'Yes') {
			$html .= '<td style="background-color: #6F9;">' . $v2['bt_complete']. '</td>';
		} else
		{
			$html .= '<td>' . $v2['bt_complete']. '</td>';
		}
		$html .= '<td>' . $v2['bt_completed_date']. '</td>';
		$html .= '<td><span style="color:#F00; text-align:center;">'.$nr.'</span></td>';
		$html .= '<td>' . $v2['user_name']. '</td>';
		$html .= '</tr>';
		//if ($a == 18) {
			//$html .= '<br pagebreak="true" />';
		//}
	}
	
	$html .='</table></body></html>';
	
	$heading="Proposal Task Tracker Project Summary";
	
	
	create_proposal_report($heading,$html);	
}
	