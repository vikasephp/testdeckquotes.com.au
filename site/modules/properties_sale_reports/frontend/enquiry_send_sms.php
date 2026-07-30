<?php
$fwMainView = 'file:' . getcwd() . '/enquiry_send_sms.tpl';
$table = new Fw_Db_Table('properties_sale_reports_enquiries');

$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);
$psre_id = (int)$fwRequest->getParam('psre_id', 0);

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];

$fwViewData['bsn_id'] = $bsn_id;

// Fetch submitted form data
$show_preview = $fwRequest->getParam('show_preview', '');
$fwViewData['show_preview'] = $show_preview;

$sql_sms_template = "Select * from psr_enquiry_sms_templates";
$data_sms_template = $fwDb->query($sql_sms_template);
$fwViewData['sms_template'] = $data_sms_template;

$sql_notes = "SELECT * FROM psr_enquiry_notes";
$data_notes = $fwDb->query($sql_notes);

$query = "SELECT * from properties_sale_reports_enquiries where psre_bsn_id = ".$bsn_id." and psre_id = ".$psre_id;
$results = $fwDb->query($query);

$fwViewData['first_name'] = $results[0]['psre_enquiry_name'];

//echo "<pre>"; print_r($results); exit();

if($show_preview){

	//echo "<pre>"; print_r($_POST); exit();
	$sms_template_num = $fwRequest->getParam('sms_template', '');
	$fwViewData['sms_template_num'] = $sms_template_num;
	
	$sql_stemp = "SELECT * FROM psr_enquiry_sms_templates where psrest_id = ".$sms_template_num ;
	$data_stemp = $fwDb->query($sql_stemp);
	
	//echo "<pre>"; print_r($data_stemp); exit();
	
	$fwViewData['sms_temp'] = $data_stemp[0]['psrest_id'];
	$fwViewData['sms_temp_content'] = $data_stemp[0]['psrest_template'];
	
	$fwViewData['show_preview'] = $show_preview;
}

$submit = $fwRequest->getParam('send', '');
if(!empty($submit))
{

	if (!empty($results[0]['psre_phone_number'])){
		$textusername = "manojsoniephp";
		$textpassword = "jaimatadi108";
		
		$sms_temp = $fwRequest->getParam('sms_temp', '');
		$message = $fwRequest->getParam('sms_temp_content', '');
		$full_message = "Hi ".$results[0]['psre_enquiry_name'].", ". $message;
		
		$type = "1-way";
		$senderid = "CGFB";
		$to = preg_replace('/\D/', '', $results[0]['psre_phone_number']);
		//$to = "61485982524"; //This is testing number

		// Send SMS
		$url = "http://api.directsms.com.au/s3/http/send_message?" .
			   "username=" . urlencode($textusername) . "&" .
			   "password=" . urlencode($textpassword) . "&" .
			   "message=" . urlencode($full_message) . "&" .
			   "type=" . urlencode($type) . "&" .
			   "senderid=" . urlencode($senderid) . "&" .
			   "to=" . urlencode($to);
			   
		$output = file($url);
		//print_r($output);exit();
		$opr = true;
		
		$logData = array(
			'psre_sms_send' => 1,
			'psre_sms_send_by' => $usr,
			'psre_sms_send_at' => $dt
		);
		$table->setWhere("psre_id = $psre_id");
		$table->updateRow($logData);
		
		$logSMSHistoryData = array(
			'psresh_psre_id' => $psre_id,
			'psresh_bsn_id' => $bsn_id,
			'psrest_sms_template' => $sms_temp,
			'psresh_sms_message' => $full_message,
			'psresh_sms_sent_by' => $usr,
			'psresh_sms_sent_to' => $to
		);
		$smsHistory_Table = new Fw_Db_Table("psr_enquiry_sms_history");
		$smsHistory_Table->insertRow($logSMSHistoryData);
	}
	
	$fwViewData['opr'] = $opr;

}