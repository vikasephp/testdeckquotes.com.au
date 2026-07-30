<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableDocuments = new Fw_Db_Table($TABLE);
$pm_id = $fwRequest->getParam($ID, '');
$submit = $fwRequest->getParam('subAddDetail', '');
$fwViewData['pm_id'] = $pm_id;

$message = "";
//$columnsToTrack = ['pm_key_result_stm_link_public', 'pm_letter_of_offer_link_public', 'pm_training_plan_link_public', 'pm_position_manual_public', 'pm_story_business_link_public', 'pm_survey_link_public'];
$columnsToTrack = [
    'pm_key_result_stm_link_public' => 'Key Result Statement',
    'pm_letter_of_offer_link_public' => 'Letter of Offer',
    'pm_training_plan_link_public' => 'Training Plan',
    'pm_position_manual_public' => 'Position Manual',
    'pm_story_business_link_public' => 'Story Business',
    'pm_survey_link_public' => 'Survey Link'
];

if(!empty($submit))
{
    $detail = $fwRequest->getParam('pm', array());

	$this_id=$detail[$ID];
	unset($detail[$ID]);

	if($_FILES['extra1']['name'])
	{				
		$docfile_1 = $_FILES['extra1']['name'];
		$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
		$temp_name_1 = $_FILES['extra1']['tmp_name'];
		$detail['pm_extra_doc1'] = $docfile_1;
		upload($docfile_1, $temp_name_1);
	}	
	
	if($_FILES['extra2']['name'])
	{
		$docfile_2 = $_FILES['extra2']['name'];
		$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
		$temp_name_2 = $_FILES['extra2']['tmp_name'];
		$detail['pm_extra_doc2'] = $docfile_2;
		upload($docfile_2, $temp_name_2);
	}	

	
	if($_FILES['extra3']['name'])
	{
		$docfile_3 = $_FILES['extra3']['name'];
		$docfile_3 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
		$temp_name_3 = $_FILES['extra3']['tmp_name'];
		$detail['pm_extra_doc3'] = $docfile_3;
		upload($docfile_3, $temp_name_3);
	}	
	
	
	if($_FILES['extra4']['name'])
	{			
		$docfile_4 = $_FILES['extra4']['name'];
		$docfile_4 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_4);
		$temp_name_4 = $_FILES['extra4']['tmp_name'];
		$detail['pm_extra_doc4'] = $docfile_4;
		upload($docfile_4, $temp_name_4);
	}	
	
	
	if($_FILES['extra5']['name'])
	{			
		$docfile_5 = $_FILES['extra5']['name'];
		$docfile_5 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_5);
		$temp_name_5 = $_FILES['extra5']['tmp_name'];
		$detail['pm_extra_doc5'] = $docfile_5;
		upload($docfile_5, $temp_name_5);				
	}	
	
		
	if($_FILES['extra6']['name'])
	{
		$docfile_6 = $_FILES['extra6']['name'];
		$docfile_6 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_6);
		$temp_name_6 = $_FILES['extra6']['tmp_name'];
		$detail['pm_extra_doc6'] = $docfile_6;
		upload($docfile_6, $temp_name_6);
	}
	
	if($_FILES['extra7']['name'])
	{
		$docfile_7 = $_FILES['extra7']['name'];
		$docfile_7 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_7);
		$temp_name_7 = $_FILES['extra7']['tmp_name'];
		$detail['pm_extra_doc7'] = $docfile_7;
		upload($docfile_7, $temp_name_7);
	}	
	
	if($_FILES['extra8']['name'])
	{
		$docfile_8 = $_FILES['extra8']['name'];
		$docfile_8 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_8);
		$temp_name_8 = $_FILES['extra8']['tmp_name'];
		$detail['pm_extra_doc8'] = $docfile_8;
		upload($docfile_8, $temp_name_8);
	}
	
	if($_FILES['extra9']['name'])
	{
		$docfile_9 = $_FILES['extra9']['name'];
		$docfile_9 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_9);
		$temp_name_9 = $_FILES['extra9']['tmp_name'];
		$detail['pm_extra_doc9'] = $docfile_9;
		upload($docfile_9, $temp_name_9);
	}
		
	if($_FILES['extra10']['name'])
	{
		$docfile_10 = $_FILES['extra10']['name'];
		$docfile_10 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_10);
		$temp_name_10 = $_FILES['extra10']['tmp_name'];
		$detail['pm_extra_doc10'] = $docfile_10;
		upload($docfile_10, $temp_name_10);
	}
		
		
	if($this_id)
	{
		$tableDocuments->setWhere($ID." = ".$this_id);
		
		$currentRow = $tableDocuments->getRow();  // Fetch current row
		$isChanged = false;  // Flag to track if any column has changed
		// Loop through the columns you're interested in
		foreach ($columnsToTrack as $column => $label) {
			if (isset($detail[$column]) && $currentRow[$column] != $detail[$column]) {
				$isChanged = true;
				
				// Prepare the message for email notification
				$message .= '<p>';
				$message .= 'Please note that a new document titled ' . $label . ' has been uploaded to Canberra Granny Flat Builders and Fixed Price Extensions Recruitment Portal.<br/>';
				$message .= 'You can access it by logging in to our portal : <a href="https://recruitments.deckquotes.com.au/login">https://recruitments.deckquotes.com.au/login</a><br/>';
				$message .= '</p>';
				
				$message .= '<p>';
				$message .= 'If you have any questions or require further details, feel free to reach out.<br/>';
				$message .= '</p>';
				
				$message .= '<p>';
				$message .= 'Best regards, <br/>';
				$message .= '<span style="color:rgb(85,142,213)">Recruitment Team</span> <span style="color:rgb(255,192,0)"><b>|</b></span> <span style="color:rgb(85,142,213)">Canberra Granny Flat Builders & Fixed Price Extensions</span> <br/>';
				$message .= '<span style="color:rgb(85,142,213)">Phone: 1300 979 658</span> <span style="color:rgb(255,192,0)"><b>|</b></span> <span style="color:rgb(85,142,213)">Fax: 1300 979 657</span> <br/><span style="color:rgb(85,142,213)">Postal: GPO Box 2265 Canberra City 2602</span> <br/><span style="color:rgb(85,142,213)">ACT Building Lic: 2012767</span>';
				$message .= '</p>';
				
				$message .= '<p><img src="'.BASE_URL.'images/cgfb_sign_footer.png"/></p>';
	
				//$message .= '<p>Document with Column named [' . $column . '] is updated from ' . $currentRow[$column] . ' to ' . $detail[$column] . '.</p>';
				
				// Send email if changes detected
				if (!empty($message) && !empty($detail[$column])) {
					
					$detail = $fwRequest->getParam('pm', array());
					$this_id=$detail[$ID];
					
					$sql_email = "SELECT re_name, re_email, (SELECT p_name FROM positions WHERE p_id = recruitment_list.re_position_apply) AS position_name FROM recruitment_list WHERE re_is_login_enabled = 1 AND re_position_apply = (SELECT pm_position FROM position_matrix WHERE pm_id = ". $this_id.")";
					$data_email = $fwDb->query($sql_email);
					
					//echo "<pre>"; print_r($data_email); exit('Check Emailers List');
					
					foreach ($data_email as $row) {
						
						$toname = $row['re_name'];
						$to = $row['re_email'];
						
						//$to = 'rahul@ephpsolutions.com';
						
						$subject = "New Document Uploaded - ".$row['position_name'];  // Email subject
						$fullmessage = '<html><body>';
						$fullmessage .= '<p>Dear '.$toname.',</p>';
						$fullmessage .= $message;
						$fullmessage .= '</body></html>';
						
						//echo "<pre>"; echo $fullmessage; exit('Checking HTML');

						send_email($toname, $to, 'CGFB TEAM', 'recruitment@cgfb.com.au', $subject, $fullmessage, $attachment = '');
						
					}
				}
			}
		}
		
		if ($isChanged) {
			// If any change detected, perform the update
			$this_id = $tableDocuments->updateRow($detail);
		} else {
			// No changes detected
		}
		
	}
	else
	{
		$this_id = $tableDocuments->insertRow($detail);
	}		
	
	if($this_id){$fwViewData['opr'] = "Success!";
	$fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;}
}	

if(!empty($pm_id)) {
	
	$tableDocuments->setWhere($ID." = ".$pm_id);
	$fwViewData['detail'] = $tableDocuments->getRow();

}
$tablePositions = new Fw_Db_Table('positions');
$fwViewData['positions'] = $tablePositions->getRows();