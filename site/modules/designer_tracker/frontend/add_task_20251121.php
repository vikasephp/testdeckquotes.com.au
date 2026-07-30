<?php
$fwMainView = 'file:' . getcwd() . '/add_task.tpl';
$tableTask = new Fw_Db_Table('task_designer_tracker');

$fwViewData['dt_id'] = (int)$fwRequest->getParam('dt_id', 0);
$fwViewData['tdt_id'] = (int)$fwRequest->getParam('tdt_id', 0);

$user_id = $_SESSION['user']['user_id'];
$fwViewData['user_name'] = $_SESSION['user']['user_name'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('task', array());
	$detail['tdt_user_id'] = $user_id;
	
	$fwViewData['dt_id'] = $detail['tdt_dt_id'];
	$tdt_dt_id = $detail['tdt_dt_id'];
	
	
	$this_id = (int)$detail['tdt_id'];
	unset($detail['tdt_id']);
	
	
	
    if($this_id > 0)
    	{
                 $fwViewData['dt_id'] = $detail['tdt_dt_id'];
      		 unset($detail['tdt_dt_id']);
       		 $tableTask->setWhere("tdt_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
	
		 $opr = $tableTask->insertRow($detail); 
		 $sqlem = "Select * from design_team where de_name = '".$detail['tdt_task_assignee']."'";
		 $maildata = $fwDb->queryOne($sqlem);
		
		 $sqlbsn = "select dt_checklist_no from designer_tracker  where dt_id = ".$detail['tdt_dt_id'];
	
		 $cndata = $fwDb->queryOne($sqlbsn);
		 
		 $sql_b = "select dpn_bsn_id from document_proposal_name where dpn_unique_id = '".$cndata['dt_checklist_no']."'";
  		 $ppt = $fwDb->queryOne($sql_b);
		 
		 if(empty($ppt)) {
			$sql_b = "select dpn_bsn_id from document_renovation_name where dpn_unique_id = '".$cndata['dt_checklist_no']."'";
  		 	$ppt = $fwDb->queryOne($sql_b);	 
		 }
		 
		 $sqladdr = "select bsn_address from business where bsn_id = ".$ppt['dpn_bsn_id'];
		 $addr = $fwDb->queryOne($sqladdr);
		 
		 
		 $to_name = $detail['tdt_task_assignee'];
		 $to = $maildata['de_email'];
		 
		 $from_name = "Cgfb";
		 $from = "cgfb@deckquotes.com.au";
		 $subject = "New Design Task :".$addr['bsn_address'];
		 
		 $html = "<html><body>";
		 $html .= "<p>Hello ".$detail['tdt_task_assignee'].",</p><br>";
		 $html .= "<p>A new task has been assigned to you in the design tracker, for details please see the link below </p>";
		 $html .= "https://deckquotes.com.au/designer_tracker.mytask</p><br>";
		 $html .= "<p>Thanks,<br>CGFB Team";
		 $html .= "</body></html>";	   
		 
		 send_email($to_name, $to, $from_name, $from, $subject, $html, $attachment='');
		  
	}  
	
	
	
	
	if($detail['tdt_status'] == 'COMPLETE'){
		
		
			
   $sql_a = "select dt_checklist_no from designer_tracker where dt_id = ".$tdt_dt_id;
  
   $checklist = $fwDb->queryOne($sql_a);	
  
    
    	
   $sql_b = "select dpn_bsn_id from document_proposal_name where dpn_unique_id = '".$checklist['dt_checklist_no']."'";
   $bsn = $fwDb->queryOne($sql_b);
   
   if(empty($bsn)) {
	 $sql_b = "select dpn_bsn_id from document_renovation_name where dpn_unique_id = '".$checklist['dt_checklist_no']."'";
   	 $bsn = $fwDb->queryOne($sql_b);
   
   }
   
   
   $bsn_id =  $bsn['dpn_bsn_id'];
   
   $sql_c = "select bsn_name from business where bsn_id = ".$bsn_id;
   $bsndata = $fwDb->queryOne($sql_c);

  	
		
		$sqlem = "Select * from design_team where de_name = '".$detail['tdt_task_assignee']."'";
		 $maildata = $fwDb->queryOne($sqlem);
		
		$to = $maildata['de_email'];
		$to_name = $detail['tdt_task_assignee'];
		$to = $maildata['de_email'];
		//$to = "manojsoniephp@gmail.com";
		
		$from_name = "Design Tracker";
		$from = "info@cgfb.com.au";
		$subject = "Your task is marked as complete - ".$bsndata['bsn_name'];
		$html = "<html><body>";
		$html .= "<p> Hello ".$to_name .",";
		$html .= "<p> Your following task is marked as complete </p>";
		$html .= "<p> Task Description: ".$detail['tdt_task_desc'] ." </p>";
		$html .= "<p> Project Name : " .$bsndata['bsn_name'] . "</p><br><br>";
		$html .= "<p>Thanks,<br>CGFB Team";
		$html .= "</body></html>";
		
		
		
		send_email($to_name, $to, $from_name, $from, $subject, $html, $attachment='');	
		
	}
	
	
	
	
	
	  	
	    $fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
}

$this_id = (int)$fwRequest->getParam('tdt_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('task_designer_tracker');
	$tableTask->setWhere("tdt_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	

$sqldt = "Select * from design_team";
$fwViewData['teamData'] = $fwDb->query($sqldt);

$sql_tt = "Select * from design_task_type";
$fwViewData['tasktype'] = $fwDb->query($sql_tt);