<?php

$sql = "SELECT * FROM warranty_log WHERE wa_status = 'Open' GROUP BY wa_project ";

$Data = $fwDb->query($sql);

foreach ($Data as $k => $v) {

	$sq11 = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname,
	         bus_customers.bcust_lname, bus_customers.bcust_misc_email1, bcust_misc_email2, bus_customers.bcust_misc_moble
			 from business_sellers 		
			 Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			 Inner Join business ON business_sellers.bs_business_id = business.bsn_id where business.bsn_name = '" . $v['wa_project'] . "'";

	$contact = $fwDb->queryOne($sq11);

	$html = "<html><body>";
	$html .= "<p>Hi " . $contact['bcust_fname'] . " " . $contact['bcust_lname'] . "</p>";

	$html .= "<p>Your warranty issues can now be viewed in our <a href = 'https://www.warrantyreport.com.au/'>Warranty Report Website</a>. You may use your email address and phone number to log in:";

	$html .= "<p>Email :" . $contact['bcust_misc_email1'] . "</p>";
	$html .= "<p>Phone Number :" . $contact['bcust_misc_moble'] . "</p>";
	$html .= '<img src="https://www.deckquotes.com.au/images/login.png"><br>';
	$html .= '<img src="https://www.deckquotes.com.au/images/login_form.png"><br>';

	$html .= "<p>Regards,</p>";
	$html .= "<p>CGFB Warranty Team</p>";
	$html .= "</body></html>";

	$to = $contact['bcust_misc_email1'];
	$toname = $contact['bcust_fname'];

	//$to = "manojsoniephp@gmail.com";

	send_email($toname, $to, 'CGFB', 'warranty@cgfb.com.au', 'CGFB - Warranty Report Website Is Now Live', $html, $attachment = '');

	// If secondary email exists - send email to it
	if($contact['bcust_misc_email2']){
		$to_secondary = $contact['bcust_misc_email2'];
		send_email($toname, $to_secondary, 'CGFB', 'warranty@cgfb.com.au', 'CGFB - Warranty Report Website Is Now Live', $html, $attachment = '');
	}
	//db($html);


}





exit;
