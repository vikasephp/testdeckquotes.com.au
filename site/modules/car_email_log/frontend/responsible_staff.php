<?php
$pagenum = $fwRequest->getparam('pagenum','');

$where = " where 1=1 ";


$ord =  " ORDER BY if(  car_email_log_staff.car_date_sent  = ' '
          OR car_email_log_staff.car_date_sent  IS NULL , 1, 0 ) , STR_TO_DATE( car_email_log_staff.car_date_sent, '%d-%m-%Y' ) DESC";

if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
if(!empty($submit))
	{
		$detail = $fwRequest->getParam($TABLE, array());
		$fwViewData['detail'] = $detail;

	}elseif(empty($pagenum)){unset($_SESSION['keyword']);}	

	

 

if($_SESSION['last_tdsql'])
	{ 
		$tdsql = $_SESSION['last_tdsql'];
	}
	else
	{
		$tdsql = "SELECT  SQL_CALC_FOUND_ROWS null as row_name, car_email_log_staff.* FROM car_email_log_staff " .$where.' '. $ord;
		//$tdsql .= $ord;
	}


if($tdsql){ 
    if (!(isset($pagenum)))
    {
        $pagenum = 1;
    }
    if ($pagenum <= 1)
    {
        $pagenum = 1;
    }

    
    
    $page_rows = 30;
    
    $max = 'limit ' .($pagenum - 1) * $page_rows .',' .$page_rows;
    
   $tdsql2 =  $tdsql." ".$max;


if($tdsql2){ $setdata = $fwDb->query($tdsql2);}
  
    $total_rows = $fwDb->query('SELECT FOUND_ROWS() as rows');
	$total_rows = $total_rows[0]['rows'];
	//$rows = count($userData);
	$rows = $total_rows;
}


if(!empty($setdata))
{

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
	

}


$fwViewData['list'] = $setdata;

//db($fwViewData['list']);

$_SESSION['last_tdsql'] = $tdsql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Construction Alert Report Email Log -  Responsible Staff";