<?php

//if(isset($_POST['generate']))
//{
    $string = 'abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $string_shuffled = str_shuffle($string);
    $password = substr($string_shuffled, 1, 7);

    //file_get_contents("http://login.smsgatewayhub.com/smsapi/pushsms.aspx?user=manojsoni&pwd=167196&to=919823868963&sid=SMSHUB&msg=test_message_Manoj&fl=0");
		
	//file_get_contents("http://login.smsgatewayhub.com/smsapi/pushsms.aspx?user=manojsoni&pwd=167196&to=919823868963&sid=SMSTST&msg=test_message_Manoj&fl=0");
	
	//This is for National
	//file_get_contents("https://www.smsgatewayhub.com/api/mt/SendSMS?APIKey=aaTlNLXO8k2QVj8KtXcn9A&senderid=SMSTST&channel=2&DCS=0&flashsms=0&number=919823868963&text=ManojSoniTesting&route=16");
	
	
	//This for Internation
	file_get_contents("https://www.smsgatewayhub.com/api/mt/SendSMS?APIKey=aaTlNLXO8k2QVj8KtXcn9A&senderid=SMSHUB&channel=INT&DCS=0&flashsms=0&number=61400446605&text=SendbyManojSoni&route=16");
	
	
	echo "Otp has been send successfully";
    exit;
    //$password = base64_encode($password);
    //$query = mysql_query("UPDATE user_login SET password='".$password."' WHERE username = 'ajai sandy' ");
    //$qry_run = mysql_query($query);
//}