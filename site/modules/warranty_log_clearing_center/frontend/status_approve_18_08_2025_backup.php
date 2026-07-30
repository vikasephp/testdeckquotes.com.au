<?php
$fwMainView = 'file:' . getcwd() . '/status_approve.tpl';
$table = new Fw_Db_Table('warranty_log');
$tablecc = new Fw_Db_Table('warranty_form');

$wf_id = (int)$fwRequest->getParam('wf_id', 0);
$fwViewData['wf_id']  = $wf_id;

$submit = $fwRequest->getParam('subAddDetail', '');
if (!empty($submit)) {
	$status = $fwRequest->getParam('approve', array());

	if ($status == 'Yes') {
		$detail['wf_status'] = 'Approved';
	} else {
		$detail['wf_status'] = 'Disapproved';
	}


	$tablecc->setWhere("wf_id = $wf_id");
	$opr = $tablecc->updateRow($detail);

	if ($status == 'Yes') {

		$sql = "Select * from warranty_form where wf_id = " . $wf_id;
		$data = $fwDb->queryOne($sql);

		$wlDetail['wa_project'] = $data['wf_property_address'];

		if ($data['wf_is_tented'] == 'Yes') {
			$wlDetail['wa_tenanted'] = 'Yes';
		} else {
			$wlDetail['wa_tenanted'] = 'No';
		}

		if ($data['wf_is_completed'] == '1') {
			$wlDetail['wa_type'] = 'In Construction';
		} else {
			$wlDetail['wa_type'] = 'Completed';
		}

		$wlDetail['wa_status'] = 'Open';

		$wlDetail['wa_problem'] = $data['wf_problem'];
		$wlDetail['wa_area']   = $data['wf_area'];
		$wlDetail['wa_image_1'] = $data['wf_photo_1'];
		$wlDetail['wa_image_2'] = $data['wf_photo_2'];
		$wlDetail['wa_image_3'] = $data['wf_photo_3'];
		$wlDetail['wa_image_4'] = $data['wf_photo_4'];
		$wlDetail['wa_image_5'] = $data['wf_photo_5'];
		$wlDetail['wa_video']   = $data['wf_video'];
		$wlDetail['wa_date'] = date('d-m-Y');

		$fwViewData['opr'] = $table->insertRow($wlDetail);


		// Email To Customer Function Starts

		$sq12 = "SELECT  business_sellers.bs_business_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
         		       bus_customers.bcust_misc_moble, bus_customers.bcust_misc_email1  from business_sellers 		
	 		           Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			           Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
					   where business.bsn_name Like '%" . $data['wf_property_address'] . "%'";

		$data = $fwDb->queryOne($sq12);


		$message = '<html><body>';
		$message .= '<p>Hi ' . $data['bcust_fname'] . ' ' . $data['bcust_lname'] . '</p>';
		$message .= '<p>Your warranty issue has been lodged. Please proceed to the <a href="https://www.warrantyreport.com.au">Warranty Report Website</a> to view your issues. You may use your email address and phone number to log in: </p>';

		$message .= '<p>Email : ' . $data['bcust_misc_email1'] . '</p>';
		$message .= '<p>Phone Number : ' . $data['bcust_misc_moble'] . '</p><br>';

		$message .= '<p>Regards,<br>';
		$message .= '<p>CGFB Warranty Team<br>';

		$to = $data['bcust_misc_email1'];
		$toname = $data['bcust_fname'] . ' ' . $data['bcust_lname'];
		$subject = 'New Warranty Issue Lodged';

		//$to = 'manojsoniephp@gmail.com';

		send_email($toname, $to, 'CGFB Warranty Team', 'info@cgfb.com.au', $subject, $message, $attachment = '');

		// Email To Customer Function Ends


		// Email To  Warranty Function Starts

		$message2  = '<html><body>';
		$message2 .= '<p>Hi Warranty Manager,</p><br>';
		$message2 .= '<p>A new warranty issue has been lodged. The record number is ' . $fwViewData['opr'] . '. Please review the new issue in the <a href="https://deckquotes.com.au/warranty_log.home">Warranty log.</a></p><br>';
		$message2 .= '<p>Regards,<br>';
		$message2 .= '<p>CGFB Operations Team<br>';

		$to1 = 'warranty@cgfb.com.au';
		$to2 = 'info@cgfb.com.au';
		$toname = 'Warranty Team';
		$subject = 'New Warranty Issue Lodged';

		//$to = 'manojsoniephp@gmail.com';
		send_email($toname, $to1, 'CGFB Operations Team', 'operations@cgfb.com.au', $subject, $message2, $attachment = '');
		send_email($toname, $to2, 'CGFB Operations Team', 'operations@cgfb.com.au', $subject, $message2, $attachment = '');

		// Email To  Warranty Function Ends
	}

	$fwViewData['opr'] = "Status has been updated successfully";
}
