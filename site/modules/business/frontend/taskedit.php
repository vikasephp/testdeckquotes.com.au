<?php
$fwMainView = 'file:' . getcwd() . '/taskedit.tpl';
$bus_id = $fwRequest->getparam('bus_id', 0);

$taskId = $fwRequest -> getParamget('taskId','');

 
$taskAction = $fwRequest -> getParamget('taskAction','');
			
$submit = $fwRequest->getParam('updatetask', '');

if(!empty($submit))
{		
	$bsn_status_date = $fwRequest->getparam('bsn_status_date','');
	$bsn_status_date = changedate_Y_m_d($bsn_status_date);
	
	$complete = $fwRequest->getparam('bt_complete','');
	$comment =  $fwRequest->getparam('bt_comment','');
	$comment = addslashes($comment);
	$bst_id =  $fwRequest->getparam('bst_id',0);
	
	
	$sqldoc= "select doc_file_name from document_check_list where doc_name_id = 2 and doc_bsn_id = ".$bus_id;
	$dataDoc = $fwDb->queryOne($sqldoc);

	if($complete =='on') { $complete = 1; } else { $complete = 0; }

	if($complete == '0')
	{
		$sql_update = "UPDATE business_tasks
							SET  bt_complete = 0,
							bt_completed_date=0,
							bt_completed_by=0,
							bt_comment=''
							WHERE bt_id = $taskId";				
	}
	elseif($complete == '1')
	{
		$user_id = $_SESSION['user']['user_id'];
		
		$sql_update = "UPDATE business_tasks SET bt_complete = 1,
		bt_completed_date = '".$bsn_status_date."', 
		bt_completed_by = $user_id, 
		bt_comment = '$comment'
		WHERE bt_id = $taskId";					
	}
	
	//if($complete == '0')
	//{
	//	$fwDb -> queryOne($sql_update);
	//}
	

	if($bst_id == 201) 
	{
		
		
		if(!empty($dataDoc['doc_file_name']) AND $complete == '1')
		{
		
			if(!empty($sql_update))
			{
				$fwDb -> queryOne($sql_update);
				//auto_email_auto_text($taskId);
			}
			
			// Start Email Sending MS 
			
			$sqlbus = "Select bsn_name, bsn_address from business where bsn_id = ".$bus_id;
			$busdata = $fwDb->queryOne($sqlbus);
			
			$sql = "Select eml_email_content, eml_subject  from emaillibrary where eml_code = 'MS-0787'";
			$emaildata = $fwDb->queryOne($sql);
			
			$sqlSign = "Select * from email_signature where es_id = 92" ;
			$signature = $fwDb->query($sqlSign);
			
			$emaildata['eml_email_content'] = str_replace("[address]", $busdata['bsn_name'], $emaildata['eml_email_content']);
			
			$emaildata['eml_email_content'] .=  $signature[0]['es_signature'];
			if ($signature[0]['es_logo']) {
				$emaildata['eml_email_content'] .= "<img src='" . BASE_URL . "files/email_library/" . $signature[0]['es_logo'] . "'>";
			}
		
		
			$source = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/" . $dataDoc['doc_file_name'];
			$destination = BASE_DIR . FILE_PATH . "files/manoj/" . $dataDoc['doc_file_name'];
			$source = get_file_data($dataDoc['doc_file_name']);
		
			copy($source, $destination);
			
			$finalatta = BASE_URL . FILE_PATH . "files/manoj/" . $dataDoc['doc_file_name'];
			$file = BASE_DIR . FILE_PATH . "files/manoj/" . $dataDoc['doc_file_name'];
			if (file_exists($file)) {
							$fdata[] = $finalatta;
							$doclogattach[] =$dataDoc['doc_file_name'];
			}
			
			if (!empty($fdata)) {
				//$attachmentsend = serialize($fdata);
				$attachmentsend = $fdata;
				
			}
	
			$to = 'info@cgfb.com.au';
			$toname = 'Frank';
			$fromname = "Support Sales (CGFB)";
			$from = "supportsales@cgfb.com.au";
			$subject = $emaildata['eml_subject']. ' '. $busdata['bsn_name'];
			$email_body = $emaildata['eml_email_content'];
			
			
			require_once(LIB_DIR . 'EmailClass.php');
			$emailObj = new EmailClass;
			
			$emailObj->subject = $subject;
			$emailObj->message = $email_body;
			$emailObj->addFrom($from, $fromname);
			$emailObj->attachments = $attachmentsend;
			//$emailObj->addTo($to, $toname);
			
			//$to = 'supportmanager@cgfb.com.au';
			//$to = 'manojs@ephpsolutions.com';
			$emailObj->addTo($to, $toname);
			$emailObj->addCC('emailbackup@cgfb.com.au', $toname);	
		
		//send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend);
		//send_email($toname,'emailbackup@cgfb.com.au', $fromname, $from, $subject, $email_body, $attachmentsend);
		
			$response = $emailObj->sendEmail();
			$fwViewData['msg'] = "Email MS-0787 Has Been Successfully Sent";
		
			$emailLog['elog_eml_code'] = 'MS-0787 - MS 22';
			$emailLog['elog_to'] = $to;
			$emailLog['elog_from'] = $from;
			$emailLog['elog_subject'] = $subject;
			$emailLog['elog_email_body'] = $email_body;
			$emailLog['elog_bsn_id'] = $bus_id;
			$emailLog['elog_business'] = $busdata['bsn_name'];
			$emailLog['elog_attachment1'] = $dataDoc['doc_file_name'];
			
			$email_log_Table = new Fw_Db_Table('email_log');
			$email_log_Table->insertRow($emailLog);
				
		
		
		} elseif($complete == 0) {
			
			$fwViewData['msg'] = 'Updated ......';
			$fwDb -> queryOne($sql_update);	
		} else {
			
			$fwViewData['msg'] = "Customer Project Needs Survey has not been uploaded. Please upload the survey document before completing Task UID 201.";
		}
	} else {
		$fwDb -> queryOne($sql_update);	
	}
			
}
		
	$fwViewData['taskId'] = $taskId;
	$tablebtasks = new Fw_Db_Table('business_tasks');
	$tablebtasks->setWhere("bt_task_types_id > 0 AND bt_id = ".$taskId);
	if(!$tablebtasks->rowExists())
		{
		$sql_tasks = "	SELECT
					bt.*, 
					bs.st_name, 
					bst.bst_task_name,
					bst.bst_document,
					bst.bst_instruction,
					bst.bst_id,
					cs.customer_name
					
					FROM business_tasks as bt
					
					INNER JOIN busness_status as bs
					ON bt.bt_task_status_id = bs.st_id
					
					INNER JOIN busness_status_task as bst
					ON bt.bt_task_id = bst.bst_id

					LEFT JOIN customers as cs
					ON bt.bt_completed_by= cs.user_id
					
					WHERE bt.bt_id = $taskId";
		}else{
		
		$sql_tasks = "	SELECT
					bt.*, 
					bs.pt_name, 
					bst.bst_task_name,
					bst.bst_document,
					bst.bst_instruction,
					bst.bst_id,
					cs.customer_name
					
					FROM business_tasks as bt
					
					INNER JOIN project_type as bs
					ON bt.bt_task_types_id = bs.pt_id
					
					INNER JOIN project_types_task as bst
					ON bt.bt_task_id = bst.bst_id
											
					LEFT JOIN customers as cs
					ON bt.bt_completed_by= cs.user_id
					
					WHERE bt.bt_id = $taskId";
		}
	
	
					
$taskData = $fwDb -> queryOne($sql_tasks);



	if($taskData['bt_completed_date']!=0)
	{
		$taskData['date'] = changedate_d_m_Y($taskData['bt_completed_date']);
		$taskData['time'] = changetime_h_m($taskData['bt_completed_date']);
	}
	else
	{
		$taskData['date'] = date('d-m-Y');
		$taskData['time'] = date('H:i');
	}
	
	$fwViewData['taskData'] = $taskData;
			