<?php
$sedmail = 0;	
$tnum = $fwRequest->getparam('tn', 0);
/*$days = (strtotime(date("Y-m-d")) - strtotime("2011-12-17")) / (60 * 60 * 24);
print $days;
exit;
*/

switch($tnum)
	{
		//////GD REMINDER///
		case 1:
		$gdrsql ="SELECT bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1, bus_customers.bcust_gendec_sent_date  
		FROM bus_customers 
		WHERE bus_customers.bcust_isbuyer = 1 AND  bus_customers.bcust_gendec_sent_date != '0000-00-00' 
		AND bus_customers.bcust_gendec_sent_date = '".date('Y-m-d', strtotime('-7 days'))."' 
		AND bus_customers.bcust_gendec_signed_date = '0000-00-00' 
		ORDER BY bus_customers.bcust_id ASC"; 
		$gdReminders = $fwDb->query($gdrsql);
			if($gdReminders)
				{	
					foreach($gdReminders as $kk => $vv)
							{
						$fname = $vv['bcust_fname'];
						$lname = $vv['bcust_lname'];
						$email = $vv['bcust_misc_email1'];
					  //$email = "dhirephp@gmail.com";	
							if(send_general_disclamer_reminder($fname, $lname, $email))
								{
									$sedmail++;			
									$buyers[]=$vv;	
									unset($fname);
									unset($lname);						
									unset($email);
								}
							}
					    }
		break;

		//////GD REMINDER///


		//////FREE GUIDES AND ASSISTANCE///
		case 2:
		$gdrsql ="SELECT bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1, bus_customers.bcust_gendec_sent_date  
		FROM bus_customers 
		WHERE bus_customers.bcust_isbuyer = 1 AND  bus_customers.bcust_gendec_sent_date != '0000-00-00' AND bus_customers.bcust_gendec_sent_date = '".date('Y-m-d', strtotime('-2 days'))."' AND bus_customers.bcust_gendec_signed_date = '0000-00-00' ORDER BY bus_customers.bcust_id ASC"; 
		$gdReminders = $fwDb->query($gdrsql);
			if($gdReminders)
				{	
					$fromname = FROM_NAME;
					$from = SITE_EMAIL_SEND;
					$tableTemp = new Fw_Db_Table('email_template'); 
				$tableTemp->setWhere("et_status = 1 AND et_name = 'FREE_GUIDES_AND_ASSISTANCE_FOR_BUSINESS_BUYERS'");
				$email_template_data = $tableTemp->getRow();
				if($email_template_data)
					{				
					foreach($gdReminders as $kk => $vv)
							{
							$toname = $vv['bcust_fname']." ".$vv['bcust_lname'];
							$to = $vv['bcust_misc_email1'];
							//$to = "dhirephp@gmail.com";	
		$subject = $email_template_data['et_subject'];
		$email_template_data['et_body'] = str_replace("{{buyerfname}}", $vv['bcust_fname'], $email_template_data['et_body']);
		$email_template_data['et_body'] = str_replace("{{buyerlname}}", $vv['bcust_lname'], $email_template_data['et_body']);
		$email_body = $email_template_data['et_body'];
	
	if($email_template_data['et_attachment']){
		$attach = unserialize($email_template_data['et_attachment']);foreach($attach as $k => $v){$attachment[] = BASE_URL.FILE_PATH.'files/template_files/'.$v;}}	
		$attachmentsend2 = serialize($attachment);
		if(send_email($toname, $to, $fromname, $from, $subject, $email_body,$attachmentsend2))
			{
				$sedmail++;		
			}
		}
     }
  }

	break;
		//////FREE GUIDES AND ASSISTANCE///
		//////E-DOSSIER FOLLOW UP///
		case 3:
		$edsql ="SELECT byer_enquiry.be_sed_date, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1 
		FROM byer_enquiry 
		LEFT JOIN bus_customers ON bus_customers.bcust_id = byer_enquiry.be_customer_id	
		WHERE byer_enquiry.be_sed_date = '".date('Y-m-d', strtotime('-5 days'))."' "; 

		$edFollowers = $fwDb->query($edsql);
			if($edFollowers)
				{	
				$fromname = FROM_NAME;
				$from = SITE_EMAIL_SEND;
				$tableTemp = new Fw_Db_Table('email_template'); 

				$tableTemp->setWhere("et_status = 1 AND et_name = 'E_DOSSIER_FOLLOW_UP'");

				$email_template_data = $tableTemp->getRow();

				if($email_template_data)

					{

					foreach($edFollowers as $kk => $vv)

							{

							$toname = $vv['bcust_fname']." ".$vv['bcust_lname'];

							$to = $vv['bcust_misc_email1'];

							//$to = "dhirephp@gmail.com";	



					$subject = $email_template_data['et_subject'];


	$email_template_data['et_body'] = str_replace("{{buyerfname}}", $vv['bcust_fname'], $email_template_data['et_body']);
	$email_template_data['et_body'] = str_replace("{{buyerlname}}", $vv['bcust_lname'], $email_template_data['et_body']);

	$email_body = $email_template_data['et_body'];
	if($email_template_data['et_attachment']){
		$attach = unserialize($email_template_data['et_attachment']);foreach($attach as $k => $v){$attachment[] = BASE_URL.FILE_PATH.'files/template_files/'.$v;}}	
		$attachmentsend2 = serialize($attachment);
	if(send_email($toname, $to, $fromname, $from, $subject, $email_body,$attachmentsend2))
		{
			$sedmail++;		
		}
     }
  }
 } 
	break;
		//////E-DOSSIER FOLLOW UP///
		case 4:
		$gdrsql ="SELECT business.bsn_name, bt86.bt_bsn_id AS bt86bsnid, bt86.bt_task_id AS bt86btid, bt87.bt_task_id AS bt87btid, 
		bt86.bt_completed_date AS bt86cdate, bt87.bt_completed_date AS bt87cdate  
		FROM business 
		LEFT JOIN business_tasks AS bt86 ON business.bsn_id = bt86.bt_bsn_id AND bt86.bt_task_id = 86
		LEFT JOIN business_tasks AS bt87 ON business.bsn_id = bt87.bt_bsn_id AND bt87.bt_task_id = 87
		WHERE bt86.bt_completed_date >= '".date('Y-m-d', strtotime('-6 days'))."' AND bt87.bt_complete = 0 
		ORDER BY bt86.bt_completed_date ASC"; 
		$tasks8687 = $fwDb->query($gdrsql);
		
		
		$toname = "D";
		$to = 'dhirephp@gmail.com'
		$subjecttitle = ' - Please Create the 5% and 45% Invoices - Task require Action';	
		$attachmentsend2 = '';
		
		foreach($tasks8687 as $8687):
		$subject =  $8687['bsn_name'].$subjecttitle;
		$email_body = '<html>
							<body>
								<p>Dear Accounts Receivables,</p>
								<p>Project Name: <b>'.$8687['bsn_name'].'</b></p>
								<p>Requires urgent action.</p>
								<p>Please create <b>the 5% and 45% invoices and email to the support person ASAP.</b></p>
								<p>Please find the attached completed contract.</p>
								<p>Kind regards,</p>
								<p>Frank Walmsley</p>
							</body>
					   </html>';
		
		if(send_email($toname, $to, SITE_NAME, SITE_EMAIL, $subject, $email_body,$attachmentsend2))
			{
				$sedmail++;		
			}	
		endforeach;
		
	}	
print($sedmail);

exit;