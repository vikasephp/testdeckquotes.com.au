<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('business_sellers');

$fwViewData['ran'] =  rand(100000,999999);
$where = ' Where business_sellers.bs_xray_old = 1';
$ord='';

$user = $_SESSION['user']['user_name'];
$dt = date('d-m-Y');

$move = $fwRequest->getParam('move', '');
if($move)
{
	 $keys_2 = array_keys($move);
	 $ky_2 = $keys_2[0];
	 $val_2 = $move[$ky_2];
	
	  $detail['bs_xray_old'] = $val_2;
	  
	  $table->setWhere("bs_business_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}

$last_audit = $fwRequest->getParam('last_audit', '');
if($last_audit)
{
	 $keys_2 = array_keys($last_audit);
	 $ky_2 = $keys_2[0];
	 $val_2 = $last_audit[$ky_2];
	
	  $detail['bs_xry_last_audit'] = $val_2;
	  $detail['bs_xry_last_audit_user'] = $_SESSION['user']['user_name'];
	  $detail['bs_xry_last_audit_date'] = date('d-m-Y');
	  
	  $table->setWhere("bs_business_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}



$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status, business.bsn_address, bus_customers.bcust_id,  
		business_sellers.bs_xray_old , business_sellers.bs_xry_last_audit , business_sellers.bs_xry_last_audit_user,  
		business_sellers.bs_xry_last_audit_date, business_sellers.bs_xry_add_to_deposite , business.bsn_status_date
	    from business_sellers 		
	    Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	    Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " 
	    And  (business.bsn_status like '%|2|%'  Or business.bsn_status like '%|5|%'  Or business.bsn_status like '%|6|%' 
		   Or business.bsn_status like '%|3|%'  Or business.bsn_status like '%|4|%' )
	       Group By business.bsn_id order by  business.bsn_status_date DESC"  ;




if($sql){$userData = $fwDb->query($sql);}
$total2 = sizeof($userData);
$fwViewData['active'] =  $total2;

$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

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
 
foreach($setdata2 as $k => $v)
{
		
		$status_string = "'".$v['bsn_status']."'";
		$status='';
		
		if(strpos($status_string, '|2|') > 0) { $status .= "Planning Approvals<br>" ; }
		if(strpos($status_string, '|5|') > 0) { $status .= "Inclusions<br>" ; }
		if(strpos($status_string, '|6|') > 0) { $status .= "Pre Construction" ; }
		if(strpos($status_string, '|3|') > 0) { $status .= "Construction" ; }
		if(strpos($status_string, '|4|') > 0) { $status .= "Complete" ; }
		
		$sqltot = "select ppd_hia_value, ppd_value, ppd_when_payrec, ppd_inv_due_date from  progress_payment_detail where ppd_bsn_id = ".$v['bsn_id'];
		$totdata = $fwDb->query($sqltot);
		
		
		$total1 = 0;
		$total2 = 0;
		foreach($totdata as $kt=>$vt)
		{
			$value1=0;
			if(!empty($vt['ppd_hia_value'])) {
				$value1 = $vt['ppd_hia_value'];
				$value1 = str_replace('$','',$value1);
				$value1 = str_replace(',','',$value1);
				$total1 = $total1 + $value1;	
			}
			
			$value2=0;
			if(!empty($vt['ppd_value'])) {
				$value2 = $vt['ppd_value'];
				$value2 = str_replace('$','',$value2);
				$value2 = str_replace(',','',$value2);
				$total2 = $total2 + $value2;	
			}
		}
		
		$balance = $total1 - $total2;
				
		$link = $BASE_URL."business.detail/bsn_id/".$v['bsn_id'];	
		
		$dayscount='';
			
		$Statusdate = changedate_y_m_d($v['bsn_status_date']);
		
		if(!empty($Statusdate))
		{
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		}
		
		
		$setdata2[$k]['bsn_id'] = $v['bsn_id'];
		$setdata2[$k]['bs_customers_id'] = $v['bs_customers_id'];
		$setdata2[$k]['bcust_id'] = $v['bcust_id'];
		$setdata2[$k]['bsn_address'] = $v['bsn_address'];
	    $setdata2[$k]['link'] = $link;
		$setdata2[$k]['status'] = $status;
		$setdata2[$k]['hia_value'] =   number_format($total1, 2, '.', ',');
		$setdata2[$k]['total_value'] = number_format($total2, 2, '.', ',');
		$setdata2[$k]['balance'] = number_format($balance, 2, '.', ',');
		
		$setdata2[$k]['bs_ppr_plan_changed'] = $v['bs_ppr_plan_changed'];
		$setdata2[$k]['bs_ppr_plan_changed_user'] = $v['bs_ppr_plan_changed_user'];
		$setdata2[$k]['dayscount'] = $dayscount;
						
}
 
 	$filter_comp = $fwRequest->getParam('filter_comp', '');
	if(!empty($filter_comp)) {
		foreach($setdata2 as $m1 => $s1)
		{
			$pos = strpos($s1['status'] , 'Complete' ,0 ) ;
			if(!is_numeric($pos)) {
				unset($setdata2[$m1]);	 
			}
		}
	}
	
	$filter_const = $fwRequest->getParam('filter_const', '');
	if(!empty($filter_const)) {
		foreach($setdata2 as $m1 => $s1)
		{
			$pos = strpos($s1['status'] , 'Construction' ,0 ) ;
			if(!is_numeric($pos)) {
				unset($setdata2[$m1]);	 
			}
		}
	}
	
 
  	$fwViewData['list'] =  $setdata2;
			
 }
}

$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "XRay Report Old";
