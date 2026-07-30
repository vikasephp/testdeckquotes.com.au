<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$listdata = $fwRequest->getParam($TABLE, array());
$user_name= $_SESSION['user']['user_name'];

$clear = $fwRequest->getParam('clear', '');
if(!empty($clear)) {
	unset($_SESSION['keyword']);
	unset($_SESSION['keyword3']);
	
	$keyword3='';
	$keyword='';
	$assigner ='';
	$fwViewData['keyword']='';
	unset($keyword);
	unset($keyword3);
	
	unset($_SESSION['complete']);
	$fwViewData['complete'] = '';
	
	unset($_SESSION['assigner']);
	
	header("Location: /designer_tracker.tasklist_report");
    exit;

}

$where = " where task_designer_tracker.tdt_status <> 'COMPLETE' ";
 
$listdata = $fwRequest->getParam($TABLE, array());
$keyword = $listdata['keyword'];
$keyword3 = $listdata['keyword3'];
$assigner = trim($listdata['assigner']);

if(!empty($keyword3)) {
	$_SESSION['keyword3'] = $keyword3;
	$fwViewData['keyword3']	= $_SESSION['keyword3'];
}

if(!empty($keyword)) {
	$_SESSION['keyword'] = $keyword;	
}

if(!empty($assigner)) {
	$_SESSION['assigner'] = $assigner;	
}

$complete = $fwRequest->getParam('complete', '');
if(!empty($complete)) :
	$where = " where task_designer_tracker.tdt_status = 'COMPLETE'";
	$_SESSION['complete'] = $complete;
	$fwViewData['complete'] = $_SESSION['complete'];

elseif (!empty($_SESSION['complete']) && $pagenum > 0):

	$where = " where task_designer_tracker.tdt_status = 'COMPLETE'";
	$fwViewData['complete'] = $_SESSION['complete'];

endif;

// Preserve COMPLETE status across searches
if (empty($complete) && !empty($_SESSION['complete'])) {
    $where = " where task_designer_tracker.tdt_status = 'COMPLETE'";
    $fwViewData['complete'] = $_SESSION['complete'];
}

$current = $fwRequest->getParam('current', '');
if(!empty($current)) {
	$where = " where task_designer_tracker.tdt_status <> 'COMPLETE'";
}

if(isset($_SESSION['keyword'])) { $keyword = $_SESSION['keyword']; }

if(!empty($keyword) || isset($_SESSION['keyword'])):
  
$where .= " AND task_designer_tracker.tdt_task_assignee LIKE '%".$keyword."%' ";
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

$where .= " AND task_designer_tracker.tdt_task_assignee LIKE '%".$_SESSION['keyword']."%' ";	
	
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;


if(isset($_SESSION['assigner'])) { $keyword = $_SESSION['assigner']; }

if(!empty($assigner) || isset($_SESSION['assigner'])):
      
	$where .= " AND task_designer_tracker.tdt_task_assigner LIKE '%".$assigner."%' ";
		
		  $_SESSION['assigner'] = $assigner;
		  $fwViewData['assigner']=$_SESSION['assigner'];
	
  elseif($_SESSION['assigner'] && $pagenum > 0):
	
	$where .= " AND task_designer_tracker.tdt_task_assigner LIKE '%".$_SESSION['assigner']."%' ";	
		
		  $fwViewData['assigner']=$_SESSION['assigner'];
 endif;


if (!empty($keyword3) || !empty($_SESSION['keyword3'])) {
    $keyword3 = !empty($keyword3) ? $keyword3 : $_SESSION['keyword3'];

    $where .= " AND task_designer_tracker.tdt_dt_id IN (
        SELECT dt_id FROM designer_tracker
        WHERE dt_checklist_no IN (
            SELECT dpn_unique_id FROM document_proposal_name
            WHERE dpn_bsn_id IN (
                SELECT bsn_id FROM business
                WHERE bsn_name LIKE '%".$keyword3."%'
            )
        )
    )";

    $_SESSION['keyword3'] = $keyword3;
    $fwViewData['keyword3'] = $keyword3;
}



$ord =' order by tdt_task_assignee';
$matsql = "SELECT * from task_designer_tracker " .$where . $ord;
//db($matsql);

if($matsql){$userData = $fwDb->query($matsql);}

if(!empty($userData))
{
	if (!(isset($pagenum))){ 
		$pagenum = 1; 
	} 
    $rows = count($userData);
    $page_rows = 500;
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


foreach($listsnew as $k => $v2)
{

   $sql_a = "select dt_checklist_no from designer_tracker where dt_id = '".$v2['tdt_dt_id']."'";
   $checklist = $fwDb->queryOne($sql_a);	

   $sql_b = "select dpn_bsn_id from document_proposal_name where dpn_unique_id = '".$checklist['dt_checklist_no']."'";
   $bsn = $fwDb->queryOne($sql_b);
   
   $bsn_id =  $bsn['dpn_bsn_id'];
   
   
    if(!empty($keyword3) || isset($_SESSION['keyword3'])) { 
  	  $sql_c = "select bsn_name from business where bsn_id = ".$bsn_id  . " And business.bsn_name like '%".$keyword3."%'"; 
    } else {
    	  $sql_c = "select bsn_name from business where bsn_id = ".$bsn_id;
}
   
   $bsndata = $fwDb->queryOne($sql_c);

 	if(!empty($keyword2) ) {
		
		if( $checklist['dt_checklist_no'] == $keyword2) {
		 $setdata2[$k]['tdt_id'] = $v2['tdt_id'];
		 $setdata2[$k]['tdt_dt_id'] = $v2['tdt_dt_id'];
		 $setdata2[$k]['dt_project_name'] = $bsndata['bsn_name'];
		 $setdata2[$k]['dt_checklist_no'] = $checklist['dt_checklist_no'];
		 $setdata2[$k]['tdt_task_desc'] = $v2['tdt_task_desc'];
		 $setdata2[$k]['tdt_task_assignee'] = $v2['tdt_task_assignee'];
		 $setdata2[$k]['tdt_task_assigner'] = $v2['tdt_task_assigner'];
		 $setdata2[$k]['tdt_submitted_date'] = changedate_d_m_y($v2['tdt_submitted_date']);
		 $setdata2[$k]['tdt_due_date'] = $v2['tdt_due_date'];
		 $setdata2[$k]['tdt_status'] = $v2['tdt_status'];
		 $setdata2[$k]['dt_assignee'] = $v2['dt_assignee'];
		 $setdata2[$k]['tdt_task_type'] = $v2['tdt_task_type'];
		 $setdata2[$k]['tdt_priority'] = $v2['tdt_priority']; 
		}
	 
	} else {
		if(!empty($bsndata['bsn_name'])) {
		 $setdata2[$k]['tdt_id'] = $v2['tdt_id'];
		 $setdata2[$k]['tdt_dt_id'] = $v2['tdt_dt_id'];
		 $setdata2[$k]['dt_project_name'] = $bsndata['bsn_name'];
		 $setdata2[$k]['dt_checklist_no'] = $checklist['dt_checklist_no'];
		 $setdata2[$k]['tdt_task_desc'] = $v2['tdt_task_desc'];
		 $setdata2[$k]['tdt_task_assignee'] = $v2['tdt_task_assignee'];
		 $setdata2[$k]['tdt_task_assigner'] = $v2['tdt_task_assigner'];
		 $setdata2[$k]['tdt_submitted_date'] = changedate_d_m_y($v2['tdt_submitted_date']);
		 $setdata2[$k]['tdt_due_date'] = $v2['tdt_due_date'];
		 $setdata2[$k]['tdt_status'] = $v2['tdt_status'];
		 $setdata2[$k]['dt_assignee'] = $v2['dt_assignee'];
		 $setdata2[$k]['tdt_task_type'] = $v2['tdt_task_type'];
		 $setdata2[$k]['tdt_priority'] = $v2['tdt_priority']; 
		}
	}
}
}
	//if($option == 2) {
//		foreach ($setdata2 as $key => $row) {
//	  	  // replace 0 with the field's index/key
//	    		$dates[$key]  = $row['dt_checklist_no'];
//		}
//		array_multisort($dates, SORT_ASC, $setdata2);
//	}

if(empty($setdata2)) {$fwViewData['notask'] = "No task is assign"; }
$fwViewData['list'] = $setdata2;
$fwViewData['title'] = $MODULE_PLURAL;

$sqldt = "Select * from design_team order by de_name";
$fwViewData['teamData'] = $fwDb->query($sqldt);


$sqldt2 = "Select distinct tdt_task_assigner from task_designer_tracker  order by tdt_task_assigner";
$fwViewData['assignerdata'] = $fwDb->query($sqldt2);

$sqlpr = "Select * from design_tracker_priority";
$fwViewData['prdetail'] = $fwDb->query($sqlpr); 
