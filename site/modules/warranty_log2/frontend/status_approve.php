<?php
$fwMainView = 'file:' . getcwd() . '/status_approve.tpl';
$table = new Fw_Db_Table('warranty_log');

$wa_id = (int)$fwRequest->getParam('wa_id', 0);
$fwViewData['wa_id']  = $wa_id;

$submit = $fwRequest->getParam('subAddDetail', '');
if (!empty($submit)) {
	$status = $fwRequest->getParam('approve', array());

	if ($status == 'Yes') {
		$detail['wa_status'] = 'Closed';
		$detail['wa_status_date'] = date('d-m-Y');

		// $message = '<html><body>';
		// $message .= '<p>Hi Warranty Manager</p><br>';
		// $message .= '<p>A warranty log has been recently closed.</p><br>';
		// $message .= '<p><strong>Warranty ID:</strong> ' . $data['wa_id'] . '</p>';
		// $message .= '<p><strong>Project Address:</strong> ' . $data['wa_project'] . '</p>';
		// $message .= '<p><strong>Problem:</strong> ' . $data['wa_problem'] . '</p><br>';
		// $message .= '<p>If this warranty issue persist, please return here to reopen the log</p><br>';
		// $message .= '<p>Regards,</p>';
		// $message .= '<p>CGFB Warranty Team</p>';

		// $to1 = 'warranty@cgfb.com.au';
		// $to2 = 'info@cgfb.com.au';
		// $toname = 'Warranty Team';
		// $subject = 'Warranty Issue Closed';

		// //$to = 'manojsoniephp@gmail.com';

		
		// $nameoffile = 'warranty_log';
		// $filename = $nameoffile."_".date('d_m_Y').".pdf";
		// $filepath = 'reports/'.$filename;
		// $filepath_url =BASE_URL.$filepath;
		// $attachment = [];
		// $attachment[] = $filepath_url;
		// $serializeAttc = serialize($attachment);
		// send_email($toname, $to1, 'CGFB Warranty Team', 'warranty@cgfb.com.au', $subject, $message2, $serializeAttc);
		// send_email($toname, $to2, 'CGFB Warranty Team', 'warranty@cgfb.com.au', $subject, $message2, $serializeAttc);

	} else {
		$detail['wa_status'] = 'Open';
	}

	$table->setWhere("wa_id = $wa_id");
	$opr = $table->updateRow($detail);


	$fwViewData['opr'] = "Status has been updated successfully";
}
