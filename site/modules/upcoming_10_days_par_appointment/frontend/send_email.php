<?php

$emails = $_POST['emails'];
$emailList = array_map('trim', explode(',', $emails));

$styles = '
<style>
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
h3 { 
    margin-top: 20px;
    font-size: 13px;
}
</style>';


$message = '<html><head>'.$styles.'</head><body>';
$message .= isset($_POST['message']) ? $_POST['message'] : '';
$message .= '<p>';
		$message .= 'Thanks & Regards, <br/>';
		$message .= '<span style="color:rgb(85,142,213)">Support Sales Initial</span> <span style="color:rgb(255,192,0)"><b>|</b></span> <span style="color:rgb(85,142,213)">Canberra Granny Flat Builders & Fixed Price Extensions</span> <br/>';
		$message .= '<span style="color:rgb(85,142,213)">Phone: 1300 979 658</span> <span style="color:rgb(255,192,0)"><b>|</b></span> <span style="color:rgb(85,142,213)">Fax: 1300 979 657</span> <br/><span style="color:rgb(85,142,213)">Postal: GPO Box 2265 Canberra City 2602</span> <br/><span style="color:rgb(85,142,213)">ACT Building Lic: 2012767</span>';
		$message .= '</p>';

		$message .= '<p><img src="' . BASE_URL . 'images/cgfb_sign_footer.png"/></p>';

//echo $message; exit();

$toname = "";
$subject = "Upcoming 10 Days PAR Appointment Email in Advance - ".date("d-m-Y");
$serializeAttc = serialize([]); // no attachments

foreach ($emailList as $toEmail) {

    if (!filter_var($toEmail, FILTER_VALIDATE_EMAIL)) {
        continue;
    }

    send_email('', $toEmail, 'Support Sales (CGFB)', 'supportsales@cgfb.com.au', $subject, $message, $serializeAttc);
	//send_email('', $toEmail, 'Support Sales (CGFB)', 'supportsales@cgfb.com.au', $subject, 'Test', $serializeAttc);
}

echo "success";
exit;
?>
