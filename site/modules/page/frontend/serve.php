<?php
$submit1 = $fwRequest->getParam('seller_submit', '');
$submit2 = $fwRequest->getParam('buyer', '');
if($submit1)
{
    	$detail1 = $fwRequest->getParam('seller', array());
	
		if(!empty($detail1['name']) && !empty($detail1['business']) && !empty($detail1['contact']) && !empty($detail1['email']) && !empty($detail1['help']))
			{
			 $to = SITE_EMAIL;
			 $from_name = "Name:".$detail1['name'];
			 $fromEmail = $detail1['email'];
			 $subject = SITE_NAME ;
				   
			 $message = "
			 <p> Name : " .$detail1['name']. "</p> 
			 <p> Business : ".$detail1['business']. "</p>
			 <p> Contact Number : ".$detail1['contact']. "</p>
			 <p> Email : ".$detail1['email']. "</p>
			 <p> Message : ".$detail1['help']. "</p>" ; 
			 $attachment = "";	
			
			 $headers = "Content-type: text; charset=iso-8859-1\r\n";
			 $headers .= "From:".$detail1['contact_name'];
	 		
			 					 
			 if(send_email(SITE_NAME, $to, $from_name, $fromEmail, $subject, $message, $attachment))
			 	{	 
					 $fwViewData['msg1'] = "Your message has been sent. Thank you for contacting us"; 
				}
			 }
		else
			{
		
				$fwViewData['msg1'] = 'Please fill in all required fields.';
			}
}

if($submit2)
{
    	$detail2 = $fwRequest->getParam('buyer', array());
	
		if(!empty($detail2['name']) && !empty($detail2['contact']) && !empty($detail2['email']) && !empty($detail2['help']))
		{
		 $to = SITE_EMAIL;
		 $from_name = "Name:".$detail2['name'];
		 $fromEmail = $detail2['email'];
		 $subject = SITE_NAME ;
               
         $message = "
		 <p> Name : " .$detail2['name']. "</p> 
		 <p> Contact Number : ".$detail2['contact']. "</p>
		 <p> Email : ".$detail2['email']. "</p>
		 <p> Message : ".$detail2['help']. "</p>" ; 
   		 $attachment = "";	
		
	     $headers = "Content-type: text; charset=iso-8859-1\r\n";
		 $headers .= "From:".$detail2['name'];
		  
		 if(send_email(SITE_NAME, $to, $from_name, $fromEmail, $subject, $message, $attachment))
			 	{	 
					 $fwViewData['msg2'] = "Your message has been sent. Thank you for contacting us"; 
				}
		  		 
    	 $fwViewData['msg2'] = "Your message has been sent. Thank you for contacting us"; 
		 }
		 
		else
		{
			$fwViewData['msg'] = 'Please fill in all required fields.';
		}
}

 /*--------------------------------SEO parameters----------------------------------------*/