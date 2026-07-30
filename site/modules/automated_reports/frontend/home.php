<?php

$ar_id = $fwRequest->getParam('ar_id', '');

$tableReports = new Fw_Db_Table("automated_reports");
$fwViewData['reports']=$tableReports->getRows();
$fwViewData['title'] = "Automated Reports";


if($ar_id == 1) {
	
			 file_get_contents("http://www.deckquotes.com.au/site.planning_assessment_report");
			 $fwViewData['msg'] = "Report has been emailed to you";
		     //Location(BASE_URL . 'automated_reports.home');   
			 
}
else if($ar_id == 2) {
	 		 file_get_contents("http://www.deckquotes.com.au/site.design_agreement_report");
			 $fwViewData['msg'] = "Report has been emailed to you";
			 //Location(BASE_URL . 'automated_reports.home');
}
else if($ar_id == 3) {
	 		 file_get_contents("http://www.deckquotes.com.au/site.proposal_chechecklist_report");
			 $fwViewData['msg'] = "Report has been emailed to you";
			 //Location(BASE_URL . 'automated_reports.home');
}
else if($ar_id == 4) {
	 		 file_get_contents("http://www.deckquotes.com.au/site.alert_report");
			 $fwViewData['msg'] = "Report has been emailed to you";
			 //Location(BASE_URL . 'automated_reports.home');
}
else if($ar_id == 5) {
	 		 file_get_contents("http://www.deckquotes.com.au/site.top_prospect_report");
			 $fwViewData['msg'] = "Report has been emailed to you";
			 //Location(BASE_URL . 'automated_reports.home');
}


else if($ar_id == 6) {
	 		 file_get_contents("http://www.deckquotes.com.au/site.qa_report");
			 $fwViewData['msg'] = "Report has been emailed to you";
			 //Location(BASE_URL . 'automated_reports.home');
}

else if($ar_id == 7) {
	 		 file_get_contents("http://www.deckquotes.com.au/site.project_qa_report");
			 $fwViewData['msg'] = "Report has been emailed to you";
			 //Location(BASE_URL . 'automated_reports.home');
}

else if($ar_id == 8) {
	 		 file_get_contents("http://www.deckquotes.com.au/site.construction_report");
			 $fwViewData['msg'] = "Report has been emailed to you";
			 //Location(BASE_URL . 'automated_reports.home');
}
else if($ar_id == 9) {
	 		 file_get_contents("http://www.deckquotes.com.au/site.project_proposal_task_qa_report");
			 $fwViewData['msg'] = "Report has been emailed to you";
			 //Location(BASE_URL . 'automated_reports.home');
}
else if($ar_id == 10) {
	 		 file_get_contents("http://www.deckquotes.com.au/site.post_par_report");
			 $fwViewData['msg'] = "Report has been emailed to you";
			 //Location(BASE_URL . 'automated_reports.home');			 
}
else if($ar_id == 11) {
	 		 file_get_contents("http://www.deckquotes.com.au/site.completed_report");
			 $fwViewData['msg'] = "Report has been emailed to you";
			 //Location(BASE_URL . 'automated_reports.home');				 
}
else if($ar_id == 18) {
	 		 file_get_contents("http://newdeckquote.com/site.test_report");
			 $fwViewData['msg'] = "Report has been emailed to you";
			 //Location(BASE_URL . 'automated_reports.home');			 
}
