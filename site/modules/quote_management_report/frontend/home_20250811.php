<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('debt_recovery_report');

$where = " WHERE 1 = 1";

$hidden = $fwRequest->getParam('hidden', '');
	if(!empty($hidden)) {
	$where = " WHERE 1 = 1";	
}

 	$clear = $fwRequest->getParam('clear', '');
			if(!empty($clear)) {
			    unset($_SESSION['address']);
				unset($_SESSION['position']);
				unset($_SESSION['due_date']);
				$where = " where 1 = 1";	
		}




//$ord =  " ORDER BY if(  dr_call_date  = ' '
       //  OR dr_call_date  IS NULL , 1, 0 ) , STR_TO_DATE( dr_call_date, '%d-%m-%Y' ) DESC";

//$ord = " Order by dr_id DESC ";

$address = $fwRequest->getParam('address', '');
if($address):

	$where .= " AND quote_management_report.qm_project LIKE '%".$address."%'";
		
	$_SESSION['address'] = $address;
	$fwViewData['address']=$_SESSION['address'];

elseif($_SESSION['address'] ):

	$where .= " AND quote_management_report.qm_project LIKE '%".$_SESSION['address']."%' ";	
	
	$fwViewData['address']=$_SESSION['address'];
endif;
  
	$position = $fwRequest->getParam('position', '');

	if (!empty($position)) {
		$_SESSION['position'] = $position;
	}
  
  
  	$due_date = $fwRequest->getParam('due_date', '');

	if (!empty($due_date)) {
		$_SESSION['due_date'] = $due_date;
		
	}
 
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE .' '.$where ;	

if($matsql){$userData = $fwDb->query($matsql);}

$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 200;
    $last = ceil($rows/$page_rows);    
    if ($pagenum <= 1)
    {
        $pagenum = 1;
    }
    elseif ($pagenum > $last)
    {
        $pagenum = $last;
    }
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
    
    $sql2 =  $matsql." ".$max;
    if($sql2){$lists= $fwDb->query($sql2);

	foreach($lists as $list):

		$listsnew[] = $list;
	endforeach;
	
	$fwViewData['list'] = $listsnew;
  }
}


foreach($listsnew as $k=>$v)
{
    $sql_1 = "select bsn_id, bsn_type,  bsn_starting_onsite_date from business where bsn_name='".$v['qm_project']."'";	
    $data = $fwDb->queryOne($sql_1);
   
    $link = BASE_URL."business.detail/bsn_id/".$data['bsn_id'];
   
    $sql_2 = "select pt_name from project_type where pt_id = ".$data['bsn_type'];
    $typedata = $fwDb->queryOne($sql_2);
	

//	$sql_2 = "select bcust_fname, bcust_lname , bcust_misc_moble from business_sellers 
//	          Inner Join business on business_sellers.bs_business_id = business.bsn_id
//			  Inner Join bus_customers on business_sellers.bs_customers_id  = bus_customers.bcust_id
//			  where business_sellers.bs_business_id = ".$data['bsn_id'];
//	$data_2 = $fwDb->queryOne($sql_2);

     $sqlcm = "Select qb_component, qb_sup_position, qb_sup_email,  qb_due_date_week, qb_due_date_sod
	           from quote_builder_component where qb_id = ".$v['qm_component'];
			   
	 $cmdetail = $fwDb->queryOne($sqlcm); 
	 
	     
     $w = $cmdetail['qb_due_date_week'];
	 $s = $cmdetail['qb_due_date_sod'];
	  
	 $dy = $w * 7;
	 $tdate = $data['bsn_starting_onsite_date'];
	
	  
	 if(!empty($tdate)) {
		if($s == 1 ) {	
			 $tdate = date('d-m-Y', strtotime($tdate .' -'.$dy.' day'));
		} else {
			$tdate = date('d-m-Y', strtotime($tdate .' +'.$dy.' day'));
		}
	 } else {
		 
		 $tdate='';
	 }
		
	$listsnew[$k]['link'] = $link;
//	$listsnew[$k]['customer'] = $data_2['bcust_fname']. ' '.$data_2['bcust_lname'];
    $listsnew[$k]['project_type'] = $typedata['pt_name'];
	$listsnew[$k]['bsn_starting_onsite_date'] = $data['bsn_starting_onsite_date'];
	$listsnew[$k]['qb_component'] = $cmdetail['qb_component'];
	$listsnew[$k]['res_position'] = $cmdetail['qb_sup_position'];
	$listsnew[$k]['res_email'] = $cmdetail['qb_sup_email'];
	$listsnew[$k]['due_date'] = $tdate;
}

$fwViewData['list'] = $listsnew;

if (!empty($position) || isset($_SESSION['position'])) {
	foreach ($listsnew as $m1 => $s1) {
		if (strpos($s1['res_position'] , $_SESSION['position']) !== false) {
			
		} else {
			unset($listsnew[$m1]);
		}
	}
}

if (!empty($due_date) || isset($_SESSION['due_date'])) {
	if($_SESSION['due_date'] == 1) 
	{
		$d1 = date('d-m-Y');
		$dts1 = strtotime($d1);
		
		foreach ($listsnew as $m2 => $s2) {
			$dts2 = strtotime($s2['due_date']);
			if ($dts1 < $dts2) {
			
				unset($listsnew[$m2]);
			}
		}
	}
	$days=0;
	if($_SESSION['due_date'] == 2) 
	{
		$d1 = date('Y-m-d');
		
		foreach ($listsnew as $m2 => $s2) {
			$d2 = changedate_y_m_d($s2['due_date']);
			$days = daysDifference($d2, $d1);
			
			if ($days < 0 OR $days >14) {
			
				unset($listsnew[$m2]);
			}
		}
	}
	
	
}

$fwViewData['list'] = $listsnew;

$fwViewData['list'] = $listsnew;
$fwViewData['title'] = $MODULE_PLURAL;

$sqlpr = "Select * from quote_builder_component";
$fwViewData['cdetail'] = $fwDb->query($sqlpr); 



