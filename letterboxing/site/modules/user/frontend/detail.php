<?php

$user_id = $_SESSION['user']['user_id'];

$submit = $fwRequest->getparam('subAddDetail', '');
$detail = $fwRequest->getparam($TABLE, '');

if(!empty($submit))
{
		//$fwViewData['status'] = 1;
		$data = array();
		
		$data['user_id'] = $_REQUEST['user_id'];			
		$data['user_name'] = $_REQUEST['user_name'];
        $data['user_email'] = $_REQUEST['user_email'];
		$data['user_username'] = $_REQUEST['user_username'];
		if(!$_REQUEST['user_password']=="")
		{
		$data['user_password'] =md5($_REQUEST['user_password']);
		}	
		$tableUsers = new Fw_Db_Table('users');
		if ($user_id > 0)
		{
		
			$tableUsers->setWhere("user_id = $user_id");
			$tableUsers->updateRow($data);
			
				
		}
	
		Location($settings['site']['root'] . $XFA['useracc']);
}	


	$thisTable = new Fw_Db_Table($TABLE);
    $thisTable->setWhere("user_id = $user_id");
	$fwViewData['detail'] = $thisTable->getRow();
	//print_r($fwViewData['detail']);
//exit;
    $fwViewData['title']= 'Update Your Account';
	$fwViewData['uname']= $_SESSION['user']['user_name'];
