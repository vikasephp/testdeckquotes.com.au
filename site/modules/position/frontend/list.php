<?php
$pagenum = $fwRequest->getparam('pagenum','');
$tableusers = new Fw_Db_Table('users');

$fwViewData['cur_user'] = $_SESSION['user']['user_id'];
$sql = "SELECT positions.*, rep_positions.p_name as rp_name FROM positions 
		LEFT JOIN positions AS rep_positions ON rep_positions.p_id = positions.p_report
WHERE positions.p_status = 1
 ORDER BY positions.p_name ASC";

if($sql){ $userData = $fwDb->query($sql);}	
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
					if($val['p_id'])
						{
							$psql = "SELECT customer_name FROM customers WHERE customer_positions IN (".$val['p_id'].") ";								
							$positions = $fwDb->query($psql);
						}
				$val['u_name'] = $positions;
				$newlist[] =$val;
				}
$list = $newlist;				
	}	
$fwViewData['list'] = $list;}
} 
$fwViewData['title'] = "Position Management";
