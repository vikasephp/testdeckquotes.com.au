<?php

$username = $fwRequest->getParam('username', '');

if(!$username)
{
	$fwViewData['error'] = 'Please specify your username and the login details will be mailed to you.';
}
else
{
	$sql = "SELECT users.*, users_groups.group_id FROM users INNER JOIN users_groups ON users.user_id = users_groups.user_id WHERE user_username = '$username'";
	
	
	
    $user = $fwDb->queryOne($sql);

	if(count($user) > 0)
	{
	
	
	 $pw= rand(131, 215);
	 
	 $orgpw=$pw."newlog&sp";
	 $mdpw=md5($orgpw);
	 
	 $detail['user_password']=$mdpw;
	 
	 
	$thisTable = new Fw_Db_Table('users');
	$thisTable->setwhere("user_username= '$username'");
	$thisTable->updateRow($detail);
	
	
	
		$subject = SITE_NAME . ": Login Details";
        $from = SITE_NAME;
        $message = "<pre>
Dear {$user['user_name']}, 
        
Your login details are as follows:

Login URL: " . BASE_URL . "site.login
Username: {$user['user_username']}
Password: {$orgpw}

Thanks,

$from
</pre>";
   
 
    
        sendEmail($user['user_email'], '', SITE_EMAIL, '', $subject, $message);
		
        $fwViewData['error']  = "Your login details have been sent to your email address.";
	}		
	else
	{
		$fwViewData['error'] = "Please specify a valid username.";		
	}
}

$fwViewData['title'] = 'Forgot Password';