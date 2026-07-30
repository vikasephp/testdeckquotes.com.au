<?php
$fwMainView = 'file:' . getcwd() . '/view_task.tpl';

$listdata = $fwRequest->getParam($TABLE, array());
$keyword = $listdata['keyword'];

$dt_id = $fwRequest->getParam('dt_id', '');
$fwViewData['dt_id'] = $dt_id;
$_SESSION['dt_id'] = $dt_id;
$where = " WHERE tdt_dt_id =  ". $dt_id;
  
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
 }  elseif($option == 4) { 
	$ord = " order by tdt_status"; 
 }
 $fwViewData['ord'] = $option;	 
}

$sql_1 = "Select * from task_designer_tracker " . $where .$ord; 
$taskdata = $fwDb->query($sql_1);
$fwViewData['taskdata'] =  $taskdata;


$table = new Fw_Db_Table('designer_tracker');
$table->setWhere("dt_id  = $dt_id");
$project = $table->getRow();


   $sql = "select dpn_bsn_id from document_proposal_name where dpn_unique_id = '".$project['dt_checklist_no']."'";
   $ppt = $fwDb->queryOne($sql);
   
   if(empty($ppt)) {
	$sql = "select dpn_bsn_id from document_renovation_name where dpn_unique_id = '".$project['dt_checklist_no']."'";
   $ppt = $fwDb->queryOne($sql);
     
   }
   

   $sqlq = "select bsn_name from business where bsn_id = '".$ppt['dpn_bsn_id']."'";
   $bname = $fwDb->queryOne($sqlq);
   
  $fwViewData['bsn_name'] = $bname['bsn_name'];
  
$sqlpr = "Select * from design_tracker_priority";
$fwViewData['prdetail'] = $fwDb->query($sqlpr); 
  
  