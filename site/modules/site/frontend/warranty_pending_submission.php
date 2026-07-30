<?php

$sql = "SELECT * FROM warranty_form WHERE wf_status = 'Pending' ";
$data = $fwDb->query($sql);

	 
	 $html = "<html><body>";
	 $html .= "<p>Hi Inclusions Coordinator, </p>";
	
	 $html .= "<p>Please see the below table for pending submissions in the Warranty Log Clearing Center: </p>";
	 
     $html .= '<table border="1" width="100%" cellpadding="5">';
	 $html .= '<tr>';
	 $html .= '<td> Project Address </td><td> Completed/In Construction  </td><td>Problem Experiencing </td><td>Photo </td><td>Video</td>';
	 $html .= '</tr>';
	
	 foreach($data as $k=>$v)
	 {
		  if($v['wf_is_completed'] == 1 ) { $cc = 'In Construction'; } else if($v['wf_is_completed']==2) { $cc="Completed"; }
		
           $link ='';
		   
		   if($v['wf_photo_1']) {
			   //$link .= '<a href="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$v['wf_photo_1'].'">View Photo 1</a><br>';
			   $link .= '<a href="https://www.deckquotes.com.au/site.download_content?file_name='.$v['wf_photo_1'].'" >View Photo 1</a><br>';
			   
		   }
		  if($v['wf_photo_2']) {
			//   $link .= '<a href="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$v['wf_photo_2'].'">View Photo 2</a><br>';
			   $link .= '<a href="https://www.deckquotes.com.au/site.download_content?file_name='.$v['wf_photo_2'].'" >View Photo 2</a><br>';
		   }
		  
		  if($v['wf_photo_3']) {
			 //  $link .= '<a href="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$v['wf_photo_3'].'">View Photo 3</a><br>';
			   $link .= '<a href="https://www.deckquotes.com.au/site.download_content?file_name='.$v['wf_photo_3'].'" >View Photo 3</a><br>';
		   }
		   
		   if($v['wf_photo_4']) {
			   //$link .= '<a href="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$v['wf_photo_4'].'">View Photo 4</a><br>';
			   $link .= '<a href="https://www.deckquotes.com.au/site.download_content?file_name='.$v['wf_photo_4'].'" >View Photo 4</a><br>';
		   }
		   
		   if($v['wf_photo_5']) {
			  // $link .= '<a href="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$v['wf_photo_5'].'">View Photo 5</a><br>';
			   $link .= '<a href="https://www.deckquotes.com.au/site.download_content?file_name='.$v['wf_photo_5'].'" >View Photo 5</a><br>';
		   }
		
		 if($v['wf_video']) {
			  // $video = '<a href="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$v['wf_video'].'">View Video</a>';
			   $video .= '<a href="https://www.deckquotes.com.au/site.download_content?file_name='.$v['wf_video'].'" >View Video</a><br>';
		   }  
		 
	 	$html .= '<tr>';
	 	$html .= '<td>'.$v['wf_property_address'].'</td>';
		$html .= '<td>'.$cc.'</td>';
		$html .= '<td>'.$v['wf_problem'].'</td>';
		$html .= '<td>'.$link.'</td>';
		$html .= '<td>'.$video.'</td>';
	 	$html .= '</tr>';
	 }
		
	 $html .= '</table>'; 	 
	 $html .= "<p>Regards,</p>";
	 $html .= "<p>CGFB Warranty Team</p>";
	 $html .= "</body></html>";
	 
	
	 
	 $toname = "Inclusions Coordinator";
	 
	 $to = "inclusions@cgfb.com.au";
	 
	 $to1 = "systems@cgfb.com.au";
	 $to2 = "clientservices@cgfb.com.au";
	 
	 $to3 = "manojsoniephp@gmail.com";
	 send_email($toname, $to, 'CGFB',  'warranty@cgfb.com.au', 'Warranty Log Clearing Center Pending Submission Update', $html, $attachment='');
	 send_email($toname, $to1, 'CGFB', 'warranty@cgfb.com.au', 'Warranty Log Clearing Center Pending Submission Update', $html, $attachment='');
	 send_email($toname, $to2, 'CGFB', 'warranty@cgfb.com.au', 'Warranty Log Clearing Center Pending Submission Update', $html, $attachment='');
	
	 send_email($toname, $to3, 'CGFB', 'warranty@cgfb.com.au', 'Warranty Log Clearing Center Pending Submission Update', $html, $attachment='');

exit;
