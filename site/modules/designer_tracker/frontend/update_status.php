<?php

$id = $fwRequest->getParam('tdt_id', '');
$value = $fwRequest->getparam('value', '');

if(!empty($id))
{
	$sql = "Update task_designer_tracker set tdt_status  = '".$value ."' where tdt_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql2 = "select tdt_dt_id, tdt_task_assigner, tdt_task_desc, tdt_task_assignee from task_designer_tracker where tdt_id = ".$id;
	$ass_detail = $fwDb -> queryOne($sql2);
	
	$sql3 = "Select de_name, de_email from design_team where de_name = '".$ass_detail['tdt_task_assigner']."'";
	$eml_detail = $fwDb -> queryOne($sql3);
	

	//echo "Tana";
		
   $sql_a = "select dt_checklist_no from designer_tracker where dt_id = '".$ass_detail['tdt_dt_id']."'";
   $checklist = $fwDb->queryOne($sql_a);	

   $sql_b = "select dpn_bsn_id, dpn_unique_id from document_proposal_name where dpn_unique_id = '".$checklist['dt_checklist_no']."'";
   $bsn = $fwDb->queryOne($sql_b);
   
   if(empty($bsn)) {
	 $sql_b = "select dpn_bsn_id, dpn_unique_id from document_renovation_name where dpn_unique_id = '".$checklist['dt_checklist_no']."'";
   	 $bsn = $fwDb->queryOne($sql_b);
   
   }
   
   
   $bsn_id =  $bsn['dpn_bsn_id'];
   
   $sql_c = "select bsn_name from business where bsn_id = ".$bsn_id;
   $bsndata = $fwDb->queryOne($sql_c);

	//
	
	if($value == 'COMPLETE') {
		
		$to_name = $eml_detail['de_name'];
		$to = $eml_detail['de_email'];
		$to2 = "manojsoniephp@gmail.com";
		
		$from_name = "Design Tracker";
		$from = "alert@cgfb.com.au";
		$subject = "Your task is marked as complete - ".$bsndata['bsn_name'];
		$html = "<html><body>";
		$html .= "<p>Hi ".$to_name .",<p>";
    	//$html .= "<p>To ".$to."-".$id.",<p>";
		$html .= "<p>Your task <strong>".$id ."</strong> for <strong>".$bsndata['bsn_name']."</strong> on Design Task Tracker is complete.<p>";	
		$html .= "<p>Project Name : <strong>".$bsndata['bsn_name'] ."</strong></p>"; 
		$html .= "<p>Task Id : <strong>".$id ."</strong></p>"; 
		$html .= "<p>Checklist Id : <strong>".$bsn['dpn_unique_id'] ."</strong></p>"; 
		$html .= "<p>Task Description : <strong>".$ass_detail['tdt_task_desc'] ."</strong></p>";
		$html .= "<p>Assignee Name : <strong>".$ass_detail['tdt_task_assignee'] ."</strong></p>";  
		$html .= "<p>Regards,<br>CGFB Alert</p>";
   		$html .= "</body></html>";
		
				
		send_email($to_name, $to, $from_name, $from, $subject, $html, $attachment='');
		send_email($to_name, $to2, $from_name, $from, $subject, $html, $attachment='');
	}
}

 exit;