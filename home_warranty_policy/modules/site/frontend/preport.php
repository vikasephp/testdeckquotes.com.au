<?php	
$report_type = $fwRequest->getParam('report_type', 0);

function send_report_admin($repotype)
	{
	switch($repotype)
		{
		case 1:
		$type = "Daily";
		break;
		
		case 2:
		$type = "Weekly";
		break;
		}
	$repopath = generate_All_user_production_report($repotype);
	$toname = "Sales: ".SITE_NAME;
	//$email = "sales@capitalcommercial.com.au";	
	$email = SITE_EMAIL_SEND;
	$email = "dharmendrap@ephpsolutions.com";

	$fromname = SITE_NAME;
	$from = "support@turnkeydecks.com.au";
	$subject = SITE_NAME." - ".$type." all users production report.";
	$message = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
				<html xmlns="http://www.w3.org/1999/xhtml">
				<head>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
				<title>'.$subject.'</title>
				</head>
				<body>
					<div>
						<p>Dear Sir,</p>
						<p>Kindly find attached '.$type.' all users production report.</p>
						<p>Regards,<br>
						'.SITE_NAME.'
						</p>
					</div>
				</body>
				</html>';
				
	if($repopath){			
	$attach[] = BASE_URL.FILE_PATH."files/user_reports/".$repopath;
	$attachment = serialize($attach);
	}
	
	
send_email($toname, $email, $fromname, $from, $subject, $message, $attachment);

	return $type;
	}
if($report_type > 0)
	{	
	
	
print(send_report_admin($report_type));
	}
exit;

