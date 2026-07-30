<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$fwViewData['title'] = "Construction Calendar Update Report";
$where = " where 1 = 1";

$clear = $fwRequest->getParam('clear', '');

if(!empty($clear)) {
	unset($_SESSION['keyword']);
	unset($keyword);
	$fwViewData['keyword']='';	
}
	
if($keyword):
$where .= " AND  construction_cal_update_report.cc_project_address  LIKE '%".$keyword."%'";
	
	    $_SESSION['keyword'] = $keyword;
	    $fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

$where .= " AND construction_cal_update_report.cc_project_address  LIKE '%".$_SESSION['keyword']."%' ";	
	
	    $fwViewData['keyword']=$_SESSION['keyword'];
endif;
 
  
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}

$ord = " Order by STR_TO_DATE(construction_cal_update_report.cc_date_time, '%d-%m-%Y' ) DESC ";
		
$sql = "SELECT  * from construction_cal_update_report " . $where. " ".$ord;

$userData = $fwDb->query($sql);


if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 50;
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

 $setdata = $fwDb->query($sql2);
 $fwViewData['list'] =  $setdata;
 }
