<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');

$cd = date("d-m-Y h:i:sa");
$user = $_SESSION['user']['user_name'];

if(!empty($submit))
{
    	$detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];

	unset($detail[$ID]);
	
    if($this_id > 0)
    	{
		
       		 $tableqa->setWhere("$ID = $this_id");
	     	 $opr = $tableqa->updateRow($detail);
    	}
	else
	{	$detail['ph_user_created'] = $user;
		 $detail['ph_date_time'] = $cd;
		 $opr = $tableqa->insertRow($detail); 
		 
		 $to_name = "CGFB Team Member";
	
		 $from_name = "Phone Log Alert";
		 $from = "cgfb@deckquotes.com.au";
		 $subject = "New entry has been created in phone log form";
			 
		 $html = "<html><body>";
		 $html .= "<p>Hello Team Member, </p><br>";
		 $html .= "<p>A new entry has been added in Phone Log Form </p>";
		 $html .= "https://www.deckquotes.com.au/phone_log.home</p><br>";
		 $html .= "<p>Thanks,<br>CGFB Team";
		 $html .= "</body></html>";
		 	   
		 $to1 = "operations@cgfb.com.au";
		 $to2 = "construction@cgfb.com.au";
		 $to3 = "inclusions@cgfb.com.au";
		 $to4 = "precon@cgfb.com.au";
		 $to5 = "scheduling1@cgfb.com.au";
		 $to6 = "qualityinspector@cgfb.com.au";
		 $to7 = "alerts@cgfb.com.au";
		 $to8 = "sc.south.cgfb@gmail.com";
		 $to9 = "sc.north.cgfb.@gmail.com";
		 
		
//		 send_email($to_name, $to1, $from_name, $from, $subject, $html, $attachment='');
//		 send_email($to_name, $to2, $from_name, $from, $subject, $html, $attachment='');
//		 send_email($to_name, $to3, $from_name, $from, $subject, $html, $attachment='');
//		 send_email($to_name, $to4, $from_name, $from, $subject, $html, $attachment='');
//		 send_email($to_name, $to5, $from_name, $from, $subject, $html, $attachment='');
//		 send_email($to_name, $to6, $from_name, $from, $subject, $html, $attachment='');
//		 send_email($to_name, $to7, $from_name, $from, $subject, $html, $attachment='');
//		 send_email($to_name, $to8, $from_name, $from, $subject, $html, $attachment='');
//		 send_email($to_name, $to9, $from_name, $from, $subject, $html, $attachment='');
		 
		   // Declare the security credentials to use
		  $username = "manojsoniephp";
 	      $password = "jaimatadi108";
		  
		  $message  = "A new entry has been added in Phone Log Form";
		  $type     = "1-way";
		  $senderid = "CGFB";
		  //$to       = "919823868963";
		  $to1       = "61407237765";
		  $to2       = "61404811126";
		  
		  $url_1 = "http://api.directsms.com.au/s3/http/send_message?" .
			 "username=" . $username . "&" .
			 "password=" . $password . "&" .
			 "message="  . urlencode($message) . "&" .
			 "type="     . $type . "&" .
			 "senderid=" . urlencode($senderid) . "&" .
			 "to="       . $to1;
		
		  // Send the request
		  $output = file($url_1);
		  
		  $url_2 = "http://api.directsms.com.au/s3/http/send_message?" .
			 "username=" . $username . "&" .
			 "password=" . $password . "&" .
			 "message="  . urlencode($message) . "&" .
			 "type="     . $type . "&" .
			 "senderid=" . urlencode($senderid) . "&" .
			 "to="       . $to2;
		
		  // Send the request
		  $output = file($url_2);

		  $result = explode(":", $output[0]);
		
		  if($result[0] == "id") 
		  {
		    echo("Message sent\n");
		  }
		  else
		  {
		    echo("Error :- " . $result[1] . "\n");
		  }
		
		 
		 
	}    	
    
    $fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
{
	
	$tableqa = new Fw_Db_Table($TABLE);
	$tableqa->setWhere("$ID = $this_id");
        $detail = $tableqa->getRow();
	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;	
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	



$sqls = "select co_id, co_company_name from companies";
$fwViewData['supdetail'] = $fwDb->query($sqls);
	
$sqlti = "Select tm_id from type_master where tm_type = 'Urgency Rating'";
$type_id = $fwDb->queryOne($sqlti); 
 		
$sqlto = "Select to_id, to_option from type_options where to_type_id  = ". $type_id['tm_id'];

$fwViewData['todetail'] = $fwDb->query($sqlto); 	
	
$sql2= "select tm_id from type_master where tm_type = 'Construction Alert Report Team' " ;
$tmdata = $fwDb->queryOne($sql2); 

$sql2= "select to_option from type_options where to_type_id = ". $tmdata['tm_id'] ;
$fwViewData['who'] = $fwDb->query($sql2); 

$sql_s1= "select tm_id from type_master where tm_type = 'Alert Status' " ;
$tmdata = $fwDb->queryOne($sql_s1); 

$sql_s2= "select to_option from type_options where to_type_id = ". $tmdata['tm_id'] ;
$fwViewData['statusdata'] = $fwDb->query($sql_s2); 	

