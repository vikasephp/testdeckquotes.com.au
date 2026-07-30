<?php
$pagenum = $fwRequest->getparam('pagenum','');
$export = $fwRequest->getParam('export', 0);
$short = $fwRequest->getParam('s', '');

$listdata = $fwRequest->getParam($TABLE, array());
$searchaddr = $fwRequest->getParam('searchaddr', '');
$keyword = $listdata['keyword'];
$where = '' ;

$clear = $fwRequest->getParam('clear', '');

$searchkey = $fwRequest->getParam('searchkey', '');

 if($searchkey):

		$where .= " AND business.bsn_address LIKE '%".$searchkey."%'";
			
			$_SESSION['searchkey'] = $searchkey;
			$fwViewData['searchkey']=$_SESSION['searchkey'];
		
		elseif($_SESSION['searchkey'] && $pagenum > 0):
		
			$where .= " AND business.bsn_address LIKE '%".$_SESSION['searchkey']."%'";
			
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

		
$sql = "Select business.bsn_id, business.bsn_address, business.bsn_status_sys_date from business
        where ( business.bsn_status like '%|2|%'  OR business.bsn_status like '%|5|%' OR business.bsn_status like '%|6|%' OR business.bsn_status like '%|10|%' )" .$where ." Order By business.bsn_status_sys_date Desc"   ;  

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

 $setdata = $fwDb->query($sql2);
 
foreach($setdata as $k => $v)
{
		$sqla = "Select document_check_list.* from document_check_list
			      where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 64
				  Order By document_check_list.doc_date_uploaded DESC ";
		$data = $fwDb->queryOne($sqla);
		
		$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$v['bsn_id'];	
		
		if(!empty($data['doc_file_name']))
				 {
					$ccdate = $data['doc_date_uploaded'];
					$Statusdate = changedate_y_m_d($ccdate);
					$curdate_y_m_d = date('Y-m-d');
					$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
				   
				} else { $ccdate = ''; 
				         $dayscount='';
					   }
		
		
		
//					$ccdate = $v['bsn_status_sys_date'];
//					$Statusdate = changedate_y_m_d($ccdate);
//					$curdate_y_m_d = date('Y-m-d');
//					$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
//				   	
		
		
		// Uid 555 starts
				
				$sqluid555 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 555";
		     	$data555 = $fwDb->queryOne($sqluid555);
		
		// Uid 555 ends
		
		
		// Uid 474 starts
				
				$sqluid474 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 474";
		     	$data474 = $fwDb->queryOne($sqluid474);
		
		// Uid 474 ends
		
		
		// Uid 312 starts
				
				$sqluid312 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 312";
				$data312 = $fwDb->queryOne($sqluid312);
	
		// Uid 312 ends
		
		
		// Uid 301 starts
				
				$sqluid301 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 301";
				$data301 = $fwDb->queryOne($sqluid301);
	
		// Uid 301 ends
		
		// Uid 330 starts
				
				$sqluid330 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 330";
				$data330 = $fwDb->queryOne($sqluid330);
	
		// Uid 330 ends
		
		
		// Uid 369 starts
				
				$sqluid369 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 369";
				$data369 = $fwDb->queryOne($sqluid369);
	
		// Uid 369 ends
		
		
		// Uid 340 starts
				
				$sqluid340 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 340";
				$data340 = $fwDb->queryOne($sqluid340);
	
		// Uid 340 ends
		
		
		
		 $sqltask = "Select count(*) as totpltasks from  business_tasks
		             where bt_bsn_id = ".$v['bsn_id'] . " AND business_tasks.bt_task_status_id = 2 ";
         $planingtasks = $fwDb->queryOne($sqltask);
		
		 $sqlpldone = "Select count(*) as pltaskcomp from  business_tasks
		              where bt_bsn_id = ".$v['bsn_id'] . " AND business_tasks.bt_task_status_id = 2 AND business_tasks.bt_complete = 1";
         $taskpldone = $fwDb->queryOne($sqlpldone);
		
		if(!count($taskpldone) > 0 ) {  $taskpldone['pltaskcomp'] = 0; }
		
		$setdata2[$k]['bsn_id'] = $v['bsn_id'];
		$setdata2[$k]['bsn_address'] = $v['bsn_address'];
		$setdata2[$k]['hia_sign_date'] = changedate_d_m_y($ccdate);
		$setdata2[$k]['link'] = $link;
		$setdata2[$k]['dayscount'] = $dayscount;
		
		
		$setdata2[$k]['uid555complete'] = $data555['bt_complete'];
		$setdata2[$k]['uid555'] = $data555['bt_completed_date'];
		
		
		$setdata2[$k]['uid474complete'] = $data474['bt_complete'];
		$setdata2[$k]['uid474'] = $data474['bt_completed_date'];
		
		$setdata2[$k]['uid312complete'] = $data312['bt_complete'];
		$setdata2[$k]['uid312'] = $data312['bt_completed_date'];
		
		$setdata2[$k]['uid301complete'] = $data301['bt_complete'];
		$setdata2[$k]['uid301'] = $data301['bt_completed_date'];
		
		
		$setdata2[$k]['uid330complete'] = $data330['bt_complete'];
		$setdata2[$k]['uid330'] = $data330['bt_completed_date'];
		
		
		$setdata2[$k]['uid369complete'] = $data369['bt_complete'];
		$setdata2[$k]['uid369'] = $data369['bt_completed_date'];
		
		$setdata2[$k]['uid340complete'] = $data340['bt_complete'];
		$setdata2[$k]['uid340'] = $data340['bt_completed_date'];
		
		$setdata2[$k]['total_pl_task'] = $planingtasks['totpltasks'];
		$setdata2[$k]['task_pl_done'] = $taskpldone['pltaskcomp'];
		
}
 

foreach ($setdata2 as $key => $row) {
    // replace 0 with the field's index/key
    $dates[$key]  = $row['dayscount'];
}
array_multisort($dates, SORT_ASC, $setdata2);

 	$fwViewData['list'] =  $setdata2;
	
	$report = new Fw_Db_Table('report_planning_progress');
	$report->setWhere("1=1");
	$report->deleteRows();
	
	foreach($setdata2 as $rk => $rv)
	{
		if(!empty($rv['bsn_id'])) {
			$detailrp['re_bsn_id'] = $rv['bsn_id'];
			$this_id = $report->insertRow($detailrp);
			}
	}
 	
 }
}

//$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Planning Progress Report";