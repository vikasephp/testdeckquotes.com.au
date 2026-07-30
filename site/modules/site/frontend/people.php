<?php

$tableUsers = new Fw_Db_Table('users');
$tableCustomer = new Fw_Db_Table('customers');


$sql = "select users.user_id , users.user_name, users.user_email from users";

$userData = $fwDb->query($sql);

foreach($userData as $ud)
{
	$uid = $ud['user_id'];
	$tableCustomer->setWhere("user_id = ".$uid);
	if(!$tableCustomer->rowExists())
	{
		$tableCustomer->insertRow($ud);
	}
	//db($ud);	
}
echo "updated";
exit;
	