<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$listdata = $fwRequest->getParam($TABLE, array());


//$keyword = $listdata['keyword'];
$where = "WHERE 1=1 ";
 $listdata = $fwRequest->getParam($TABLE, array());
$keyword = $listdata['keyword'];
 
 if($keyword):
      
	$where .= " AND ( task_designer_tracker.tdt_task_desc LIKE '%".$keyword."%' 
	            OR task_designer_tracker.tdt_task_assignee LIKE '%".$keyword."%' 
		    OR task_designer_tracker.tdt_task_assigner LIKE '%".$keyword."%'  
		    OR task_designer_tracker.tdt_task_type LIKE '%".$keyword."%' ) ";
		
		  $_SESSION['keyword'] = $keyword;
		  $fwViewData['keyword']=$_SESSION['keyword'];
	
	elseif($_SESSION['keyword'] && $pagenum > 0):
	
	$where .= " AND ( task_designer_tracker.tdt_task_desc LIKE '%".$_SESSION['keyword']."%' 
	            OR task_designer_tracker.tdt_task_assignee LIKE '%".$_SESSION['keyword']."%' 
		    OR task_designer_tracker.tdt_task_assigner LIKE '%".$_SESSION['keyword']."%' 
		    OR task_designer_tracker.tdt_task_type LIKE '%".$_SESSION['keyword']."%' ) ";	
		
		$fwViewData['keyword']=$_SESSION['keyword'];
endif;


$ord ='';
$submit = $fwRequest->getParam('sort', '');
if(!empty($submit))
{
 $option = $fwRequest->getParam('sortoption', '');
 if($option == 1) {
      $ord = " order by tdt_task_assignee ";	 
 } elseif($option == 2) {
	 $ord = " order by tdt_task_assigner ";
 } elseif($option == 3) { 
	$ord = " order by tdt_task_type"; 
 }
 $fwViewData['ord'] = $option;	 
}
 
 
  
 
  
$matsql = "SELECT * from task_designer_tracker "  . $where .$ord;	

if($matsql){$userData = $fwDb->query($matsql);}


if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
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
    
    $sql2 =  $matsql." ".$max;
    if($sql2){$lists= $fwDb->query($sql2);

	foreach($lists as $list):

		$listsnew[] = $list;
	endforeach;
	
	$fwViewData['list'] = $listsnew;
  }
}

foreach($listsnew as $k => $v2)
{

   $sql_a = "select dt_checklist_no from designer_tracker where dt_id = '".$v2['tdt_dt_id']."'";
   $checklist = $fwDb->queryOne($sql_a);	

   $sql_b = "select dpn_bsn_id from document_proposal_name where dpn_unique_id = '".$checklist['dt_checklist_no']."'";
   $bsn = $fwDb->queryOne($sql_b);
   
   $bsn_id =  $bsn['dpn_bsn_id'];
   
   $sql_c = "select bsn_name from business where bsn_id = ".$bsn_id;
   $bsndata = $fwDb->queryOne($sql_c);


	 
	 $setdata2[$k]['tdt_id'] = $v2['tdt_id'];
	  $setdata2[$k]['tdt_dt_id'] = $v2['tdt_dt_id'];
	 $setdata2[$k]['dt_project_name'] = $bsndata['bsn_name'];
	 $setdata2[$k]['dt_checklist_no'] = $checklist['dt_checklist_no'];
	 $setdata2[$k]['tdt_task_desc'] = $v2['tdt_task_desc'];
         $setdata2[$k]['tdt_task_assignee'] = $v2['tdt_task_assignee'];
	 $setdata2[$k]['tdt_task_assigner'] = $v2['tdt_task_assigner'];
	
	 $setdata2[$k]['tdt_submitted_date'] = changedate_d_m_y($v2['tdt_submitted_date']);
	 $setdata2[$k]['tdt_due_date'] = $v2['tdt_due_date'];
	 //$setdata2[$k]['day_open'] = $dayscount;
	 $setdata2[$k]['tdt_status'] = $v2['tdt_status'];
	 $setdata2[$k]['dt_assignee'] = $v2['dt_assignee'];
	 $setdata2[$k]['tdt_task_type'] = $v2['tdt_task_type'];

	// $setdata2[$k]['count'] = count($chknodata);
	 
}

$fwViewData['list'] = $setdata2;
$fwViewData['title'] = $MODULE_PLURAL;