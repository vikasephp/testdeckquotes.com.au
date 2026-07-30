<?php
$fwMainView = 'file:' . getcwd() . '/email.tpl';
$tableTask = new Fw_Db_Table('roofing_header_link');

$rr_id = (int)$fwRequest->getParam('rr_id', 0);

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('email', array());

	
	$sqlp = "Select * from roofing_report where rr_id = ".$rr_id;
	$rd = $fwDb->queryOne($sqlp);
	
	$sqlr = "select * from roofing_occupancy where ro_id = ".$rd['rr_occupancy'];
	$occ = $fwDb->queryOne($sqlr);
	
	$sqlw = "select * from roofing_they_want where rt_id = ".$rd['rr_what_they_want'];
	$what = $fwDb->queryOne($sqlw);
	
	$we = "No";
	if($rd['rr_are_we']==1) { $we = 'Yes - '.$rd['rr_are_we_date'] ." - ".$rd['rr_are_we_user']; }
	
	$html = "<html><body>";
	$html .= '<h2>Roofing Report</h2>';
	$html .= '<table border="1" cellpadding="6" cellspacing="0" style="font-family:Calibri;">';
	$html .= '<tr>';
	$html .= '<td style="width:25%;"><strong>Project</strong></td>';
	$html .= '<td style="width:75%;">'.$rd['rr_project'].'</td>';
	$html .= '</tr><tr>';
	$html .= '<td style="width:25%;"><strong>Occupancy</strong></td>';
	$html .= '<td style="width:75%;">'.$occ['ro_occupancy'].'</td>';
	$html .= '</tr><tr>';
	$html .= '<td style="width:25%;"><strong>Client Name</strong></td>';
	$html .= '<td style="width:75%;">'.$rd['rr_client_name'].'</td>';
	$html .= '</tr><tr>';
	$html .= '<td style="width:25%;"><strong>Email</strong></td>';
	$html .= '<td style="width:75%;">'.$rd['rr_email'].'</td>';
	$html .= '</tr><tr>';
	$html .= '<td><strong>Phone</strong></td>';
	$html .= '<td>'.$rd['rr_phone'].'</td>';
	
	$html .= '</tr><tr>';
	$html .= '<td><strong>Budget</strong></td>';
	$html .= '<td>'.$rd['rr_budget'].'</td>';
	
	$html .= '</tr><tr>';
	$html .= '<td><strong>What They Want</strong></td>';
	$html .= '<td>'.$what['rt_they_want'].'</td>';
	
	$html .= '</tr><tr>';
	$html .= '<td><strong>Survey Result</strong></td>';
	if(!empty($rd['rr_survery_result'])) {
		$html .= '<td><a href="https://deckquote.s3.amazonaws.com/files/roofing_report/'.$rd['rr_survery_result'].'">Download</a></td>';
	} else { 
		$html .= '<td></td>';
	}
	
	$html .= '</tr><tr>';
	$html .= '<td><strong>Are We Booking In?</strong></td>';
	$html .= '<td>'.$we.'</td>';
	
	$html .= '</tr><tr>';
	$html .= '<td><strong>Onsite Booked</strong></td>';
	$html .= '<td><a href="'.$rd['rr_onsite_video'].'" target="_blank">Link</a></td>';
	
	$html .= '</tr><tr>';
	$html .= '<td><strong>Onsite Video</strong></td>';
	$html .= '<td>'.$rd['rr_onsite_booked'].'</td>';
	
	$html .= '</tr><tr>';
	$html .= '<td><strong>Price</strong></td>';
	$html .= '<td>'.$rd['rr_price'].'</td>';
	
	$html .= '</tr><tr>';
	$html .= '<td><strong>Inspection Report PDF</strong></td>';
	if(!empty($rd['rr_inspection_report'])) {
		$html .= '<td><a href="https://deckquote.s3.amazonaws.com/files/roofing_report/'.$rd['rr_inspection_report'].'" target="_blank">Download</a></td>';
	} else { 
		$html .= '<td></td>';
	}
	
	$html .= '</tr><tr>';
	$html .= '<td><strong>Works Proposal Word</strong></td>';
	if(!empty($rd['rr_work_prop_word'])) {
		$html .= '<td><a href="https://deckquote.s3.amazonaws.com/files/roofing_report/'.$rd['rr_work_prop_word'].'" target="_blank">Download</a></td>';
	} else { 
		$html .= '<td></td>';
	}
	
	$html .= '</tr><tr>';
	$html .= '<td><strong>Works Proposal PDF</strong></td>';
	if(!empty($rd['rr_work_prop_pdf'])) {
		$html .= '<td><a href="https://deckquote.s3.amazonaws.com/files/roofing_report/'.$rd['rr_work_prop_pdf'].'" target="_blank">Download</a></td>';
	} else { 
		$html .= '<td></td>';
	}
	$html .= '</tr><tr>';
	$html .= '<td><strong>DocuSign Agreement</strong></td>';
	if(!empty($rd['rr_docusign_agr'])) {
		$html .= '<td><a href="https://deckquote.s3.amazonaws.com/files/roofing_report/'.$rd['rr_docusign_agr'].'" target="_blank">Download</a></td>';
	} else { 
		$html .= '<td></td>';
	}
	
	$html .= '</tr><tr>';
	$html .= '<td><strong>Introduction Letter</strong></td>';
	if(!empty($rd['rr_intro_letter'])) {
		$html .= '<td><a href="https://deckquote.s3.amazonaws.com/files/roofing_report/'.$rd['rr_intro_letter'].'" target="_blank">Download</a></td>';
	} else { 
		$html .= '<td></td>';
	}
		 
	$html .= '</tr>';

	
	$html .= "</table>";
	
	$html .= "</body></html>";
	$heading = "Roofing Report";
	$attach1 = create_roofing_PDF($heading, $html,$rr_id);
	
	if(!empty($attach1)) {
			$fdata[] = $attach1;	
		}
	if(!empty($fdata)) {			
				$attachmentsend = serialize($fdata);
		}
	
	$subject = 'Roofing Report';
	$to_name = $detail['name'];
	$to = $detail['email'];
	$from_name = "CGFB";
	$from = 'info@cgfb.com.au';
	
	$message = $to_name .",<br><br>";
	$message .= "Please find the attached roofing report attachment";
	$message .= "<br><br>";
	$message .= "Regards, <br>CGFB  Team "; 
	if(send_email($to_name, $to, $from_name, $from, $subject, $message, $attachmentsend))
	{
		
	$fwViewData['msg'] =  "Email Has Been Send Successfully";
	}
	
	
	
	
	
	
}
