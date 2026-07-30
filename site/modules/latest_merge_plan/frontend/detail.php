<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table('latest_merge_plan');
$submit = $fwRequest->getParam('subAddDetail', '');
$fileUploaded = true;

if (!empty($submit)) {
	$detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];

	unset($detail[$ID]);

	if ($_FILES['plan']['name']) {
		$docfile_1 = $_FILES['plan']['name'];
		$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
		$temp_name_1 = $_FILES['plan']['tmp_name'];
		$detail['lm_doc_file_name'] = $docfile_1;
		$fileUploaded = upload($docfile_1, $temp_name_1);
	}
	$detail['lm_doc_date_uploaded'] = date('d-m-Y');
	if ($fileUploaded) {
		$query = 'SELECT bsn_id, bsn_name FROM business WHERE bsn_name = "' . $detail['lm_bsn_name'] . '" AND bsn_sub_status = "Open";';
		$result = $fwDb->queryOne($query);
		$detail['lm_bsn_id'] = $result['bsn_id'];
		$opr = $tableqa->insertRow($detail);
	}
	
	$sql_cust_detail = 'SELECT b.bsn_id, b.bsn_proj_salu, CONCAT(bc.bcust_fname, " ", bc.bcust_lname) AS customer_name, bc.bcust_misc_email1 AS customer_email, bc.bcust_misc_email2 AS customer_email2, bc.bcust_misc_email3 AS customer_email3, bc.bcust_misc_email4 AS customer_email4, bc.bcust_misc_email5 AS customer_email5, bc.bcust_misc_moble as customer_phone FROM business b JOIN business_sellers bs ON bs.bs_business_id = b.bsn_id JOIN bus_customers bc ON bc.bcust_id = bs.bs_customers_id WHERE b.bsn_name = "'.$detail['lm_bsn_name'].'"';
	$data_cust_detail = $fwDb->queryOne($sql_cust_detail);
	$customerSalu = $data_cust_detail['bsn_proj_salu'];
	$customerName = $data_cust_detail['customer_name'];
	$customerEmail = $data_cust_detail['customer_email'];
	$customerNumber = $data_cust_detail['customer_phone'];
	
	$checklistNumber = $detail['lm_checklist_number'] ;
	if($_FILES['plan']['size'] > 0 && isset($_FILES['plan']) && $detail['lm_bsn_name'] && !empty($checklistNumber)){
		
		$message = '<html> <body>';
		$message .= '<p>Dear '.$customerName.',</p>';
		$message .= '<p>We would like to let you know that an updated draft of your "Latest Merged Plans – Customer Designer" for Checklist '.$checklistNumber.' has been received.</p>';
		$message .= '<p>Your Customer Designer is currently reviewing the revisions as part of our internal quality assurance process to verify they align with your scope and meet all relevant requirements and compliance. As part of this process, there may be minor adjustments identified before the plans are presented to you.</p>';
		$message .= '<p>A copy of the current draft has been uploaded to the Planning Approvals Canberra portal for your reference. It is available in "<strong>Your Latest Merged Plans</strong>" section.</p>';
		$message .= '<p>Your designer will be in touch with you shortly to discuss any updates or next steps.</p>';
		$message .= '<p>Please find below the access details:</p>';
		$message .= '<p>Portal Link: <a href="https://planningapprovalscanberra.com.au/login"  target="_blank">https://planningapprovalscanberra.com.au/login</a> </p>';
		$message .= '<p>Email/Username: '.$customerEmail.'</p>';
		$message .= '<p>Number/Password: '.$customerNumber.'</p>';
		$message .= "<p>To stay up to date with your project\'s progress, simply visit <a href='https://planningapprovalscanberra.com.au/login' target='_blank'>https://planningapprovalscanberra.com.au/login</a> and log in using the credentials above.</p>";
		$message .= "<p>We hope this information is helpful. If you have any questions or need further assistance, please don't hesitate to reach out.</p>";
		$message .= '<p>Thank you</p>';
		
		$message .= '<p><span style="font-family:calibri"><span style="font-size:12pt"><span style="color:#3db3e5">CGFB Designs Team</span><br />
					<span style="color:#3db3e5">Phone: 1300 979 658&nbsp;<span style="color:#edaa02">|</span>&nbsp;Fax: 1300 979 657</span><br />
					<span style="color:#3db3e5">Postal: GPO Box 2265 Canberra City 2602</span><br />
					<span style="color:#3db3e5">ACT Building Lic: 2012767</span></span></span></p>
					<p><img src='.BASE_URL.'images/cgfb_sign_footer.png /></p>
					';
		$message .= "</body></html>";
	
		$subject = "Notification: New Draft Plans Available for Checklist ".$checklistNumber ;
		
		//echo $message; exit('check preview');
		$custemails = [
			$data_cust_detail['customer_email'],
			$data_cust_detail['customer_email2'],
			$data_cust_detail['customer_email3'],
			$data_cust_detail['customer_email4'],
			$data_cust_detail['customer_email5']
		];

		$custemails = array_filter($custemails, function($email) {
			return !empty($email) && filter_var($email, FILTER_VALIDATE_EMAIL);
		});

		foreach ($custemails as $email) {
			//send_email($customerName, $email, 'CGFB Designs Team', 'Designs@cgfb.com.au', $subject, $message, '');
		}
		
		send_email('Tester', 'arun@ephpsolutions.com', 'CGFB Designs Team', 'Designs@cgfb.com.au', $subject, $message, $attachment='');
		//send_email('CGFB Designs Team', 'Designs@cgfb.com.au', 'CGFB Designs Team', 'Designs@cgfb.com.au', $subject, $message, $attachment='');
		
	}

	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0) {

	$tableqa = new Fw_Db_Table($TABLE);
	$tableqa->setWhere("$ID = $this_id");
	$detail = $tableqa->getRow();

	$sql = 'SELECT bsn_id, bsn_name FROM business WHERE bsn_id = "' . $detail['lm_bsn_id'] . '" AND bsn_sub_status = "Open";';
    $res = $fwDb->queryOne($sql);
	$detail['lm_bsn_name'] = $res['bsn_name'];

	$fwViewData['detail'] = $detail;
	$fwViewData['title'] = 'Edit ' . $MODULE_SINGULAR;
} else {
	$fwViewData['title'] = 'Add ' . $MODULE_SINGULAR;
}

$fwViewData['error'] = !$fileUploaded ? 'Problem in uploading file' : '';

$sql = "SELECT  bsn_id, bsn_name, bsn_address from business where bsn_sub_status = 'Open'";
$fwViewData['projdetail'] = $fwDb->query($sql);
