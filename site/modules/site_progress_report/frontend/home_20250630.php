<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('debt_recovery_report');

$where = " WHERE 1 = 1";

$hidden = $fwRequest->getParam('hidden', '');
	if(!empty($hidden)) {
	$where = " WHERE 1 = 1";	
}

 	$clear = $fwRequest->getParam('clear', '');
			if(!empty($clear)) {
			    unset($_SESSION['address']);
				unset($_SESSION['position']);
				unset($_SESSION['due_date']);
				$where = " where 1 = 1";	
		}




//$ord =  " ORDER BY if(  dr_call_date  = ' '
       //  OR dr_call_date  IS NULL , 1, 0 ) , STR_TO_DATE( dr_call_date, '%d-%m-%Y' ) DESC";

//$ord = " Order by dr_id DESC ";

$address = $fwRequest->getParam('address', '');
if($address):

	$where .= " AND site_progress_report.sp_project LIKE '%".$address."%'";
		
	$_SESSION['address'] = $address;
	$fwViewData['address']=$_SESSION['address'];

elseif($_SESSION['address'] ):

	$where .= " AND site_progress_report.sp_project LIKE '%".$_SESSION['address']."%' ";	
	
	$fwViewData['address']=$_SESSION['address'];
endif;
  
	
 
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE .' '.$where ;	

if($matsql){$userData = $fwDb->query($matsql);}

$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
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
	
	$fwViewData['list'] = $listsnew;
  }
}




$fwViewData['list'] = $listsnew;

	
	


$fwViewData['list'] = $listsnew;

$fwViewData['list'] = $listsnew;
$fwViewData['title'] = $MODULE_PLURAL;

$sqlpr = "Select * from site_progress_report_task";
$fwViewData['cdetail'] = $fwDb->query($sqlpr); 



