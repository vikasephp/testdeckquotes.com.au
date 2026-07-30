<?php
if($_SESSION['user']['user_username']):
	require '/home/turnkeyc/www/calender/SpcEngine.php';
	Spc::login($_SESSION['user']['user_username']);
endif;			

$fwViewData['calurl'] = "http://www.turnkeydecks.com.au/autologin.php?username=".$_SESSION['user']['user_username'];
$fwViewData['title'] = "Event Calender";	