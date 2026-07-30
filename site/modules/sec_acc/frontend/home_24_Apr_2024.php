<?php
$table = new Fw_Db_Table($TABLE);

$submit = $fwRequest->getParam('subAddDetail', '');
$submit2 = $fwRequest->getParam('updatekey', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$fwViewData['s_acc_k'] = $detail['s_acc_k'];
	$fwViewData['s_sec_k'] = $detail['s_sec_k'];
	
	      $username = "manojsoniephp";
 	 	  $password = "jaimatadi108";
		  
		  $otp = rand(100001,999999);
		  $dtpData['s_otp'] = $otp;
		  $table->setWhere("$ID = 1");
		  $otpopr = $table->updateRow($dtpData);
		  $fwViewData['otpopr'] = $otpopr;
		 
		  
		  $message  = "Your OTP is ".$otp. " For Update Access Key and Secret Key";
		  $type     = "1-way";
		  $senderid = "CGFB";
		  // $to       = "919823868963";
		   $to       = "918600589596";
		   $to2      = "919326311511";
		   $to3      = "917020635065";
			  
		  $url_1 = "http://api.directsms.com.au/s3/http/send_message?" .
			 "username=" . $username . "&" .
			 "password=" . $password . "&" .
			 "message="  . urlencode($message) . "&" .
			 "type="     . $type . "&" .
			 "senderid=" . urlencode($senderid) . "&" .
			 "to="       . $to;
		
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
		  
		   $url_3 = "http://api.directsms.com.au/s3/http/send_message?" .
			 "username=" . $username . "&" .
			 "password=" . $password . "&" .
			 "message="  . urlencode($message) . "&" .
			 "type="     . $type . "&" .
			 "senderid=" . urlencode($senderid) . "&" .
			 "to="       . $to3;
		
		  // Send the request
		  $output = file($url_3);
		  
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

if(!empty($submit2))
{
    $detail = $fwRequest->getParam($TABLE, array());
	
	$sql = "select s_otp from s3bucket where s_id = 1";
	$otpm = $fwDb->queryOne($sql);
	
	if($otpm['s_otp'] == $detail['s_otp'])
	{
		$table->setWhere("$ID = 1");
		$opr = $table->updateRow($detail);
		$fwViewData['opr'] = 'Keys Has Been Updated Successfully...';
	} else {
		$fwViewData['opr'] = 'Invalid OTP';
	}
	
}

