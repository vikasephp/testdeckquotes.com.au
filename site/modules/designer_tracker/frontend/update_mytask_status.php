<?php


$id = $fwRequest->getParam('dt_id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20',' ',$value);

if(!empty($id))
{
	$sql = "Update task_designer_tracker set  tdt_status  = '".$value."' where tdt_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	if($value == 'COMPLETE') 
	{
	
	$sql2 = "select tdt_dt_id, tdt_task_desc , tdt_task_assigner , tdt_task_assignee  from task_designer_tracker where tdt_id = ".$id;	
	$assdata = $fwDb->queryOne($sql2);
	
	
		
	$sqlem = "select * from design_team where de_name = '".$assdata['tdt_task_assigner']."'";
	$emldata = $fwDb->queryOne($sqlem);
	

		
	$sqlbs ="SELECT dpn_unique_id, dpn_bsn_id, bsn_name FROM document_proposal_name 
	         inner join designer_tracker ON document_proposal_name.dpn_unique_id = designer_tracker.dt_checklist_no 
			 Inner join business on document_proposal_name.dpn_bsn_id = business.bsn_id where designer_tracker.dt_id =  ".$assdata['tdt_dt_id']; 
	$bsndata = $fwDb->queryOne($sqlbs);	
	
	if(empty($bsndata['bsn_name'])) {
		$sqlbs ="SELECT dpn_unique_id, dpn_bsn_id, bsn_name FROM document_renovation_name 
	         inner join designer_tracker ON document_renovation_name.dpn_unique_id = designer_tracker.dt_checklist_no 
			 Inner join business on document_renovation_name.dpn_bsn_id = business.bsn_id where designer_tracker.dt_id =  ".$assdata['tdt_dt_id']; 
		$bsndata = $fwDb->queryOne($sqlbs);
	}
		
	$from = 'alert@cgfb.com.au';
	$from_name = "CGFB Alert";
	$to = $emldata['de_email'];
	$to_name = $assdata['tdt_task_assigner'];
	$subject='Your task has been completed';
	
		
	$html = "<p>Hi ".$assdata['tdt_task_assigner'].",<p>";
	//$html .= "<p>To ".$to."-".$id.",<p>";
	$html .= "<p>Your task <strong>".$id ."</strong> for <strong>".$bsndata['bsn_name']."</strong> on Design Task Tracker is complete.<p>";	
	$html .= "<p>Project Name : <strong>".$bsndata['bsn_name'] ."</strong></p>"; 
	$html .= "<p>Task Id : <strong>".$id ."</strong></p>"; 
	$html .= "<p>Checklist Id : <strong>".$bsndata['dpn_unique_id'] ."</strong></p>"; 
	$html .= "<p>Task Description : <strong>".$assdata['tdt_task_desc'] ."</strong></p>";
	$html .= "<p>Assignee Name : <strong>".$assdata['tdt_task_assignee'] ."</strong></p>";  
	$html .= "<p>Regards,<br>CGFB Alert</p>";
    $html .= "</body></html>";	
	
	//db($html);
	
    send_email($to_name, $to, $from_name, $from, $subject, $html, $attachment='');
	//send_email($to_name, 'manojsoniephp@gmail.com', $from_name, $from, $subject, $html, $attachment='');
	}
}

 exit;