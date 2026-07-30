<?php
$fwMainView = 'file:' . getcwd() . '/enquiry_email_preview.tpl';
$table = new Fw_Db_Table('properties_sale_reports_enquiries');

$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);

$fwViewData['bsn_id'] = $bsn_id;

require_once LIB_DIR . 'EmailClass.php';

$sql_property_address = "SELECT bsn_address FROM business where bsn_id = ".$bsn_id;
$data_property_address = $fwDb->queryOne($sql_property_address);

$sql_notes = "SELECT * FROM psr_enquiry_notes ORDER BY psren_created_at DESC";
$data_notes = $fwDb->query($sql_notes);

$en_notes = [];
foreach($data_notes as $notes){
	$en_notes[$notes['psren_psre_id']][] = $notes;
}

$query = "SELECT * from properties_sale_reports_enquiries where psre_bsn_id = ".$bsn_id." ORDER BY CASE psre_status WHEN 'Warm' THEN 1 WHEN 'Active' THEN 2 WHEN 'Cold' THEN 3 ELSE 4 END";
$results = $fwDb->query($query);

$html = '';
$html .= '<table class="et_table">';
$html .= '<thead>';
$html .= '<tr>';
$html .= '<th width="20%">Enquiry Name</th>';
$html .= '<th width="15%">Date of Enquiry</th>';
$html .= '<th width="15%">Status</th>';
$html .= '<th width="50%">Notes</th>';
$html .= '</tr>';
$html .= '</thead>';
$html .= '<tbody>';

if($results){
	//echo "<pre>"; print_r($results); exit();
	foreach($results as $k => $v){
		//echo "<pre>"; print_r($en_notes[$v['psre_id']]); exit();
		$html .= '<tr>';
		$html .= '<td>'.$v['psre_enquiry_name'].' '.$v['psre_enquiry_name_last'].'</td>';
		$html .= '<td>'.$v['psre_date_of_enqury'].'</td>';
		$html .= '<td>'.$v['psre_status'].'</td>';
		//$html .= '<td>'.$en_notes[$v['psre_id']]['psren_notes'].'</td>';
		
		$html .= '<td>';
			if(isset($en_notes[$v['psre_id']])){
				foreach($en_notes[$v['psre_id']] as $note){
					$html .= '<table width="100%"><tr><td>';
					$html .= $note['psren_notes']. ' - '.date('d/m/Y', strtotime($note['psren_created_at'])).'<br/>';
					$html .= '</td></tr></table>';
				}
			} else {
				$html .= 'No Notes';
			}
		$html .= '</td>';
		
		$html .= '</tr>';
	}
} else{
	$html .= '<tr><td colspan="4">No Data Available</td></tr>';
}

$html .= '</tbody>';
$html .= '</table>';

$html .= '<p>Kind regards,</p>';
$html .= '<p><span style="font-family:calibri;"><span style="font-family:calibri;font-size:12pt"><span style="font-family:calibri;color:#203864">Auction and CCBS Team <span style="font-family:calibri;color:#203864">|</span> Auction Advantage</span><br>
<span style="font-family:calibri;color:#203864">Phone: 0400 446 605 <span style="font-family:calibri;color:#203864">|</span> Fax: 1300 979 657</span><br>
<span style="font-family:calibri;color:#203864">Postal: Unit 11/160 Lysaght Street, Mitchell ACT 2911</span><br>
</span></span></p>';
$html .= '<p><img src="'.BASE_URL.'images/auction_advantage_sign_footer2.png"></p>';

$message = '
<html>
<head>
<style>
thead tr th {
    text-align: left;
}
.et_table, p {
	margin-bottom: 20px;
}
li {
	margin-bottom: 5px;
}
form {
	margin-bottom: 50px;
}
.et_table {
	width: 100%;
	border-collapse: collapse;
	table-layout: fixed;
}
.et_table th, .et_table td {
	border: 1px solid #ccc;
	padding: 8px;
	text-align: left;
	word-wrap: break-word;
	overflow-wrap: break-word;
	font-size: 12px;
	padding: 5px;
}
.et_table th{
	text-align: center;
	font-weight: bold;
}
.et_table td{
	font-weight: normal;
	text-align: left;
}
</style>
</head>

<body>

'.$html.'

</body>
</html>
';

$fwViewData['email_preview'] = $message;

$emails = $fwRequest->getParam('to', '');
$emailList = array_filter(array_map('trim', explode(',', $emails)));

$submit = $fwRequest->getParam('send', '');
if(!empty($submit))
{
		
	$emailObj = new EmailClass;
	$emailObj->addFrom('contact@auctionadvantage.com.au', 'Auction Advantage Team');
	
	$emailObj->subject = "Buyer Summary Email - ".$data_property_address['bsn_address']." - ".date('d M Y');
	$emailObj->message = $message;
	
	//$emailObj->addCC('supportmanager@cgfb.com.au', 'Support Manager');
	$emailObj->addBCC('emailbackup@cgfb.com.au', 'Email Backup Admin (CGFB)');
	
	foreach ($emailList as $toEmail) {
		if (filter_var($toEmail, FILTER_VALIDATE_EMAIL)) {
			$emailObj->addTo($toEmail, $toEmail);
		}
	}

	$emailObj->attachments = [];
	
	$response = $emailObj->sendEmail();
	
	$statusText = $response['success'] ? 'Sent' : 'Failed: ' . $response['message'];
	
	if ($response['success']) {
		$opr = true;
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