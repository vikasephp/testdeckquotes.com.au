<?php
$table = new Fw_Db_Table($TABLE);

$username = "manojsoniephp";
$password = "jaimatadi108";

$sendOTP = $fwRequest->getParam('sendOTP', '');
//$submit = $fwRequest->getParam('subAddDetail', '');
$submit2 = $fwRequest->getParam('updatekey', '');
$verifiy = $fwRequest->getParam('verifiy', '');

if(!empty($sendOTP))
{
	$user_name = $fwRequest->getParam('user_name', '');
	$fwViewData['user_name'] = $user_name;
	$otp_1 = rand(100001,999999);
   
	
	$sqlA = "update s3users set s_otp = ".$otp_1 ." where s_user_name = '".$user_name."'";
	$or = $fwDb->queryOne($sqlA);
	
	$sqlAA = "select s_mobile, s_email from s3users where s_user_name = '".$user_name."'";
	$mobdata = $fwDb->queryOne($sqlAA);
	
	if(!empty($mobdata)) {
	
	 $fwViewData['send_otp'] = $otp_1;
	 
 		  $message  = "Your OTP is ".$otp_1. " For Login In Access Key and Secret Key";
		  $type     = "1-way";
		  $senderid = "CGFB";
		  // $to       = "919823868963";
		   $to       = $mobdata['s_mobile'];
			  
		  $url_1 = "http://api.directsms.com.au/s3/http/send_message?" .
			 "username=" . $username . "&" .
			 "password=" . $password . "&" .
			 "message="  . urlencode($message) . "&" .
			 "type="     . $type . "&" .
			 "senderid=" . urlencode($senderid) . "&" .
			 "to="       . $to;
		
		  $output = file($url_1);
		  
			  
		  $result = explode(":", $output[0]);
		
		  if($result[0] == "id") 
		  {
		    echo("Message sent\n");
			$fwViewData['very'] = true;
			$fwViewData['mob'] = substr($to,-2);
		  }
		  else
		  {
		    echo("Error :- " . $result[1] . "\n");
		  }
		  
		   $from_name = "S3Bucket Key Update Portal";
		   $from = "info@ephpsolutions.com";
		   $subject = "Some body is accessing Key Update Poral";
		   
		   $to = $mobdata['s_email'];
		   $to_name = $user_name;
		   $html = "Hello Everybody<br><br>";
		   $html .= "User ".$user_name. " is trying to access the s3bucket key update portral";
		   
		   $sqlBB = "select s_email from s3users";
		   $data = $fwDb->query($sqlBB);
		   
		   foreach($data as $k=>$v)
		   {
			    $to = $v['s_email'];
		  		$to_name = $v['s_user_name'];
		  		send_email($to_name, $to, $from_name, $from, $subject, $html, $attachment='');
		   }
		   
	} else {
		
		$fwViewData['invuser'] = 'Invalid User ...';
	}
}

if(!empty($verifiy))
{
	$user_name = $fwRequest->getParam('user_name', '');
	$onetime = $fwRequest->getParam('onetime', '');
	$fwViewData['user_name'] = $user_name;
	
	$sqlB = "select s_otp from s3users where s_user_name = '".$user_name."'";
	$otpver = $fwDb->queryOne($sqlB);
	
	if($otpver['s_otp'] == $onetime)
	{
		$fwViewData['auth'] = true;
		$fwViewData['hide'] = true;
		$fwViewData['otpopr'] = true;
		
		$otp = rand(100001,999999);
		  $dtpData['s_otp'] = $otp;
		  
		  $table->setWhere("$ID = 1");
		  $otpopr = $table->updateRow($dtpData);
		  
		  $sqlAA = "select s_mobile from s3users where s_user_name = '".$user_name."'";
	  	  $mobdata = $fwDb->queryOne($sqlAA);
	
		  $message  = "Your OTP is ".$otp. " For Updating Access Key and Secret Key";
		  $type     = "1-way";
		  $senderid = "CGFB";	
	
		  $to       = $mobdata['s_mobile'];
			  
		  $url_1 = "http://api.directsms.com.au/s3/http/send_message?" .
			 "username=" . $username . "&" .
			 "password=" . $password . "&" .
			 "message="  . urlencode($message) . "&" .
			 "type="     . $type . "&" .
			 "senderid=" . urlencode($senderid) . "&" .
			 "to="       . $to;
		
		  $output = file($url_1);
		  
			  
		  $result = explode(":", $output[0]);
		
		  if($result[0] == "id") 
		  {
		    echo("Message sent\n");
			$fwViewData['very'] = true;
			$fwViewData['mob'] = substr($to,-2);
		  }
		  else
		  {
		    echo("Error :- " . $result[1] . "\n");
		  }
	
		
	} else {
		$fwViewData['auth'] = false;
		$fwViewData['opr1'] = 'Invalid OTP';
	}
	
	      
		  //$fwViewData['otpopr'] = $otpopr;
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
		
		$from_name = "S3Bucket Key Update Portal";
		   $from = "info@ephpsolutions.com";
		   $subject = "s3bucket Keys updated successfully";
		   
		   $to = $mobdata['s_email'];
		   $to_name = $user_name;
		   $html = "Hello Everybody<br><br>";
		   $html .= "User ".$detail['s_user_name']. " is updated the s3bucket keys successfully ";
		   
		   $sqlBB = "select s_email, s_user_name from s3users";
		   $data = $fwDb->query($sqlBB);
		   
		   foreach($data as $k=>$v)
		   {
			    $to = $v['s_email'];
		  		$to_name = $v['s_user_name'];
		  		send_email($to_name, $to, $from_name, $from, $subject, $html, $attachment='');
		   }
		
	} else {
		$fwViewData['opr'] = 'Invalid OTP';
	}
	
}
