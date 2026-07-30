<?php
$submit = $fwRequest->getParam('contact', '');
if(!empty($submit))
{	
	$detail = $fwRequest->getParam('cont', array());
	$to = "dharmendra@ephpsolutions.com";
	$to_name= SITE_NAME;
	
		 $from = $detail['contact_email'];
         $from_name = "Name:".$detail['contact_name'];
		 $subject = "Msg From ".SITE_NAME." website :".$detail['contact_subject'];
		 
        $message_html = "\n Name:  ".$detail['contact_name']." <br>\n Email Id:".$detail['contact_email']."<br>\n\n\t".$detail['contact_message']; 
   
         $headers = "Content-type: text; charset=iso-8859-1\r\n";
		 $headers .= "From:".$detail['contact_name'];
		  sendEmail($to, $to_name, $from, $from_name, $subject, $message_html, $text = '');
	 
      $fwViewData['msg'] = "Your Message has been sent successfully. We will get back to you soon."; 
	  
	  
	  
	 /* db($detail);
	  exit;
	  
		  foreachp($detail as )
		  {
		  
		  }
		  
		  
		  $detail= cleanQuery($detail);*/
	  
	  
	  
	  	//$thisTable = new Fw_Db_Table('contact');	
		//$thisTable->insertRow($detail);

	  

}	
$fwViewData['title'] = 'Get in touch with us!';

//For SEO Meta tags - Starts here
$page_id = (int)$fwRequest->getparam('page_id', 0);
if ($page_id > 0)
{
	$tablePages = new Fw_Db_Table('pages');
	$tablePages->setWhere("page_id = $page_id");
	$fwViewData['detail'] = $tablePages->getRow();
    
    $fwViewData['title'] = $fwViewData['detail']['page_short_title'];
    $fwViewData['description'] = $fwViewData['detail']['page_metadesc'];
    $fwViewData['keywords'] = $fwViewData['detail']['page_metakeyword'];
	$fwViewData['opr'] = $fwViewData['detail']['page_action_params'];

}
//For SEO Meta tags - Ends here


$fwViewData['title'] = "Contact Us";