<?php
$fwMainView = 'file:' . getcwd() . '/datetimetracker_list.tpl';
$pagenum = $fwRequest->getparamget('pagenum','');
$opt = $fwRequest->getparamget('opt','');

$bus_id = $fwRequest->getparamget('bs_id', 0);
$where = "WHERE time_tracker.tt_bsn_id = ".$bus_id ." And tt_hide = 0";
$n = $fwRequest->getparamget('n', 0);
if($n > 0) 
{
	$where = "WHERE time_tracker.tt_bsn_id = ".$bus_id ;	
}


if($bus_id > 0){
					
	if($opt){}				
	
	//$sql = "SELECT time_tracker.*  from time_tracker WHERE time_tracker.tt_bsn_id = ".$bus_id ." And tt_hide = 0";
	$sql = "SELECT time_tracker.*  from time_tracker " . $where;
						
	$userData = $fwDb->query($sql);
	if($sql){$userData = $fwDb->query($sql);}
	$_SESSION['sql'] = $sql;
	if(!empty($userData))
	{
	if (!(isset($pagenum)))
		{
			$pagenum = 1;
		} 
	
		$rows = count($userData);
		
		$page_rows = 5;
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
		
		$mdata = $fwDb->query($sql2);
			
		foreach($mdata as $k=>$v)
		{
						$Statusdate = changedate_y_m_d($v['be_created_date']);
						$curdate_y_m_d = date('Y-m-d');
						$days_at_status = daysDifference($curdate_y_m_d, $Statusdate);
						$mdata[$k]['days_count'] = $days_at_status;
		}				
		

		if($sql2){$fwViewData['list']= $mdata;}
		}
	}

