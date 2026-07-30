<?php
$tablePages = new Fw_Db_Table($TABLE);
$tableuser = new Fw_Db_Table('users');
$tablegroup = new Fw_Db_Table('users_groups');

$data = $tablePages->getAllRows();
$c = 0;
foreach($data as $key => $value)
		{
		$tableuser->setWhere("user_email = '".$value['bcust_misc_email1']."'");
		if(!$tableuser->rowExists())
		{
	
		$ucust_id = $value['bcust_id'];
		$userdata['user_name'] = $value['bcust_fname'] ." " . $value['bcust_lname'];
		$userdata['user_email'] = $value['bcust_misc_email1'];
		$userdata['user_username'] = trim($value['bcust_misc_email1']);
		$userdata['user_password'] = md5("123456");
	
		$ins_id = $tableuser->insertRow($userdata);

		$data2['user_id'] = $ins_id;
		$data2['group_id'] = 2;
		$tablegroup->insertRow($data2);
		
		$cusdata['bcust_user_id'] = $ins_id;
		$tablePages->setWhere("bcust_id = ".$ucust_id);
		$tablePages->updateRow($cusdata);
			
		}
		
		
		}
exit;