<?php
$fwMainView = 'file:' . getcwd() . '/show-draft-email-content.tpl';
$tableEmailDraft = new Fw_Db_Table('email_draft');
$submit = $fwRequest->getParam('subAddDetail', '');
$ed_id = $fwRequest->getParam('ed_id', 0);

	$tableEmailDraft->setWhere('ed_id = '.$ed_id);
	$fwViewData['detail'] = $tableEmailDraft->getRow();
    $fwViewData['title'] = 'Email Content';

	$submit = $fwRequest->getParam('send', '');
	
	if(!empty($submit))
    {
		$detail = $fwRequest->getParam('draft', array());
				
		$toname = $detail['toname'];
		$to = $detail['toemail'];
		$fromname = $detail['fromname'];
		$from =  $detail['fromemail'];
		$subject  = $detail['subject'];
		$email_body = $detail['emailbody'];
		$attachmentsend = $detail['attachment'];
		
		$ed_id = $detail['ed_id'];
		
		if(!empty($detail['pdocs']))
		{
			$pdocs =  explode(',',$detail['pdocs']);
			foreach($pdocs as $k1 => $v1)
			{
				$finalatta = BASE_URL.FILE_PATH."files/document_check_list_files/".trim($v1);
				$fdata[] = $finalatta;
			}
			
		}
	
		if(!empty($detail['tdocs']))
		{
			$tdocs = explode(',',$detail['tdocs']);
			foreach($tdocs as $k2 => $v2)
			{
				$docsattach = BASE_URL.FILE_PATH."files/template_documents_hub/".trim($v2);
				$file = BASE_DIR.FILE_PATH."files/template_documents_hub/".trim($v2);
						if(file_exists($file)) 
						{ 
							$fdata[] = $docsattach;
						} 
			}
			
		}
		
		$attachmentsend = serialize($fdata);
	
		if(send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend))
		{
			$tableEmailDraft->setWhere("ed_id =".$ed_id);
			$data['ed_status'] = "Delivered";
			$opr = $tableEmailDraft->updateRow($data); 
			$fwViewData['opr'] = $opr;
		}
		
    }