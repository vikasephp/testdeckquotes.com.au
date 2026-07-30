<?php
$username=$_SESSION['user']['user_username'];
$detail = $fwRequest->getParam('changepwd', array());

if(!isset($detail))
{
	$fwViewData['error'] = 'Please specify your password.';
}
if($detail['newpassword'] != $detail['confirmnewpassword'])
{
		$fwViewData['error'] = 'The Password and confirm password don not match!';
}
else		
{
$sql = "SELECT *, users_groups.group_id FROM users INNER JOIN users_groups ON users.user_id = users_groups.user_id WHERE users.user_username = '$username'";
			
			
			
		
	    $user = $fwDb->queryOne($sql);
		if($user['user_password'] != md5($detail['oldpassword']))
			{
			
			$fwViewData['error'] = 'Please specify valid old password.';
			}
			else
			{
			$data['user_password']= md5($detail['newpassword']);
	
			
			$user_id=$user['user_id'];
			$thisTable = new Fw_Db_Table('users');
			$thisTable->setWhere("user_id = '$user_id'");
			
			$thisTable->updateRow($data);
			
			$fwViewData['error'] = 'New password successfully updated.';
			}

	
}

$fwViewData['title'] = 'Change Password';