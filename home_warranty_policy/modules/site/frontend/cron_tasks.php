<?php	 
$sedmail = 0;
$tableUserreport =  new Fw_Db_Table('user_reports');
$rtype = $fwRequest->getParam('rt', 0);
$reportemail = "service@turnkeydecks.com.au"; 

switch($rtype):

		case 1:
		$project_status = 2;
		$reporttype = "Preparation and Planning Daily Report";	
		$reportemail = "accounts@turnkeydecks.com.au"; 
		$filename = Preparation_and_Planning_Daily_Task_Summary($reporttype, $project_type, $project_status, $gen_user_id, $deffdate);
		break;
		
		case 2:
		$project_status = 3;
		$reporttype = "Construction Daily Report";
    	$filename = Construction_Report_Summary($reporttype, $project_type, $project_status, $gen_user_id, $deffdate);
		break;  
		
		case 3:
		$project_status = 4;
		$reporttype = "Construction Complete Report";
		$filename = Construction_Complete_Report($reporttype, $project_type, $project_status, $gen_user_id, $deffdate);
		break;
		
		case 5:
		$project_status = 5;
		$reporttype = "New Projects Daily Report";
		$filename = New_Projects_Daily_Report($reporttype, $project_type, $project_status, $gen_user_id, $deffdate);
		$msg_body = "<p>Hi Frank,</p>
			<p>Please find attached New Project Created Report.</p>
			<p>Regards,<br>
			Service Support Turnkey Decks and Creations.</p>";
		break;
		    
		default:
		$filename ="NA";
endswitch;

			if($filename !== 'NA'):				
				$data['ur_user_id'] = 1;
				$data['ur_type'] = 1;
				$data['ur_report_name'] = $filename;
				$data['ur_feature'] = 0;
				$attach[] = BASE_URL."files/user_reports/".$filename;
				$tableUserreport->insertRow($data);	
								
$att = serialize($attach);
$msg_body = ($msg_body) ? $msg_body : "Please have a look.";

if($project_status == 3 || $project_status == 2):
send_email("Frank Walmsley", "planning@turnkeydecks.com.au", SITE_NAME, SITE_EMAIL, $reporttype, "Please have a look.", $att);
endif;

send_email("Frank Walmsley", $reportemail, SITE_NAME, SITE_EMAIL, $reporttype, "Please have a look.", $att);
send_email("Frank Walmsley", "accounts@turnkeydecks.com.au", SITE_NAME, SITE_EMAIL, $reporttype, "Please have a look.", $att);
send_email("Frank Walmsley", "frank@businessbuys.com.au", SITE_NAME, SITE_EMAIL, $reporttype, "Please have a look.", $att);
send_email("Frank Walmsley", "service@turnkeydecks.com.au", SITE_NAME, SITE_EMAIL, $reporttype, "Please have a look.", $att);
//send_email("D", "dharmendrap@ephpsolutions.com", SITE_NAME, SITE_EMAIL, $reporttype, $msg_body, $att);
print_r($att);
endif;
exit;