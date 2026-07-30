<?php
$pagenum = $fwRequest->getparam('pagenum','');
$tablePages = new Fw_Db_Table($TABLE);
$export = $fwRequest->getParam('export', 0);
$short = $fwRequest->getParam('s', '');
if($short)
	{
	switch ($short)
			{
				case 'lc':
				$_SESSION['sort_order'] = $TABLE.".bp_title DESC";
				break;
				
				case 'bl':
				$_SESSION['sort_order'] = $TABLE.".bp_title ASC";
				break;
			}
	}
if($_SESSION['sort_order']){$order = "ORDER BY ".$_SESSION['sort_order'];}else{$order = "ORDER BY CONVERT (".$TABLE.".bg_title USING latin2) ASC";}
	
$logged_username = $_SESSION['user']['user_username'];

if(empty($pagenum))
	{
	unset($_SESSION['last_sql']);
	}
if(!empty($submit))
	{
		$detail = $fwRequest->getParam($TABLE, array());
		$fwViewData['detail'] = $detail;
		$fwViewData['ord_id'] = $detail['orderBy'];	
	}	

	if($sql = $_SESSION['last_sql']){$sql = $_SESSION['last_sql'];}
	else{$sql = "SELECT ".$TABLE.".*, users.user_name FROM ".$TABLE." LEFT JOIN users ON users.user_id = ".$TABLE.".bg_auther ".$order;}

if($sql){ $userData = $fwDb->query($sql);}	

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 10;
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

if($sql2){ $fwViewData['list'] = $fwDb->query($sql2);}

}
$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = $MODULE_PLURAL;