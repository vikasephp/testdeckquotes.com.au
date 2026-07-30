<?php

$user_id = $_SESSION['user']['user_id'];
$submit = $fwRequest->getparam('subAddDetail', '');


if(!empty($submit))
{
$detail = $fwRequest->getparam('user', '');
$data = $fwRequest->getparam('users', '');


$thisTable = new Fw_Db_Table('customers');
$thisTable->setWhere("user_id = $user_id");
$thisTable->updateRow($detail);

$datapwd=$data['user_password'];

if(!empty($datapwd))
{
$data['user_password']=md5($datapwd);
$thisTable = new Fw_Db_Table($TABLE);
$thisTable->setWhere("user_id = $user_id");
$thisTable->updateRow($data);
}
$fwViewData['msg']="Your account has successfully updated.";

}
if($user_id > 0)
{
	$thisTable = new Fw_Db_Table($TABLE);
    $thisTable->setWhere("user_id = $user_id");
	$fwViewData['detail'] = $thisTable->getRow();
	
    $fwViewData['title']= 'Your Account';
	$fwViewData['uname']= $_SESSION['user']['user_name'];
}

$thisTable = new Fw_Db_Table('customers');
    $thisTable->setWhere("user_id = $user_id");
	$fwViewData['user_data'] = $thisTable->getRow();