<?php
$fwMainView = 'file:' . getcwd() . '/email_preview.tpl';
$table = new Fw_Db_Table('document_proposal_name');

$dpn_unique_id = (int)$fwRequest->getParam('dpn_unique_id', 0);

require_once LIB_DIR . 'EmailClass.php';

$sql_cname = "SELECT * FROM design_team";
$data_cname = $fwDb->query($sql_cname);

$cnameData = [];
foreach($data_cname as $cname) {
	$cnameData[$cname['de_id']] = $cname;
}

$query = "SELECT * from document_proposal_name where dpn_unique_id = ".$dpn_unique_id;
$results = $fwDb->query($query);

$query_customer = "SELECT b.bsn_id, b.bsn_address, CONCAT(bc.bcust_fname, ' ', bc.bcust_lname) AS customer_name, bc.bcust_misc_email1 AS customer_email FROM `business` b JOIN `business_sellers` bs ON bs.bs_business_id = b.bsn_id JOIN `bus_customers` bc ON bc.bcust_id = bs.bs_customers_id WHERE b.bsn_id = ".$results[0]['dpn_bsn_id'];
$customerData = $fwDb->query($query_customer);

$log_bsn = $customerData[0]['bsn_id'];
$customerProject = $customerData[0]['bsn_address'];
$customerName = $customerData[0]['customer_name'];
$customerEmail = $customerData[0]['customer_email'];

$html = '';
$html .= '<p>Dear ' . $customerName . ',</p>';
$html .= '<p>Please find below the Current Estimate Summary details for your project:</p>';

$html .= '<ul>';
$html .= '<li>Project Address: '.$customerProject.'</li>';
$html .= '<li>Client Name: '.$customerName.'</li>';
$html .= '<li>Designer Name: '.$results[0]['dpn_customer_designer'].'</li>';
$html .= '<li>Revision Number: '.$results[0]['dpn_dr_plan_revno'].'</li>';
$html .= '<li>Build Estimate Cost: '.$results[0]['dpn_dr_estimate_cost'].'</li>';
$html .= '<li>Site Scope Estimate Cost: '.$results[0]['dpn_dr_likely_value'].'</li>';
$html .= '<li>Renovation Estimate: '.$results[0]['dpn_dr_erc'].'</li>';
$html .= '<li>Last Audited Date: '.$results[0]['dpn_last_audit_update_at'].'</li>';
$html .= '<li>Audited By: '.$cnameData[$results[0]['dpn_last_audit_by']]['de_name'].'</li>';
$html .= '</ul>';

$html .= '<p>Should you have any questions or require further clarification, please feel free to reach out.</p>';

$html .= '<p>Kind regards,</p>';
$html .= '<p><span style="font-family:calibri"><span style="font-size:12pt"><span style="color:#3db3e5">Designs Team <span style="color:#edaa02">|</span> Canberra Fixed Price Extensions & Granny Flat Builders</span><br>
<span style="color:#3db3e5">Phone: 1300 979 658 <span style="color:#edaa02">|</span> Fax: 1300 979 657</span><br>
<span style="color:#3db3e5">Postal: GPO Box 2265 Canberra City 2602</span><br>
<span style="color:#3db3e5">ACT Building Lic: 2012767</span></span></span></p>';
$html .= '<p><img src="'.BASE_URL.'images/cgfb_sign_footer.png"></p>';

$fwViewData['email_preview'] = $html;

$submit = $fwRequest->getParam('send', '');
if(!empty($submit))
{
	if(!empty($customerEmail)) {
		
		$emailObj = new EmailClass;
		$emailObj->addFrom('designs@cgfb.com.au', 'Design Team');
		
		$emailObj->subject = "Current Estimate Summary details - ".$dpn_unique_id." - ".$customerProject;
		$emailObj->message = $html;
		
		//$emailObj->addTo($customerEmail, $customerName);
		$emailObj->addTo('rahul@ephpsolutions.com', 'Rahul');
		$emailObj->addTo('supportmanager@cgfb.com.au', 'Support Manager');
		$emailObj->addTo('CalculatorandProposals@cgfb.com.au', 'Calculatorspecialist');
		$emailObj->addTo('DesignsandPlanning@cgfb.com.au', 'Designs and Planning');
		//$emailObj->addCC('designs@cgfb.com.au', 'Design Team');
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
}