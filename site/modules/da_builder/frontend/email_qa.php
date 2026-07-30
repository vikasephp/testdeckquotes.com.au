<?php

$fwMainView = 'file:' . getcwd() . '/email_qa.tpl';
$tableqa = new Fw_Db_Table('report_rule');
$rr_id = (int)$fwRequest->getParam('rr_id', 0);
$sql = "Select * from report_rule where rr_id = ".$rr_id;
$listsnew = $fwDb->queryOne($sql);
$fwViewData['detail'] = $listsnew;

	$sqlp = "SELECT * from report_rule where rr_id = ".$rr_id;	
	$datap = $fwDb->queryOne($sqlp);
	
	$sqlimg = "select ri_image from report_rule_images where ri_rr_id = ".$rr_id;

	$dataimg = $fwDb->query($sqlimg);
	$fwViewData['imgdata'] = $dataimg;	
	
	
	$email_qa = $fwRequest->getParam('email_qa', 0);
	if(!empty($email_qa)) {
		
		$to = $fwRequest->getParam('email_id', '');
		$subject = $fwRequest->getParam('subject', '');
		
		$html = '<html><body>';
		$html .= 'Hi<br><br>';
	    $html .= '<table border="1" cellpadding="5" style="width:100%">';
		
		$html .= '<tr><td> Text : '.$datap["rr_text"]. '</td></tr>';
		$html .= '<tr><td> Question : '.$datap["rr_question"]. '</td></tr>';
		$html .= '<tr><td> Answer : '.$datap["rr_answer"]. '</td></tr>';
		
		 if(!empty($dataimg)) 
		 {	
			$html .= '<tr><td>Supporting Images:<br>';
			foreach($dataimg as $k1=>$v1)
			{
				$html .= '<img src="'.BASE_URL.'files/da_builder/'.$v1['ri_image'].'" height="220"><br><br>';
				//$html .= "<br><br><img src='http://www.capitalcommercial.com.au/bes/images/sign.png'>";
				
			}
			 $html .= '</td></tr>';
		 }
		
		$html .= '</table>';
		
	
	$html .= '</body></html>';
		
	//$to2 = "manojsoniephp@gmail.com";
	
		if(send_email($toname, $to, 'CGFB', 'info@cgfb.com.au', $subject, $html, $attachmentsend))
		{
			$fwViewData['msg'] = 'Email has been sent successfylly';	
		}

		
}