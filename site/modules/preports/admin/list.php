<?php
$pagenum = $fwRequest->getparam('pagenum','');
$pagenum = $fwRequest->getparam('pagenum','');
$tableUserreport =  new Fw_Db_Table('user_reports');
$reportgen = $fwRequest->getParam('reportgen', '');
$fieldname = $fwRequest->getParam('field_name', '');
$fwViewData['ord'] = $fwRequest->getParam('ord', 'ASC');
if($fieldname)
	{
	unset($_SESSION['orderby']);
	$orderby = " ORDER BY ".$fieldname." ".$fwViewData['ord'];
	
	
	$_SESSION['orderby'] = $orderby;
	}elseif($_SESSION['orderby']){ $orderby = $_SESSION['orderby']; }
	else{$orderby = "ORDER BY ur_id DESC"; }

if($uprsql = $_SESSION['last_uprsql'] && !empty($pagenum))	
	{$uprsql = $_SESSION['last_uprsql'];}
	else{$uprsql = "SELECT user_reports.*, users.user_name FROM user_reports LEFT JOIN users ON users.user_id = user_reports.ur_user_id ".$orderby;}
	
if($fwViewData['ord'] == 'ASC'){$fwViewData['ord'] = 'DESC';}else{$fwViewData['ord'] = 'ASC';}
if($uprsql){ $userData = $fwDb->query($uprsql);}	

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 20;
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
    
    $sql2 =  $uprsql." ".$max;

if($sql2){ $fwViewData['list'] = $fwDb->query($sql2);}
}

$_SESSION['last_uprsql'] = $uprsql;
$fwViewData['title'] = $MODULE_PLURAL;