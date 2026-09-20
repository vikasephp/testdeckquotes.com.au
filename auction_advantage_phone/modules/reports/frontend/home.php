<?php
$pagenum = $fwRequest->getparam('pagenum','');
$tablePages = new Fw_Db_Table($TABLE);
$tableUserreport =  new Fw_Db_Table('user_reports');
$reportgen = $fwRequest->getParam('reportgen', '');
$fieldname = $fwRequest->getParam('field_name', '');
$fwViewData['ord'] = $fwRequest->getParam('ord', 'ASC');
$user_id = $_SESSION['user']['user_id'];

//DB(generate_All_user_production_report(1));
$curusergroup = array_keys($_SESSION['user']['::groups::']);
if($curusergroup[0] !== 'Administrators')
	{$fwViewData['usergroup'] = $curusergroup[0]; $where = " WHERE ur_user_id = ".$user_id;}else{$where = "WHERE 1=1 "; }
if($reportgen)
    { 
	
	$filters =  $fwRequest->getParam('filter', array());
	
	$report_type  = $filters['report_type'];
	if($filters['gen_user_id']){ $gen_user_id  = $filters['gen_user_id'];}else{$gen_user_id  = $user_id;}
	
	
	if($report_type == 3)
		{
	$fromdate =  $filters['fromdate'];
	$todate =  $filters['todate'];
	if($fromdate && $todate){
	$where .= " AND user_reports.ur_timestamp BETWEEN '".changedate_y_m_d($fromdate)."' AND '".changedate_y_m_d($todate)."'";
	}
		}elseif($report_type !== 'all'){
		$where  .= " AND user_reports.ur_type = ".$report_type;
		unset($filters['fromdate']);
		unset($filters['todate']);
		}else{
		unset($filters['fromdate']);
		unset($filters['todate']);
		}
		
	if($filters['ur_feature'])	
		{
			$where .= " AND user_reports.ur_feature = ".$filters['ur_feature'];
		}
		
$fwViewData['filters'] = $filters;		
if($gen_user_id !== 'all'){	$where .= " AND user_reports.ur_user_id = ".$gen_user_id;}
	}


if($pagenum && $_SESSION['filters']){$fwViewData['filters'] = $_SESSION['filters'];}else{ unset($_SESSION['filters']);}

if($user_id){

if($fieldname)
	{
	unset($_SESSION['orderby']);
	$orderby = " ORDER BY ".$fieldname." ".$fwViewData['ord'];
	$_SESSION['orderby'] = $orderby;
	}elseif($_SESSION['orderby']){ $orderby = $_SESSION['orderby']; }
	else{$orderby = "ORDER BY ur_id DESC"; }

if($uprsql = $_SESSION['last_uprsql'] && !empty($pagenum))	
	{$uprsql = $_SESSION['last_uprsql'];}
	else{$uprsql = "SELECT user_reports.*, users.user_name FROM user_reports LEFT JOIN users ON users.user_id = user_reports.ur_user_id ".$where." ".$orderby;}
	
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
}
$_SESSION['last_uprsql'] = $uprsql;
$_SESSION['filters'] = $fwViewData['filters'];
$fwViewData['title'] = $MODULE_SINGULAR;


$Usersql = "SELECT u.*,ug.group_id, g.group_name
        FROM users u, groups g, users_groups ug
        where u.user_id=ug.user_id AND ug.group_id=g.group_id AND g.group_id != 2 ORDER By g.group_id ASC, u.user_name ASC"; 
$fwViewData['users'] = $fwDb->query($Usersql);
