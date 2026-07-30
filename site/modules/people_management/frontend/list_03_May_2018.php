<?php
$pagenum = $fwRequest->getparam('pagenum','');
$tableusers = new Fw_Db_Table('users');
$export = $fwRequest->getParam('export', 0);
$short = $fwRequest->getParam('s', '');
$fwViewData['cur_user'] = $_SESSION['user']['user_id'];



if($short)
	{
	switch ($short)
			{
				case 'lc':
				$_SESSION['sort_order'] = $TABLE.".mlbs_update_date DESC";
				break;
				
				case 'bl':
				$_SESSION['sort_order'] = $TABLE.".mlbs_last_buyer_feedback ASC";
				break;
			
			}
	}
if($_SESSION['sort_order']){$order = "ORDER BY ".$_SESSION['sort_order'];}else{$order = "ORDER BY ".$TABLE.".mlbs_update_date DESC";}	
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
if($_SESSION['last_sql']){$sql = $_SESSION['last_sql'];}
else{
	$sql = "SELECT customers.*, users.*, users_groups.group_id, groups.group_name, positions.p_name  FROM users 
			LEFT JOIN users_groups ON users.user_id = users_groups.user_id
			LEFT JOIN customers ON users.user_id = customers.user_id 
			LEFT JOIN groups ON users_groups.group_id = groups.group_id
			RIGHT JOIN positions ON positions.p_id IN (customers.customer_positions)
			WHERE users_groups.group_id IN (1,3,4) && users.user_username != 'admin' ORDER BY  users_groups.group_id ASC";
	}
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

if($sql2){ $list = $fwDb->query($sql2); 
if($list)
	{
		foreach($list as $val)
				{
					if($val['customer_positions'])
						{
							$psql = "SELECT p_name FROM positions WHERE p_id IN (".str_replace("|", ",", $val['customer_positions']).") ";								
							$positions = $fwDb->query($psql);
						}
				$val['p_name'] = $positions;
				$newlist[] =$val;
				}
$list = $newlist;				
	}
$fwViewData['list'] = $list;}
} 
$fwViewData['title'] = "People Management";
