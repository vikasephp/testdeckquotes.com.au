<?php
$fwMainView = 'file:' . getcwd() . '/enquiry_email_document.tpl';
$table = new Fw_Db_Table('properties_sale_reports_enquiries');

$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);
$psre_id = (int)$fwRequest->getParam('psre_id', 0);

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];
$user_id = $_SESSION['user']['user_id'];

$fwViewData['bsn_id'] = $bsn_id;

// Fetch submitted form data
$show_preview = $fwRequest->getParam('show_preview', '');
$fwViewData['show_preview'] = $show_preview;

require_once LIB_DIR . 'EmailClass.php';

//$sql_public_documents = "SELECT doc_name_id, CASE doc_name_id WHEN 471 THEN 'Auction Agreement' WHEN 766 THEN 'Building and Compliance Report' WHEN 773 THEN 'Floor Plan' WHEN 770 THEN 'Rental Appraisal Letter' WHEN 769 THEN 'Sales Appraisal Letter' WHEN 768 THEN 'Suburb Flyover Report' WHEN 774 THEN 'AirDNA Income Report' END AS document_name, doc_live_link FROM document_check_list WHERE doc_name_id IN (471, 766, 773, 770, 769, 768, 774) AND doc_live_link IS NOT NULL AND doc_live_link != '' AND doc_bsn_id = ".$bsn_id;
$sql_public_documents = "SELECT CASE doc_name_id WHEN 471 THEN 'Auction Agreement' WHEN 766 THEN 'Building and Compliance Report' WHEN 773 THEN 'Floor Plan' WHEN 770 THEN 'Rental Appraisal Letter' WHEN 769 THEN 'Sales Appraisal Letter' WHEN 768 THEN 'Suburb Flyover Report' WHEN 774 THEN 'AirDNA Income Report' END AS document_name, doc_live_link FROM document_check_list WHERE doc_name_id IN (471, 766, 773, 770, 769, 768, 774) AND doc_live_link IS NOT NULL AND doc_live_link != '' AND doc_bsn_id = ".$bsn_id."
 UNION ALL
 SELECT psrpd_doc_name AS document_name, psrpd_doc_link AS document_link FROM psr_public_documents WHERE psr_bsn_id = ".$bsn_id;
$data_public_documents = $fwDb->query($sql_public_documents);
$fwViewData['public_documents'] = $data_public_documents;

$public_doc = [];
foreach ($data_public_documents as $doc) {
    $public_doc[$doc['document_name']] = $doc['doc_live_link'];
}

//echo "<pre>"; print_r($data_public_documents); exit();

$selected_documents_raw = $fwRequest->getParam('documents', '');
$selected_documents = [];

if (is_array($selected_documents_raw)) {
    $selected_documents = $selected_documents_raw;
} elseif (!empty($selected_documents_raw)) {
    $selected_documents = explode(',', $selected_documents_raw);
}

$documents_list_html = '';
if (!empty($selected_documents)) {
    $documents_list_html .= '<ul style="margin-bottom: 25px;">';
	foreach ($selected_documents as $document) {
		$document = trim($document);
		if (isset($public_doc[$document])) {
			$documents_list_html .=
				'<li>
					<a href="' . htmlspecialchars($public_doc[$document]) . '" target="_blank">
						' . htmlspecialchars($document) . '
					</a>
				</li>';
		} else {
			$documents_list_html .=
				'<li>' . htmlspecialchars($document) . '</li>';
		}
	}
	$documents_list_html .= '</ul>';
} else {
    $documents_list = '';
}

$sql_property_address = "SELECT bsn_address FROM business where bsn_id = ".$bsn_id;
$data_property_address = $fwDb->queryOne($sql_property_address);

$sql_notes = "SELECT * FROM psr_enquiry_notes";
$data_notes = $fwDb->query($sql_notes);

$en_notes = [];
foreach($data_notes as $notes){
	$en_notes[$notes['psren_psre_id']][] = $notes;
}

$query = "SELECT * from properties_sale_reports_enquiries where psre_bsn_id = ".$bsn_id." and psre_id = ".$psre_id;
$results = $fwDb->query($query);

//echo "<pre>"; print_r($results); exit();

$html = '';
$html .= '<p>Dear '.$results[0]['psre_enquiry_name'].',</p>';
$html .= '<p>Thank you for your interest in '.$data_property_address['bsn_address'].'</p>';
$html .= '<p>Please click on the link(s) below to access the documents you have requested:</p>';
$html .= $documents_list_html;
$html .= '';


$html .= '<p>Regards,</p>';
$html .= '<p><span style="font-family:calibri;"><span style="font-family:calibri;font-size:12pt"><span style="font-family:calibri;color:#203864">Frank Walmsley <span style="font-family:calibri;color:#203864">|</span> Auction Advantage</span><br>
<span style="font-family:calibri;color:#203864">Phone: 0400 446 605 <span style="font-family:calibri;color:#203864">|</span> Fax: 1300 979 657</span><br>
<span style="font-family:calibri;color:#203864">Postal: Unit 11/160 Lysaght Street, Mitchell ACT 2911</span><br>
</span></span></p>';
$html .= '<p><img src="'.BASE_URL.'images/auction_advantage_sign_footer2.png"></p>';

$message = '
<html>
<head>
<style>
* {
	font-family: calibri;
	font-size:11pt;
}
p {
	margin-bottom: 20px;
}
li {
	margin-bottom: 5px;
}
form {
	margin-bottom: 50px;
}
</style>
</head>

<body>

'.$html.'

</body>
</html>
';

//$fwViewData['email_preview'] = $message;

if($show_preview){
	
	$selected_documents = $fwRequest->getParam('documents', '');
	$selected_documents_str = '';
	if (is_array($selected_documents) && !empty($selected_documents)) {
		$selected_documents_str = implode(',', $selected_documents);
	}

	$fwViewData['show_preview'] = $show_preview;
	$fwViewData['email_preview'] = $message;
	$fwViewData['selected_documents_str'] = $selected_documents_str;
}

$submit = $fwRequest->getParam('send', '');
if(!empty($submit))
{

	$emailObj = new EmailClass;
	$emailObj->addFrom('contact@auctionadvantage.com.au', 'Auction Advantage Team');
	
	$emailObj->subject = $data_property_address['bsn_address']." - Property Documents";
	$emailObj->message = $message;
	
	//$emailObj->addTo('supportmanager@cgfb.com.au', 'Support Manager');
	//$emailObj->addCC('contact@auctionadvantage.com.au', 'Auction Advantage Team');
	
	$emailObj->addBCC('emailbackup@cgfb.com.au', 'Email Backup Admin (CGFB)');
	
	$emailObj->addTo($results[0]['psre_email_address'], $results[0]['psre_enquiry_name']);

	$emailObj->attachments = [];
	
	$response = $emailObj->sendEmail();
	
	$statusText = $response['success'] ? 'Sent' : 'Failed: ' . $response['message'];
	
	if ($response['success']) {
		$opr = true;
		
		$logData = array(
			'psre_document_sent' => 1,
			'psre_document_sent_user' => $usr,
			'psre_document_sent_date' => $dt,
			'psre_enquiry_user' => $usr,
			'psre_enquiry_date' => $dt
		);
		$table->setWhere("psre_id = $psre_id");
		$table->updateRow($logData);
		
		$note = "Document Email sent to buyer via GCON";
		$noteDate = date('Y-m-d H:i:s');
		$logDataNotes = array(
			'psren_psre_id' => $psre_id,
			'psren_notes' => $note,
			'psren_created_by' => $user_id,
			'psren_created_at' => $noteDate
		);
		$tableNotes = new Fw_Db_Table('psr_enquiry_notes');
		$tableNotes->insertRow($logDataNotes);
		
		if (!empty($results[0]['psre_phone_number'])){
			$textusername = "manojsoniephp";
			$textpassword = "jaimatadi108";
			
			$message = "We have sent you the documents for the property via email from contact@auctionadvantage.com.au. Kindly check your inbox or spam folder. - Auction Advantage Team";
			
			$type = "1-way";
			$senderid = "CGFB";
			//$senderid = "AuctionAdv";
			$to = preg_replace('/\D/', '', $results[0]['psre_phone_number']);

			// Send SMS
			$url = "http://api.directsms.com.au/s3/http/send_message?" .
				   "username=" . urlencode($textusername) . "&" .
				   "password=" . urlencode($textpassword) . "&" .
				   "message=" . urlencode($message) . "&" .
				   "type=" . urlencode($type) . "&" .
				   "senderid=" . urlencode($senderid) . "&" .
				   "to=" . urlencode($to);
				   
			$output = file($url);
			//print_r($output);exit();
		}
		
	}
	
	$fwViewData['opr'] = $opr;

	/* $logData = array(
		'elcceh_client_name' => $customerName,
		'elcceh_client_contact' => $customerEmail,
		'elcceh_project' => $customerProject,
		'elcceh_message' => $html,
		'elcceh_status' => $statusText
	);

	$emailLogTable = new Fw_Db_Table('email_history');
	$emailLogTable->insertRow($logData); */
}