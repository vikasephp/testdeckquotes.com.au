<?php
$fwMainView = 'file:' . getcwd() . '/view_comment.tpl';

$tc_task_id = $fwRequest->getParam('tc_task_id', '');
$dt_id = $fwRequest->getParam('dt_id', '');
$tdt_dt_id = $fwRequest->getParam('tdt_dt_id', '');
$fwViewData['tc_task_id'] = $tc_task_id;
$fwViewData['tdt_dt_id'] = $tdt_dt_id;
$fwViewData['dt_id'] = $_SESSION['dt_id'];

$fwViewData['all'] = $fwRequest->getParam('dt_id', '');

$tableComment = new Fw_Db_Table('task_comment');
$tableComment->setWhere("tc_task_id  = $tc_task_id");
$tableComment -> setOrderBy('tc_comment_date DESC');
$fwViewData['taskdata'] = $tableComment->getRows();

$table = new Fw_Db_Table('task_designer_tracker');
$table->setWhere("tdt_id  = $tc_task_id");
$tdesc = $table->getRow();

$fwViewData['tdesc'] = $tdesc;

 $sql1 = "select dt_checklist_no  from designer_tracker where dt_id  = ".$tdt_dt_id;
 $cno = $fwDb->queryOne($sql1);

  $sql2 = "select dpn_bsn_id from document_proposal_name where dpn_unique_id = '".$cno['dt_checklist_no']."'";
  $bid = $fwDb->queryOne($sql2);
  
  if(empty($bid)) {
	 $sql2 = "select dpn_bsn_id from document_renovation_name where dpn_unique_id = '".$cno['dt_checklist_no']."'";
  	$bid = $fwDb->queryOne($sql2);
  
  }

  $sql3 = "select bsn_name from business where bsn_id = '".$bid['dpn_bsn_id']."'";
  $bname = $fwDb->queryOne($sql3);
 
 $fwViewData['bsn_name'] = $bname['bsn_name'];
 $fwViewData['bsn_id'] = $bid['dpn_bsn_id'];


