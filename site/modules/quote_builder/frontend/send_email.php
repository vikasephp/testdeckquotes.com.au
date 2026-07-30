<?php
$fwMainView = 'file:' . getcwd() . '/send_email.tpl';
$qb_id = (int)$fwRequest->getParam('qb_id', 0);
$fwViewData['qb_id'] =  $qb_id;

$sqlem = "Select qb_supplier, qb_project, qb_supplier_email, qb_component from quote_builder where  qb_id = ".$qb_id;
$dataem = $fwDb->queryOne($sqlem);

$sqlcom = "Select qb_component from quote_builder_component where qb_id = ".$dataem['qb_component'];

$datacom= $fwDb->queryOne($sqlcom);

$emails  = array_filter(explode("|",$dataem['qb_supplier_email']));


		 $to_name = $dataem['qb_supplier'];
		 
		 $from_name = "Cgfb Inclusion Team";
		 $from = "inclusions@cgfb.com.au";
		 $subject =  "New Quote Request";


		 $message = '';
		 $message .= "Dear ".$dataem['qb_supplier'].",<br><br>";
		 $message .= "You have received a new quote request for ".$dataem['qb_project']." = " . $datacom['qb_component']."<br>";
		 $message .= "Please proceed to <a href='http://www.constructionquotebuilder.com.au'>.:: ConstructionQuoteBuilder - constructionquotebuilder ::.</a> to review the quote. ";	 
		 $message .= "<br><br>";
		 $message .= "Regards, <br>CGFB Inclusions Team "; 
		
		foreach($emails as $k=>$v)
		{
			$to  = $v;
			//$to = "manojsoniephp@gmail.com";
			send_email($to_name, $to, $from_name, $from, $subject, $message, $attachment='');
			
		}
		  
	//db($message);	