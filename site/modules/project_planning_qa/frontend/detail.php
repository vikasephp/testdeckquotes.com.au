<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table('business_qa');
$submit = $fwRequest->getParam('subAddDetail', '');
if (!empty($submit)) {
	$detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail['bqa_id'];
	unset($detail['id']);
	if ($_FILES['ans_attach_1']['name']) {
		$docfile_1 = $_FILES['ans_attach_1']['name'];
		$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
		$temp_name_1 = $_FILES['ans_attach_1']['tmp_name'];
		$detail['bqa_attachment_ans_1'] = $docfile_1;
		upload($docfile_1, $temp_name_1);
	}
	if ($_FILES['ans_attach_2']['name']) {
		$docfile_2 = $_FILES['ans_attach_2']['name'];
		$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
		$temp_name_2 = $_FILES['ans_attach_2']['tmp_name'];
		$detail['bqa_attachment_ans_2'] = $docfile_2;
		upload($docfile_2, $temp_name_2);
	}
	if ($_FILES['ans_attach_3']['name']) {
		$docfile_3 = $_FILES['ans_attach_3']['name'];
		$docfile_3 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
		$temp_name_3 = $_FILES['ans_attach_3']['tmp_name'];
		$detail['bqa_attachment_ans_3'] = $docfile_3;
		upload($docfile_3, $temp_name_3);
	}
	if ($_FILES['ans_attach_4']['name']) {
		$docfile_4 = $_FILES['ans_attach_4']['name'];
		$docfile_4 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_4);
		$temp_name_4 = $_FILES['ans_attach_4']['tmp_name'];
		$detail['bqa_attachment_ans_4'] = $docfile_4;
		upload($docfile_4, $temp_name_4);
	}
	if ($_FILES['ans_attach_5']['name']) {
		$docfile_5 = $_FILES['ans_attach_5']['name'];
		$docfile_5 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_5);
		$temp_name_5 = $_FILES['ans_attach_5']['tmp_name'];
		$detail['bqa_attachment_ans_5'] = $docfile_5;
		upload($docfile_5, $temp_name_5);
	}
	$detail['bqa_ans_plain'] = $detail['bqa_ans'];
	if ($this_id > 0) {
		$detail['bqa_ans_user_id'] = $_SESSION['user']['user_id'];
		$detail['bqa_ans_date'] = date('Y-m-d');
		$tableqa->setWhere("bqa_id = $this_id");
		$opr = $tableqa->updateRow($detail);
	} else {
		$sqlmx = "SELECT MAX(bqa_unique_id) AS bqa_unique_id FROM business_qa";
		$uni = $fwDb->queryOne($sqlmx);
		$bqa_unique_id = $uni['bqa_unique_id'] + 1;
		$detail['bqa_unique_id'] = $bqa_unique_id;
		$detail['bqa_from_pae'] = 1;
		$detail['bqa_que_user_id'] = $_SESSION['user']['user_id'];
		$opr = $tableqa->insertRow($detail);
	}
	$this_id = (int)$fwRequest->getParam('bqa_id', 0);
	$sql = "Select business.bsn_name, business_qa.bqa_que, business_qa.bqa_ans, 
	        business_qa.bqa_created_date, business_qa.bqa_que_user_id from business 
	        inner join business_qa on business.bsn_id = business_qa.bqa_bsn_id
			where business_qa.bqa_id = " . $this_id;
	$data1 = $fwDb->queryOne($sql);
	$sql2 = "select bcust_fname,bcust_lname, bcust_misc_email1, bcust_misc_moble from bus_customers where bcust_id = " . $data1['bqa_cust_id'];
	$custData = $fwDb->queryOne($sql2);
	$html = "Hi " . $custData['bcust_fname'] . ",";
	$html .= "<p>Great news! We wanted to notify you that your question regarding your project has been answered. Our team has worked diligently to provide you with a prompt response, and we are happy to share the answer with you.</p>";
	$html .= "<p><strong>Project Address :</strong>" . $data1['bsn_name'] . "</p>";
	$html .= "<p><strong>Your Question :</strong>" . $data1['bqa_que'] . "</p>";
	$html .= "<p><strong>Date of Question :</strong>" . $data1['bqa_created_date'] . "</p>";
	$html .= "<p><strong>Answer :</strong>" . $data1['bqa_ans'] . "</p>";
	$html .= "<p>We appreciate your engagement and participation, and we hope that the answer provided meets your expectations. If you have any further questions or need additional information, please feel free to reach out to us. We are here to assist you in any way we can</p>";
	$html .= "<p>To view the enquiry and answer in detail, visit the <a href='https://www.planningapprovalscanberra.com.au'>Planning Approvals Canberra</a> and log in by your phone and email address";
	$html .= "<p>Regards,<br>CGFB Construction Team</p>";
	$to = $custData['bcust_misc_email1'];
	$toname = $custData['bcust_fname'];
	$from = "construction@cgfb.com.au";
	$fromname = "Construction";
	$subject = "Admin answered your query";
	//$to = "manojsoniephp@gmail.com";
	send_email($toname, $to, $fromname, $from, $subject, $html, $attachment = '');
	$fwViewData['opr'] = $opr;
	$username = "manojsoniephp";
	$password = "jaimatadi108";
	$message  = "Hi " . $custData['bcust_fname'] . ' ' . $custData['bcust_lname'] . chr(10);
	$message .= "An answer has been provided to your enquiry regarding your construction project. Please see the below details: " . chr(10);
	$message .= "Project Address :" . $data1['bsn_name'] . chr(10);
	$message .= "Enquiry :" . $data1['bqa_que'] . chr(10);
	$message .= "Answer :" . $data1['bqa_ans'] . chr(10);
	$message .= "You may proceed to the www.planningapprovalscanberra.com.au Website to view in detail" . chr(10);
	$message .= "CGFB Operations Team";
	$type     = "1-way";
	$senderid = "CGFB";
	//  $to       = "919823868963";
	$to = str_replace(" ", "", $custData['bcust_misc_moble']);
	$url_1 = "http://api.directsms.com.au/s3/http/send_message?" .
		"username=" . $username . "&" .
		"password=" . $password . "&" .
		"message="  . urlencode($message) . "&" .
		"type="     . $type . "&" .
		"senderid=" . urlencode($senderid) . "&" .
		"to="       . $to;
	// Send the request
	$output = file($url_1);
	$result = explode(":", $output[0]);
	if ($result[0] == "id") {
		echo ("Message sent\n");
	} else {
		echo ("Error :- " . $result[1] . "\n");
	}
}
$this_id = (int)$fwRequest->getParam('bqa_id', 0);
if ($this_id > 0) {
	$tableqa = new Fw_Db_Table('business_qa');
	$tableqa->setWhere("bqa_id = $this_id");
	$detail = $tableqa->getRow();
	$fwViewData['detail'] = $detail;
	$fwViewData['title'] = 'Edit ' . $MODULE_SINGULAR;
} else {
	$fwViewData['title'] = 'Add ' . $MODULE_SINGULAR;
}
