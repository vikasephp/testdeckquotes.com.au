<?php
$pagenum = $fwRequest->getparam('pagenum','');
$sql = "SELECT u.*,ug.group_id, g.group_name
        FROM users u, groups g, users_groups ug
        where u.user_id=ug.user_id AND ug.group_id=g.group_id AND g.group_id != 2 AND u.user_id != 1 ORDER By g.group_id ASC, u.user_name ASC"; 
		
$sql  = "select logged_users.*, users.user_name from logged_users
		 inner join users on logged_users.lu_user_id = users.user_id 
		 order by logged_users.lu_id DESC ";	
		 	
        $userData = $fwDb->query($sql);



if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 30;
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
    
    $sql2 =  $sql." ".$max;

//DB($sql2);

if($sql2){ $fwViewData['list'] = $fwDb->query($sql2);}
}
//print_r($fwViewData['list']);
//exit;
$fwViewData['title'] = ' Logged Users';
