<?php


if(send_email('Manoj', 'manojsoniephp@gmail.com', 'Auto', 'manojsoniephp@gmail.com', 'Auto Test Email1', 'Sending Email Automatic', ''))
{
	echo "<br>Send to manojsoniephp@gmail.com Successfully";
}
else 
{ 
	echo "Not Send ";
}

//if(send_email('Support', 'vickygondia1@gmail.com', 'Auto', 'vickygondia1@gmail.com', 'Auto Test Email2', 'Sending Email .... ', ''))
//{
//	echo "<br>vickygondia1@gmail.com Successfully";
//}
//else 
//{ 
//	echo "Not Send ";
//}



exit;

