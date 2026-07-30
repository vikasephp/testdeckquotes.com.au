<?php	 
$sedmail = 0;
$tableUserreport =  new Fw_Db_Table('user_reports');
$reporttype = "Convert Project Daily Task Summary";
$rtype = $fwRequest->getParam('rt', 0);
$project_status = 1;
$dbneeds = 'Yes';

  switch($rtype)
	{
	case 1;
	$reporttype = "Convert Project Daily Task Summary - Kithome Projects";
	$filename = Convert_Project_Daily_Task_Summary_kithome($reporttype, $project_type, $project_status, $gen_user_id, $deffdate);
	break;
	
	case 2;
	$reporttype = "Tasks Notification";
	$dbneeds = "No";
	$filename = Tasks_Daily_notifications($reporttype, $project_type, $project_status, $gen_user_id, $deffdate);
	break;
	
	default;
	$filename = Convert_Project_Daily_Task_Summary($reporttype, $project_type, $project_status, $gen_user_id, $deffdate);
	break;	
	}
if($dbneeds == 'Yes'):	
	$data['ur_user_id'] = 1;
	$data['ur_type'] = 1;
	$data['ur_report_name'] = "Daily Tasks Summery.";
	$data['ur_feature'] = 0;
$tableUserreport->insertRow($data);			
$attach[] = BASE_URL."files/user_reports/".$filename;

$att = serialize($attach);
send_email("Frank Walmsley", "accounts@turnkeydecks.com.au", SITE_NAME, SITE_EMAIL, "Convert Project Daily Task Summary", "Please have a look.", $att);
send_email("Frank Walmsley", "frank@businessbuys.com.au", SITE_NAME, SITE_EMAIL, "Convert Project Daily Task Summary", "Please have a look.", $att);
send_email("Frank Walmsley", "service@turnkeydecks.com.au", SITE_NAME, SITE_EMAIL, "Convert Project Daily Task Summary", "Please have a look.", $att);
//send_email("D", "dharmendrap@ephpsolutions.com", SITE_NAME, SITE_EMAIL, "Convert Project Daily Task Summary", "Please have a look.", $att);
endif;
print_r($attach);
exit;