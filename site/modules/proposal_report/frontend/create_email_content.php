<?php
$fwMainView = 'file:' . getcwd() . '/create_email_content.tpl';

$bsn_id = $fwRequest->getParam('bsn_id', '');
$fwViewData['bsn_id'] = $bsn_id;

// Fetch submitted form data
$show_preview = $fwRequest->getParam('show_preview', '');
$fwViewData['show_preview'] = $show_preview;

$message = $fwRequest->getParam('message', '');
$more_proposal_number = $fwRequest->getParam('more_proposal_number', '');

//$selected_documents = $fwRequest->getParam('documents', '');
$selected_documents_raw = $fwRequest->getParam('documents', '');
$selected_documents = [];

if (is_array($selected_documents_raw)) {
    // From checkbox submit
    $selected_documents = $selected_documents_raw;
} elseif (!empty($selected_documents_raw)) {
    // From hidden input (comma-separated string)
    $selected_documents = explode(',', $selected_documents_raw);
}

$documents_list_html = '';
if (!empty($selected_documents)) {
    $documents_list_html .= '<ul style="margin-bottom: 25px;">';
	foreach ($selected_documents as $document) {
        $documents_list_html .= '<li>' . htmlspecialchars($document) . '</li>';
    }
	$documents_list_html .= '</ul>';
} else {
    $documents_list = '';
}

$sql_info = 'SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, business.bsn_address, business.bsn_proj_salu, bus_customers.bcust_misc_email1, bus_customers.bcust_misc_moble, bus_customers.bcust_fname, bus_customers.bcust_lname FROM `business_sellers` left join bus_customers on bus_customers.bcust_id = business_sellers.bs_customers_id left join business on business.bsn_id = business_sellers.bs_business_id where business_sellers.bs_business_id = '.$bsn_id;
$data_info = $fwDb->queryOne($sql_info);
//$customer_name = $data_info['bcust_fname'] ." ".$data_info['bcust_lname'];
$customer_name = $data_info['bcust_fname'];
$email_saluation = $data_info['bsn_proj_salu'];
$customer_email = $data_info['bcust_misc_email1'];
$customer_phone = $data_info['bcust_misc_moble'];
$customer_address = $data_info['bsn_address'];

//$sql_proposal_number = 'SELECT business_sellers.bs_business_id, document_proposal_name.dpn_unique_id from business_sellers Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id Inner Join business ON business_sellers.bs_business_id = business.bsn_id Inner Join document_proposal_name On business_sellers.bs_business_id = document_proposal_name.dpn_bsn_id WHERE document_proposal_name.dpn_pbns_hide = 1 and business_sellers.bs_business_id = '.$bsn_id;
$sql_proposal_number = 'SELECT document_proposal_name.dpn_bsn_id, document_proposal_name.dpn_unique_id from document_proposal_name LEFT JOIN business ON business.bsn_id = document_proposal_name.dpn_bsn_id WHERE document_proposal_name.dpn_pcp_show = 1 and document_proposal_name.dpn_pcp_hide = 0 and business.bsn_id = '.$bsn_id;
$data_proposal_number = $fwDb->query($sql_proposal_number);
$checklist_number = [];
foreach ($data_proposal_number as $row) {
    $checklist_number[] = $row['dpn_unique_id'];
}
$checklist_number_list = implode(', ', $checklist_number);

if (empty($checklist_number_list)) {
    $checklist_number_list = '';
}
//echo $checklist_number_list;
//echo "<pre>"; print_r($checklist_number_list); exit();

$docTable = new Fw_Db_Table("proposal_report_doc_name");
$fwViewData['docnamedata'] = $docTable->getAllRows();
//echo "<pre>"; print_r($fwViewData['docnamedata']); exit();

$current_date = date('d-m-Y');

$subject = 'Your Approved Proposals Are Now Available - Checklist ' .$checklist_number_list;
if (!empty($more_proposal_number)) {
    $subject .= ', ' . $more_proposal_number;
}
$subject .= ' - ' . $customer_address;

$email_content = '<p style="margin-bottom: 15px;">'.$email_saluation.', </p>';
$email_content .= '<p style="margin-bottom: 15px;">We are pleased to inform you that your <strong>Approved Proposals for Checklist '.$checklist_number_list;
if (!empty($more_proposal_number)) {
    $email_content .= ', ' . $more_proposal_number;
}
$email_content .= '</strong> have been uploaded to the Planning Approvals Canberra portal.</p>';
$email_content .= '<p style="margin-bottom: 15px;">You can now view the latest updates, proposal brochures, and all relevant documentation directly through the portal.</p>';
$email_content .= '<p style="margin-bottom: 15px;">Included in the package is as per below </p>';
$email_content .= $documents_list_html;
$email_content .= '<p style="margin-bottom: 15px;">'.$message.'</p>';
$email_content .= '<p style="margin-bottom: 15px;">Please find below the access details: </p>';
$email_content .= '<p style="margin-bottom: 15px;"><strong>Portal Link:</strong> https://planningapprovalscanberra.com.au/login </p>';
$email_content .= '<p style="margin-bottom: 15px;"><strong>Email/Username:</strong> '.$customer_email.'</p>';
$email_content .= '<p style="margin-bottom: 15px;"><strong>Number/Password:</strong> '.$customer_phone.'</p>';
$email_content .= '<p style="margin-bottom: 15px;">To stay up to date with your projects progress, simply visit https://planningapprovalscanberra.com.au and log in using the credentials above.</p>';
$email_content .= '<p style="margin-bottom: 15px;">We hope this information is helpful. If you have any questions or need further assistance, please do not hesitate to reach out.</p>';
$email_content .= '<p style="margin-bottom: 15px;">';
$email_content .= '<span style="margin-bottom: 5px; display: inline-block;">Thanks & Regards,</span> <br/>';
$email_content .= '<span style="color:rgb(85,142,213);">Proposal Team</span> <span style="color:rgb(255,192,0)"><b>|</b></span> <span style="color:rgb(85,142,213)">Canberra Fixed Price & Granny Flat Builders</span> <br/>';
$email_content .= '<span style="color:rgb(85,142,213)">Phone: 1300 979 658</span> <span style="color:rgb(255,192,0)"><b>|</b></span> <span style="color:rgb(85,142,213)">Fax: 1300 979 657</span> <br/><span style="color:rgb(85,142,213)">Postal: GPO Box 2265 Canberra City 2602</span> <br/><span style="color:rgb(85,142,213)">ACT Building Lic: 2012767</span>';
$email_content .= '</p>';

$email_content .= '<p><img src="' . BASE_URL . 'images/cgfb_sign_footer.png"/></p>';

$fwViewData['email_content'] = $email_content;

//$to = $customer_email;
$from_name = "Proposal Team";
$from_email = "CalculatorandProposals@cgfb.com.au";

if($show_preview){
	
	$selected_documents = $fwRequest->getParam('documents', '');
	$selected_documents_str = '';
	if (is_array($selected_documents) && !empty($selected_documents)) {
		$selected_documents_str = implode(',', $selected_documents);
	}
	
	$fwViewData['show_preview'] = $show_preview;
	$fwViewData['email_content'] = $email_content;
	
	$fwViewData['message'] = $message;
	$fwViewData['more_proposal_number'] = $more_proposal_number;
	$fwViewData['selected_documents_str'] = $selected_documents_str;
}

$sql_email_rec = "SELECT bus_customers.bcust_misc_email1, bus_customers.bcust_misc_email2, bus_customers.bcust_misc_email3, bus_customers.bcust_misc_email4, bus_customers.bcust_misc_email5 FROM `business_sellers` left join bus_customers on bus_customers.bcust_id = business_sellers.bs_customers_id left join business on business.bsn_id = business_sellers.bs_business_id where business_sellers.bs_business_id = ".$bsn_id;
$data_email_rec = $fwDb->queryOne($sql_email_rec);

$send_email = $fwRequest->getParam('send_email', '');
if (!empty($send_email) && !empty($data_email_rec)) {
    $email_content = $fwViewData['email_content'];
    $serializeAttc = '';

	$uni_emails = array_unique(array_filter($data_email_rec));
	
	foreach ($uni_emails as $to) {
		send_email('', $to, $from_name, $from_email, $subject, $email_content, $serializeAttc);
	}

    $fwViewData['success'] = 'Email sent successfully!';
}
