<?php
$fwAuthGroup->forceLogin();
$table = new Fw_Db_Table("module_testing");
$tableAdd = new Fw_Db_Table("testing_contacts");
$submit = $fwRequest->getParam('subAddDetail', '');

$submitAdd = $fwRequest->getParam('add_contact', '');

if(!empty($submitAdd))
{
	$detailAdd['tc_email'] = $fwRequest->getParam('new_contact', array());
	$opr3 = $tableAdd->insertRow($detailAdd); 
}

$cd = date("d-m-Y h:i:sa");
$user = $_SESSION['user']['user_name'];

if(!empty($submit))
{
	$con = $fwRequest->getParam('contacts', array());
	
	
	
		if(!empty($_FILES['tm_upload']['name']))
	    {
			$file_name1 = $_FILES['tm_upload']['name'];
			$src1 = $_FILES['tm_upload']['tmp_name'];
			$destination1 = BASE_DIR.'files/uploads_2024/'.$file_name1;
			move_uploaded_file($src1, $destination1);
			$attach1 =  BASE_URL.FILE_PATH."files/uploads_2024/".$file_name1 ;
	    }
	
	
	   if(!empty($_FILES['mac']['name']))
	    {
			$file_name2 = $_FILES['mac']['name'];
			$src2 = $_FILES['mac']['tmp_name'];
			$destination2 = BASE_DIR.'files/uploads_2024/'.$file_name2;
			move_uploaded_file($src2, $destination2);
			$attach2 =  BASE_URL.FILE_PATH."files/uploads_2024/".$file_name2 ;
	    }
		
		
		if(!empty($_FILES['pc']['name']))
	    {
			$file_name3 = $_FILES['pc']['name'];
			$src3 = $_FILES['pc']['tmp_name'];
			$destination3 = BASE_DIR.'files/uploads_2024/'.$file_name3;
			move_uploaded_file($src3, $destination3);
			$attach3 =  BASE_URL.FILE_PATH."files/uploads_2024/".$file_name3 ;
	    }
		
		
		if(!empty($_FILES['iPhone']['name']))
	    {
			$file_name4 = $_FILES['iPhone']['name'];
			$src4 = $_FILES['iPhone']['tmp_name'];
			$destination4 = BASE_DIR.'files/uploads_2024/'.$file_name4;
			move_uploaded_file($src4, $destination4);
			$attach4 =  BASE_URL.FILE_PATH."files/uploads_2024/".$file_name4 ;
	    }
	
	    if(!empty($_FILES['android']['name']))
	    {
			$file_name5 = $_FILES['android']['name'];
			$src5 = $_FILES['android']['tmp_name'];
			$destination5 = BASE_DIR.'files/uploads_2024/'.$file_name5;
			move_uploaded_file($src5, $destination5);
			$attach5 =  BASE_URL.FILE_PATH."files/uploads_2024/".$file_name5 ;
	    }
		
		if(!empty($_FILES['ipad']['name']))
	    {
			$file_name6 = $_FILES['ipad']['name'];
			$src6 = $_FILES['ipad']['tmp_name'];
			$destination6 = BASE_DIR.'files/uploads_2024/'.$file_name6;
			move_uploaded_file($src6, $destination6);
			$attach6 =  BASE_URL.FILE_PATH."files/uploads_2024/".$file_name6 ;
	    }
	
		if(!empty($attach1)) {
			$fdata[] = $attach1;	
		}
		
		if(!empty($attach2)) {
			$fdata[] = $attach2;	
		}
		
		if(!empty($attach3)) {
			$fdata[] = $attach3;	
		}
		
		if(!empty($attach4)) {
			$fdata[] = $attach4;	
		}
		
		if(!empty($attach5)) {
			$fdata[] = $attach5;	
		}
		
		if(!empty($attach6)) {
			$fdata[] = $attach6;	
		}
		
	
		if(!empty($fdata)) {			
				$attachmentsend = serialize($fdata);
		}
	
	
    	$detail = $fwRequest->getParam('testing', array());
	    $this_id = (int)$detail['te_id'];
        unset($detail['te_id']);
	
	  		 
		 if($detail['tm'] == 'Yes') {
			$typing = "Yes Correct";
		 } elseif($detail['tm'] == 'No') {
			 $typing = "Not Correct";
		 }
		 
		 if($detail['fun'] == 'Yes') {
			$functionality = "Yes Working";
		 } else {
			 $functionality = "Not Working";
		 }
		 
		 if($detail['mac_device'] == 'Yes') {
			$mac_device = "Yes Working";
		 } else {
			 $mac_device = "Not Working";
		 }
		 
		 
		 if($detail['pc_device'] == 'Yes') {
			$pc_device = "Yes Working";
		 } else {
			 $pc_device = "Not Working";
		 }
		 
		 
		 if($detail['iphone_device'] == 'Yes') {
			$iphone_device = "Yes Working";
		 } else {
			 $iphone_device = "Not Working";
		 }
		 
		 if($detail['android_device'] == 'Yes') {
			$android_device = "Yes Working";
		 } else {
			 $android_device = "Not Working";
		 }
		 
		 if($detail['ipad_device'] == 'Yes') {
			$ipad_device = "Yes Working";
		 } else {
			 $ipad_device = "Not Working";
		 }
	    
	    $detail['te_testing_date'] = date('d-m-Y');
		$detail['te_file_upload'] = $file_name1;
	
		if($this_id > 0)
			{
			
				 $table->setWhere("te_id = $this_id");
				 $opr = $table->updateRow($detail);
			}
		else
		{	
		
			 $opr = $table->insertRow($detail); 
			 $fwViewData['opr'] = $opr;
		}    	
		
		
		$to1 = 'manojsoniephp@gmail.com';
		$toname1 = 'Manoj Soni';
		
		$to2 = 'supportmanager@cgfb.com.au';
		$toname2 = 'Saurabh Vishvakarma';
		
		$to3 = 'vikas@ephpsolutions.com';
		$toname3 = 'Vikas Gupta';
		
		$from_name = "Ephp Team";
		$from = "vikas@ephpsolutions.com";
		
		$subject = $detail['te_subject'];
		
		$email_body = "<html><strong>Hello All</strong><br><br>";
		$email_body = "<strong>Here is the testing report of the section</strong><br><br>";
		$email_body .= '<table border="1" width="90%" cellpadding="5">';
		$email_body .= '<tr>';
		$email_body .= '<td>Module Name</td>';
		$email_body .= '<td>'.$detail['te_module_name'].'</td>';
		$email_body .= '</tr><tr>';
		$email_body .= '<td>Module Link</td>';
		$email_body .= '<td>'.$detail['te_module_link'].'</td>';
		$email_body .= '</tr><tr>';
		$email_body .= '<td>Tester Name</td>';
		$email_body .= '<td>'.$detail['te_tester_name'].'</td>';
		$email_body .= '</tr><tr>';
  
		$email_body .= '<td>Testing Date</td>';
		$email_body .= '<td>'.$detail['te_testing_date'].'</td>';
		$email_body .= '</tr>';
		
		$email_body .= '<tr><td>Typing Mistake Tested</td>';
		$email_body .= '<td>'.$typing.'<br>'.$detail['te_tm_comment'].'</td>';
		$email_body .= '</tr>';
		
		$email_body .= '<tr><td>Functionality Tested</td>';
		$email_body .= '<td>'.$functionality.'<br>'.$detail['te_fun_comment'].'</td>';
		$email_body .= '</tr>';
		
		$email_body .= '<tr><td colspan="2">Testing On Different Devices</td></tr>';
		
		$email_body .= '<tr><td>Testing On MAC</td>';
		$email_body .= '<td>'.$mac_device.'<br>'.$detail['te_mac_comment'].'</td>';
		$email_body .= '</tr>';
		
		
		$email_body .= '<tr><td>Testing On PC</td>';
		$email_body .= '<td>'.$mac_device.'<br>'.$detail['te_pc_comment'].'</td>';
		$email_body .= '</tr>';
		
		
		$email_body .= '<tr><td>Testing On iPhone</td>';
		$email_body .= '<td>'.$pc_device.'<br>'.$detail['te_iphone_comment'].'</td>';
		$email_body .= '</tr>';
		
		
		$email_body .= '<td>Testing On Android Phone</td>';
		$email_body .= '<td>'.$mac_device.'<br>'.$detail['te_android_comment'].'</td>';
		$email_body .= '</tr>';
		
		
		$email_body .= '<tr><td>Testing On iPads</td>';
		$email_body .= '<td>'.$mac_device.'<br>'.$detail['te_ipad_comment'].'</td>';
		$email_body .= '</tr>';
		
		$email_body .= '</table></html>';
		
		$toname = "";
		foreach($con as $k=>$v)
		{
			
			send_email($toname,$v, $fromname, $from, $subject, $email_body, $attachmentsend);
		}
		
         //send_email($toname1,$to1, $fromname, $from, $subject, $email_body, $attachmentsend);
		 //send_email($toname2,$to2, $fromname, $from, $subject, $email_body, $attachmentsend);
		 //send_email($toname3,$to3, $fromname, $from, $subject, $email_body, $attachmentsend); 
		
		//Location(BASE_URL . 'site.stafflist');
		
		
}


$sql =  "Select * from testing_contacts";
$fwViewData['contact_list'] = $fwDb->query($sql);

