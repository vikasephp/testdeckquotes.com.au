<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('business_sellers');

$fwViewData['ran'] =  rand(100000,999999);
$where = ' Where 1 = 1';
$ord='';

$user = $_SESSION['user']['user_name'];
$dt = date('d-m-Y');

$application = $fwRequest->getParam('application', '');
if($application)
{
	 $keys_2 = array_keys($application);
	 $ky_2 = $keys_2[0];
	 $val_2 = $application[$ky_2];
	
	  $detail['bs_cou_application'] = $val_2;
	  $detail['bs_cou_appl_user'] = $user;
	  $detail['bs_cou_appl_date'] = $dt;
	  
	  $table->setWhere("bs_business_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}


$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status, business.bsn_address, bus_customers.bcust_id,
	business_sellers.bs_ppr_plan_changed, business_sellers.bs_ppr_plan_changed_user
	from business_sellers 		
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " 
	And  (business.bsn_status like '%|2|%'  Or business.bsn_status like '%|5|%'  Or business.bsn_status like '%|6|%' )
	Group By business.bsn_id " .$ord ;


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
		
		$sql526 = "Select document_check_list.doc_file_name from document_check_list
			   where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 526";
		$data526 = $fwDb->queryOne($sql526);
				
		$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$v['bsn_id'];	
		
		$setdata2[$k]['bsn_id'] = $v['bsn_id'];
		$setdata2[$k]['bs_customers_id'] = $v['bs_customers_id'];
		$setdata2[$k]['bcust_id'] = $v['bcust_id'];
		$setdata2[$k]['bsn_address'] = $v['bsn_address'];
	        $setdata2[$k]['link'] = $link;
		$setdata2[$k]['status'] = $status;
		$setdata2[$k]['doc_file_name_526'] = $data526['doc_file_name'];
		
		
		$setdata2[$k]['bs_ppr_plan_changed'] = $v['bs_ppr_plan_changed'];
		$setdata2[$k]['bs_ppr_plan_changed_user'] = $v['bs_ppr_plan_changed_user'];
		//$setdata2[$k]['doc_date_uploaded'] = changedate_d_m_y($data['doc_date_uploaded']);
						
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
$fwViewData['title'] = "Plans Review Report";
