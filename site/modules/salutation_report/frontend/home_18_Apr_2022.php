<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$where = " bsn_status NOT LIKE '%|1|%' ";
$fwViewData['ran'] =  rand(100000,999999);
$search = $fwRequest->getParam('search', '');
	
if(!empty($search)) :
	$where ='';
	$sqlvar = 1; 
	$status = $fwRequest->getParam('status', '');
	$data='';
	foreach($status as $k => $v)
	{
		$data .= " business.bsn_status like '%|".$v."|%'". " OR ";
		$data3 .= $v .",";
	}
	
	$fwViewData['data3'] = $data3;
	$where .= $data;	
	$where .= "business.bsn_status like '%" .'X' ."%'";
	
endif;
   
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
	
	
	$sql = " Select distinct bsn_id from business where ".$where;
	
	$data =  $fwDb->query($sql);

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
	
		$bsdata = $fwDb->query($sql2);
		$a=0;
		foreach($bsdata as $k2 => $v2)
		{
			
			$sql3 = "SELECT  business_sellers.bs_business_id, bus_customers.bcust_fname, 
			bus_customers.bcust_lname, business.bsn_id, business.bsn_name, business.bsn_proj_salu_who,
			business.bsn_proj_salu, bsn_status, business.bsn_proj_salu_date
			from business_sellers 		
			Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			Inner Join business ON business_sellers.bs_business_id = business.bsn_id  
			where  business.bsn_id = " .$v2['bsn_id'];
			
			$link = BASE_URL."business.detail/bsn_id/".$v2['bsn_id'];
			
			$setdata = $fwDb->query($sql3);
			
			foreach($setdata as $k => $v)
			{
				
				$st = explode("|",$v['bsn_status']);
				$sqlsts = "Select st_name from busness_status where st_id = ".$st[1];
				$stdata = $fwDb->queryOne($sqlsts);
				
				if($k==0) {
					$setdata2[$a]['bsn_name'] = $v['bsn_name'];
					$setdata2[$a]['customer_1'] = $v['bcust_fname'] ." ".$v['bcust_lname'];
					$setdata2[$a]['salutation'] = $v['bsn_proj_salu'];
					$setdata2[$a]['status'] = $stdata['st_name'];
					$setdata2[$a]['link'] = $link;
					$setdata2[$a]['cdate'] = $v['bsn_proj_salu_date'];
					
				}
				if($k==1) {
					$setdata2[$a]['bsn_name'] = $v['bsn_name'];
					$setdata2[$a]['customer_2'] = $v['bcust_fname'] ." ".$v['bcust_lname'];
					$setdata2[$a]['salutation'] = $v['bsn_proj_salu'];
					$setdata2[$a]['status'] = $stdata['st_name'];
					$setdata2[$a]['link'] = $link;
					$setdata2[$a]['cdate'] = $v['bsn_proj_salu_date'];
				}
				
				if($k==2) {
					$setdata2[$a]['bsn_name'] = $v['bsn_name'];
					$setdata2[$a]['customer_3'] = $v['bcust_fname'] ." ".$v['bcust_lname'];
					$setdata2[$a]['salutation'] = $v['bsn_proj_salu'];
					$setdata2[$a]['status'] = $stdata['st_name'];
					$setdata2[$a]['link'] = $link;
					$setdata2[$a]['cdate'] = $v['bsn_proj_salu_date'];
				}
				
				if($k==3) {
					$setdata2[$a]['bsn_name'] = $v['bsn_name'];
					$setdata2[$a]['customer_4'] = $v['bcust_fname'] ." ".$v['bcust_lname'];
					$setdata2[$a]['salutation'] = $v['bsn_proj_salu'];
					$setdata2[$a]['status'] = $stdata['st_name'];
					$setdata2[$a]['link'] = $link;
					$setdata2[$a]['cdate'] = $v['bsn_proj_salu_date'];
				}
			}
	
				$a++;	
		}
	
		
		$fwViewData['list'] =  $setdata2;
	  }
}

//$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Salutation Report";
$sqlse = "Select * from busness_status";
$fwViewData['statuslist'] = $fwDb->query($sqlse);
