<?php
$fwMainView = 'file:' . getcwd() . '/meeting_recording_list.tpl';
$pagenum = $fwRequest->getparamget('pagenum','');
$opt = $fwRequest->getparamget('opt','');
$bus_id = $fwRequest->getparamget('bs_id', 0);
if($bus_id > 0){
	
	$sql = "SELECT recorded_meeting.*, business.bsn_id FROM recorded_meeting
			INNER JOIN business ON recorded_meeting.rm_bus_id = business.bsn_id
			WHERE business.bsn_id = ".$bus_id;
	
						
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
	
		if($sql2){$fwViewData['list']= $fwDb->query($sql2);}
		}
	}
