<?php




$message = "<html><body>";
$message .="<h2> This is a testing message </h2>";
$message .= "</body></html>";


		

if(send_email('Vikas Gupta', 'vickygondia1@gmail.com', 'ephp', 'info@cgfb.com.au', 'Test Email Check', $message, $attachment=''))
{
	echo "Email Sent successfuly to vickygondia1@gmail.com";	
}

send_email('Manoj Soni', 'manojsoniephp@gmail.com', 'CGFB', 'info@cgfb.com.au', 'Test Email Check', $message, $attachment='');

exit;
	