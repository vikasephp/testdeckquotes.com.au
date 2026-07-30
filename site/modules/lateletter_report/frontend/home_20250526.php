<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('progress_payment_detail');
$send = $fwRequest->getParam('send', '');
if($send)
{
	 $keys_2 = array_keys($send);
	 $ky_2 = $keys_2[0];
	 $val_2 = $send[$ky_2];
	
	  $detail['ppd_default_int'] = $val_2;
	  $detail['ppd_send_user'] = $_SESSION['user']['user_name'];
	  $detail['ppd_send_date'] = date('d-m-Y');
	  $table->setWhere("ppd_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}

$clear_search = $fwRequest->getParam('clear_search', '');
if(!empty($clear_search)) {
	unset($_SESSION['keyword']);
	unset($keyword);
	$fwViewData['keyword']='';	
}

$where1 = " And progress_payment_detail.ppd_default_int = 1";

$show_no_send = $fwRequest->getParam('show_no_send', '');
if($show_no_send):
	$where1 = " ";
endif;

$keyword = $fwRequest->getParam('keyword', '');
if($keyword):
		$where2 .= " AND  business.bsn_name LIKE '%".$keyword."%'";
        $_SESSION['keyword'] = $keyword;
elseif($_SESSION['keyword']):
		$where2 .= " AND business.bsn_name LIKE '%".$_SESSION['keyword']."%' ";	      
endif;



$matsql = "SELECT progress_payment_detail.*, business.bsn_name, business.bsn_status from progress_payment_detail
           Inner join business on progress_payment_detail.ppd_bsn_id =  business.bsn_id
           where length(progress_payment_detail.ppd_inv_due_date)> 0 AND 
		   length(progress_payment_detail.ppd_when_payrec)<=0 AND
		   business.bsn_status Like '%|3|%' ". $where1. " ". $where2. "
		   order by progress_payment_detail.ppd_bsn_id";

if($matsql){$userData = $fwDb->query($matsql);}
$fwViewData['total'] = sizeof($userData);
if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
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
	
	//$fwViewData['list'] = $listsnew;
  }
}


foreach($listsnew as $k1=>$v1)
{
	
	
		$sql_2 = "Select bcust_fname, bcust_lname from business_sellers 
	          	Inner Join business on business_sellers.bs_business_id
			  	Inner Join bus_customers on business_sellers.bs_customers_id = bus_customers.bcust_id
			  	where business_sellers.bs_business_id = ".$v1['ppd_bsn_id'];
	
	    $custData = $fwDb->queryOne($sql_2);
	
		$status_string = "'".$v1['bsn_status']."'";
		$status='';
		
		if(strpos($status_string, '|2|') > 0) { $status .= "Planning Approvals<br>" ; }
		if(strpos($status_string, '|5|') > 0) { $status .= "Inclusions<br>" ; }
		if(strpos($status_string, '|6|') > 0) { $status .= "Pre Construction<br>" ; }
		if(strpos($status_string, '|3|') > 0) { $status .= "Construction<br>" ; }
		if(strpos($status_string, '|4|') > 0) { $status .= "Complete<br>" ; }
	
	$link = BASE_URL."business.detail/bsn_id/".$v1['ppd_bsn_id'];
	$sqlrec = "select count(*) as rec from progress_payment_detail where ppd_bsn_id = ".$v1['ppd_bsn_id'] ." And length(ppd_when_payrec)<=0";
	$data = $fwDb->queryOne($sqlrec);
	$listsnew[$k1]['records'] = $data['rec'];
	
	$d1 = date('Y-m-d');
	$d2 = changedate_y_m_d($v1['ppd_inv_due_date']);
	$d3 = changedate_y_m_d($v1['ppd_when_payrec']);
				
	if(!empty($d2) && empty($d3))
	{
		$dayscount = daysDifference($d1 , $d2);
		$listsnew[$k1]['days_late'] = $dayscount;
	}	
	$listsnew[$k1]['link'] = $link;
	$listsnew[$k1]['status'] = $status;
	$listsnew[$k1]['customer'] = $custData['bcust_fname']." ".$custData['bcust_lname'];
	
	
	
	if(!empty($v1['ppd_hia_value'])) :
		$value = str_replace('$','',$v1['ppd_hia_value']);
		$value = str_replace(',','',$value);
		$annual = ( $value * 14 ) / 100 ;
		$listsnew[$k1]['annual'] =   number_format($annual, 2, '.', ',');
		$daily = $annual / 365 ;
		$listsnew[$k1]['daily'] =   number_format($daily, 2, '.', ',');
		$total = $daily * $dayscount;
		$listsnew[$k1]['total'] =   number_format($total, 2, '.', ',');
		
		$listsnew[$k1]['total_amount'] = number_format($value + $total,2, '.', ',') ;
		
	endif;
	
	
}

$fwViewData['list'] = $listsnew;
$fwViewData['title'] = $MODULE_PLURAL;