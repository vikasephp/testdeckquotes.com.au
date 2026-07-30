<?php

$sql_1 = "Select * from supplier_email  where se_auto_email = 1 group by se_email";
$Data_1 = $fwDb->query($sql_1);

//db($Data_1);

foreach ($Data_1 as $k1 => $v1) {
	$sql_2 = "select  * from construction_alert_report where car_incl_supp_email like '%" . $v1['se_email'] . "%'";
	$Data_2 = $fwDb->query($sql_2);
	//db($Data_2);

	$supplier = $v1['se_supplier'];
	$to = $v1['se_email'];
	$to_name = $supplier;
	$from = "operations@cgfb.com.au";
	$from_name = "Operations team";
	$subject = "Construction Report Of Your Project ";

	$html = '';
	$html .= 'Dear ' . $supplier . ",<br><br>";
	$html .= "Here is the construction alert report of your projects: <br>";
	foreach ($Data_2 as $k2 => $v2) {
		$sql = 'SELECT  business_sellers.bs_business_id, bus_customers.bcust_misc_email1, bus_customers.bcust_fname, 
			bus_customers.bcust_lname, business.bsn_id, business.bsn_name from business_sellers 		
			Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
			WHERE business.bsn_name LIKE "%' . $v2['car_project'] . '%"  group by bsn_id';

		$data = $fwDb->queryOne($sql);
		$toname = $data['bcust_fname'] . " " . $data['bcust_lname'];


		$html .= '<table width="100%" cellpadding="5" border="1">';
		$html .= '<tr><td colspan="2" style="text-align:center; background-color:yellow;"> Record Number : ' . $v2['car_id'] . '</td></tr>';
		$html .= '<tr><td>Project</td><td>' . $v2['car_project'] . '</td></tr>';
		$html .= '<tr><td>Contact Info</td><td>' . $toname . '</td></tr>';
		$html .= '<tr><td>Date</td><td>' . $v2['car_date'] . '</td></tr>';
		$html .= '<tr><td>Supplier</td><td>' . $v1['se_supplier'] . '</td></tr>';
		$html .= '<tr><td>Type</td><td>' . $v2['car_type'] . '</td></tr>';

		$html .= '<tr><td>Responsible Staff</td><td>' . $v2['car_resp_staff'] . '</td></tr>';
		$html .= '<tr><td>Alert Message</td><td>' . $v2['car_alert'] . '</td></tr>';

		$html .= '</table><br>';
	}
	$html .= "Regards,<br>CGFB Operation Team";

	db($html);
	//$to = "manojsoniephp@gmail.com";
	send_email($toname, $to, 'CGFB', 'operations@cgfb.com.au', $subject, $html, $attachment = '');
	//send_email($toname, 'manojsoniephp@gmail.com', 'CGFB', 'operations@cgfb.com.au', $subject, $html, $attachment='');
}
exit;
