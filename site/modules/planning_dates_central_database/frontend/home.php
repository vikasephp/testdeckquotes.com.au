<?php
$pagenum = $fwRequest->getparam('pagenum','');

$tabledpn = new Fw_Db_Table('time_tracker');

// Save Hide
$hide = $fwRequest->getParam('hide', '');
if(!empty($hide)) {
	$key = array_keys($hide);
	$ky = $key[0];
	$hideDetail['tt_report_hide'] = $hide[$ky];
	$tabledpn->setWhere('tt_id = '.$ky);
	$hdetail = $tabledpn->updateRow($hideDetail);		
}
// End Hide

$listdata = $fwRequest->getParam($TABLE, array());
$searchaddr = $fwRequest->getParam('searchaddr', '');
$keyword = $listdata['keyword'];
$where = '' ;

$clear = $fwRequest->getParam('clear', '');

$searchkey = $fwRequest->getParam('searchkey', '');

 if($searchkey):

$where2 .= " AND business.bsn_name LIKE '%".$searchkey."%'";
	
	$_SESSION['searchkey'] = $searchkey;
	$fwViewData['searchkey']=$_SESSION['searchkey'];

elseif($_SESSION['searchkey'] && $pagenum > 0):

	$where2 .= " AND business.bsn_name LIKE '%".$_SESSION['searchkey']."%'";
	$fwViewData['searchkey']=$_SESSION['searchkey'];
endif;
   
  if($clear)
  {
	unset($_SESSION['searchkey']);
	$_SESSION['searchkey']='';
	$searchkey='';
	$fwViewData['searchkey']='';
	$where =  '';
 }

$where1 = " where time_tracker.tt_hide = 0 and time_tracker.tt_report_hide = 0";

$unhide = $fwRequest->getParam('unhide', '');
if($unhide)
{
$where1 = " WHERE time_tracker.tt_hide = 0 ";		
}

$ord =  " ORDER BY if( time_tracker.tt_due_date = ' '
       	        OR time_tracker.tt_due_date IS NULL , 1, 0 ) , STR_TO_DATE( time_tracker.tt_due_date, '%d-%m-%Y' ) ";
		
$sql = "Select business.bsn_id, business.bsn_name,  time_tracker.*, DATEDIFF(curdate(), STR_TO_DATE( tt_due_date, '%d-%m-%Y')) as 'days' from  time_tracker
        Inner join business on  time_tracker.tt_bsn_id = business.bsn_id ".$where1 .' ' .$where2
	. $ord;

if($sql){$userData = $fwDb->query($sql);}



if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 100;
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
		 $fwViewData['list'] = $fwDb->query($sql2);
	}
}

//$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Planning Dates Central Database";

