<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$tablebs = new Fw_Db_Table('business_sellers');
$user_name = $_SESSION['user']['user_name'];

$where = "WHERE 1=1 ";
$fwViewData['ran'] =  rand(100000,999999);
$keyword = $fwRequest->getParam('keyword', '');
	
if($keyword):
$where .= "AND business.bsn_name LIKE '%".$keyword."%'";
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= "AND business.bsn_name LIKE '%".$_SESSION['keyword']."%'";
	
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;
   
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
	 	

//$ord =  " ORDER BY  if(  bus_customers.bcust_vr_comp_date = ' '
//OR bus_customers.bcust_vr_comp_date IS NULL , 1, 0 ) desc , STR_TO_DATE( bus_customers.bcust_vr_comp_date, '%d-%m-%Y' ) desc ";

$ord = " Order by STR_TO_DATE( bus_customers.bcust_wcr_occ_date, '%d-%m-%Y' ) DESC ";

$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, business.bsn_id, 
        business.bsn_name, business.bsn_sub_status, bus_customers.bcust_vr_comp_date, bus_customers.bcust_vr_raw_footage,
        business.bsn_address, bcust_vr_youtube, bcust_vr_youtube2, bcust_vr_testimonial, bus_customers.bcust_vr_design_number,  bus_customers.bcust_vr_who,
	bus_customers.bcust_vr_cust_review, bus_customers.bcust_wcr_occ_date, bus_customers.bcust_wcr_occ_dt_who
	from business_sellers 		
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " 
	And  business.bsn_status like '%|4|%' Group by business.bsn_id " .$ord;
	
 
if($sql){$userData = $fwDb->query($sql);}


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

 $setdata = $fwDb->query($sql2);
 
foreach($setdata as $k => $v)
{
		
		$link = BASE_URL. "business.detail/bsn_id/".$v['bs_business_id'];	
			
		$sqluid556 = "Select business_tasks.* from business_tasks
		              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 556";
		$data556 = $fwDb->queryOne($sqluid556);
		
		$setdata2[$k]['bs_business_id'] = $v['bs_business_id'];
		$setdata2[$k]['bs_customers_id'] = $v['bs_customers_id'];
		$setdata2[$k]['bsn_address'] = $v['bsn_address'];
		$setdata2[$k]['bsn_id'] = $v['bsn_id'];
		$setdata2[$k]['link'] = $link;
		$setdata2[$k]['bcust_vr_comp_date'] = $v['bcust_vr_comp_date'];
		$setdata2[$k]['bcust_vr_raw_footage'] = $v['bcust_vr_raw_footage'];
		$setdata2[$k]['bcust_vr_youtube'] = $v['bcust_vr_youtube'];
		$setdata2[$k]['bcust_vr_youtube2'] = $v['bcust_vr_youtube2'];
		$setdata2[$k]['bcust_vr_testimonial'] = $v['bcust_vr_testimonial'];
		$setdata2[$k]['bcust_vr_design_number'] = $v['bcust_vr_design_number'];
		$setdata2[$k]['bcust_vr_cust_review'] = $v['bcust_vr_cust_review'];
		$setdata2[$k]['bcust_vr_who'] = $v['bcust_vr_who'];
		$setdata2[$k]['bcust_wcr_occ_date'] = $v['bcust_wcr_occ_date'];
		$setdata2[$k]['bcust_wcr_occ_dt_who'] = $v['bcust_wcr_occ_dt_who'];
				
}
 
 	$fwViewData['list'] =  $setdata2;
 
 }
}

$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Videos and Reviews Report";