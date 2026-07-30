<?php
$tabletasks = new Fw_Db_Table($TABLE);
$tablebusness_status = new Fw_Db_Table('busness_status');
$tablebusiness_tasks = new Fw_Db_Table('business_tasks');
$tablebusness_types = new Fw_Db_Table('project_type');
$tablepositions = new Fw_Db_Table('positions');

$tablebusiness_sub_tasks = new Fw_Db_Table('renovation_task_list_subtask');
$tablelinked_procedure = new Fw_Db_Table('busness_status_subtask_lp');
$tabletaskproc = new Fw_Db_Table('renovation_task_list_procedures');
$tableEmailLibrary = new Fw_Db_Table('emaillibrary');

$plinkedemail = new Fw_Db_Table('renovation_task_list_email_link');
$tableQA = new Fw_Db_Table('renovation_que_ans');

$submit = $fwRequest->getParam('subAddDetail', '');
	
$btnassignTasks = $fwRequest->getParam('btnassignTasks', '');

if(!empty($submit))
{
$data = $fwRequest -> getParam('data');

if(!empty($data['bst_posid'])) { $bypr = " and bst_posid = ". $data['bst_posid']; } 

if(!empty($data['bst_task_id'])) { $bytid = " and bst_task_id = ". $data['bst_task_id']; } 
$wh = " where 1 ";
$where = $wh . $bypr . $bytid;

$sql = " Select  renovation_task_list.*, positions.p_name from  renovation_task_list
         Inner join positions on  renovation_task_list.bst_posid = positions.p_id 
		 " . $where . " Order by renovation_task_list.bst_order ";
	 
		$searchData = $fwDb->query($sql);

		$html='';
		
	foreach($searchData as $k =>$v)
	{
		
		$bst_id = $v['bst_id'];
		
		$tabletaskproc->setWhere("btp_bst_id =".$bst_id);
		$lp =  $tabletaskproc->getRows();	
		
		$linked_pro='';
		foreach($lp as $k1 => $v1)
		{
			$linked_pro .= $v1['btp_doc'] ;
			if($v1 <> end($lp)) { $linked_pro .= ", "; }
		}
				
		
		$plinkedemail->setWhere("pel_task_id  = $bst_id");
		$emaillinkDetail = $plinkedemail->getRows();
		
		$linked_email='';
		foreach($emaillinkDetail as $k2 => $v2)
		{
			$linked_email .= $v2['pel_email_linked'] ;
			if($v2 <> end($emaillinkDetail)) { $linked_email .= ", "; }
		}
	
		
		$tablebusiness_sub_tasks->setWhere("bsst_bst_id = $bst_id");
		$subtask_detail = $tablebusiness_sub_tasks->getRows();
		
		$subtask ='';
		foreach($subtask_detail as $k3 => $v3)
		{
			$subtask .= "* " .$v3['bsst_task_name'] . '<br><br>';	
		}
		
		$html .= "<div style='font-family:Calibri !important; font-size:15px;'>";
		$html .= "<h1 align='center'> Task UID " .$v['bst_task_id']. "</h1>";
		$html .= "<p><b>Task Type</b> : renovation </p>";
		$html .= "<p><b>Position Responsible : </b>" .$v['p_name']. "</p>";
		$html .= "<p><b>Task Name : </b>" .$v['bst_task_name'].  "</p>";
		$html .= "<p><b>Instruction :</b></p>";
		$html .= "<div style='border:1px solid;padding:7px;'>". $v['bst_instruction'] ."</div>";
		$html .= "<p><b>Linked Procedure : </b>". $linked_pro ."</p>";
		$html .= "<p><b>Email Linked : </b>". $linked_email ."</p>";
		$html .= "<p><b>Sub Tasks : </b></p>";
		$html .= "<div style='border:1px solid;padding:7px;'>". $subtask ."</div>";
		$html .= "<p><b>Video Link : </b>" .$v['bst_video_link']. "</p>";
		$html .= "</div>";
		
		
		$tableQA->setWhere("ps_task_id  = ". $bst_id);
		$qaDetail = $tableQA->getRows();
		
	    foreach($qaDetail as $k4 => $v4)
		{
			$html .= "<strong>Question</strong>: ". $v4['ps_question'] . "<br>";
			$html .= "<strong>Answer</strong>: ". strip_tags($v4['ps_answer']) . "<br><br>";		
		}
		
		
		$html .= "<br style='page-break-before:always'>";	
	}
	
	
	  header("Content-type: application/vnd.ms-word.doc");
	  header("Content-Disposition: attachment;Filename=TaskList.doc");    
	  echo "<html>";
	  echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=Windows-1252\">";
	  echo "<body>";
	  echo $html;
	  echo "</body>";
	  echo "</html>";
	  exit;	
}
	
/****** Begin fetch busness_status for dropdown*********/
$busness_status = $tablebusness_status->getRows();
$fwViewData['busness_status'] = $busness_status;
/****** End fetch busness_status for dropdown*********/

/****** Begin fetch busness_status for dropdown*********/
$busness_types = $tablebusness_types->getRows();
$fwViewData['busness_types'] = $busness_types;
/****** End fetch busness_status for dropdown*********/

/****** Begin fetch busness_status for dropdown*********/
$tablepositions->SetWhere("p_status = 1");
$fwViewData['positions'] = $tablepositions->getRows();
/****** End fetch busness_status for dropdown*********/

$bst_id = $fwRequest -> getParam('bst_id');

if ($bst_id > 0)
{
	$tablecats = new Fw_Db_Table($TABLE);
	$tablecats->setWhere("$ID = $bst_id");
	$detail = $tablecats->getRow();
	if($detail['bst_business_types']){ $detail['bst_business_types']= unserialize($detail['bst_business_types']); }

	$fwViewData['detail'] = $detail;

        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
	unset($_SESSION['current_bst_business_status_id']);
	
	$fwViewData['subtask_detail_lp'] = $tablelinked_procedure->getRows();
	$fwViewData['bst_id'] =  $bst_id;

}