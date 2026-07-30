<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');

$where = "WHERE 1=1 ";


if($keyword):
$where .= "AND business.bsn_sub_status LIKE '%".$keyword."%'";
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= "AND business.bsn_sub_status LIKE '%".$_SESSION['keyword']."%'";
	
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;
  
    $accuracy = $fwRequest->getParam('accuracy', '');
	if(!empty($accuracy)) {
		
	    $where .= " AND business_sellers.bs_sar_accuracy   = ".$accuracy;
		$fwViewData['accuracy']=$accuracy;
	}
  
   
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
		


$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
		bus_customers.bcust_misc_email1, business.bsn_id, business.bsn_name, business.bsn_status, business.bsn_status_sys_date, 
		business.bsn_address, business_sellers.bs_sar_accuracy, business_sellers.bs_sar_acc_user, business_sellers.bs_sar_acc_date,
		business_sellers.bs_sar_ss_link, business_sellers.bs_sar_cc_link
		from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " 
		And ( business.bsn_status like '%|3|%' Or business.bsn_status like '%|6|%' ) Order By business.bsn_status_sys_date DESC";

if($sql){$userData = $fwDb->query($sql);}


$fwViewData['total'] = sizeof($userData);

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
 
foreach($setdata as $k => $v)
{
		$status_string = "'".$v['bsn_status']."'";
		$status='';
			
		if(strpos($status_string, '|3|') > 0) { $status .= "Construction<br>" ; }
		if(strpos($status_string, '|6|') > 0) { $status .= "Pre-construction" ; }
		
		if($v['bs_sar_acc_date']) {
			$ccdate = $v['bs_sar_acc_date'];
			$Statusdate = changedate_y_m_d($ccdate);
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		} else {
			$dayscount='';
		}
	
		$setdata[$k]['dayscount'] = $dayscount;
		$setdata[$k]['status'] = $status;
		
		
}
 
 	$fwViewData['list'] =  $setdata;

 }
}


$sqls = "select * from accuracy_admin";
$fwViewData['accuracy_data'] = $fwDb->query($sqls);

$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Smartsheet Accuracy Report";