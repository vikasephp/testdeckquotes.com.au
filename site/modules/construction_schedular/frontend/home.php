<?php

$table = new Fw_Db_Table('bus_variations');
$pagenum = $fwRequest->getparamget('pagenum',0);

//$ord =  " ORDER BY if( lb_date = ' '
//        OR lb_date IS  NULL , 0, 1 ) , STR_TO_DATE( lb_date, '%d-%m-%Y' ) DESC ";

$where = " WHERE business.bsn_status like '%|3|%' and bus_customers.bcust_cip_hide = 0 ";
	   
$ord = " Order by STR_TO_DATE(business.bsn_cip_com_on_date, '%d-%m-%Y' ) DESC ";	

$matsql = "SELECT  business_sellers.bs_business_id,  business.bsn_id, business.bsn_name
	from business_sellers 		
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " 
	group by business_sellers.bs_business_id " .$ord;

if($matsql){$userData = $fwDb->query($matsql);}


if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 400;
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
  }
}



$fwViewData['list'] = $listsnew;
$fwViewData['title'] = "Construction Schedular";
