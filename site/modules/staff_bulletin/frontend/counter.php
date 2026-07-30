<?php

$tabledocument_hub = new Fw_Db_Table('staff_bulletin');
$sb_id = $fwRequest->getparamget('sb_id','');

//$sql = "Select document_hub.dh_thisversion, document_hub.dh_alltime from document_hub where dh_id = ".$dh_id;
//$version = $fwDb->queryOne($sql);

	$uid = $_SESSION['user']['user_id'];
	
	$userTable = new Fw_Db_Table('users');
    $userTable->setWhere("user_id = $uid");
	$userdata =  $userTable->getRow();
	$u = $userdata['user_name'];


$udata='';
$tabledocument_hub ->setWhere("sb_id = ".$sb_id);
$data = $tabledocument_hub ->getRow();
$udata = $data['sb_user_download'];

$tabledocument_hub ->setWhere("sb_user_download LIKE '%".$u. "%' AND sb_id = ". $sb_id);
if(!$tabledocument_hub ->rowExists())
{
	
	if($udata)
	{
		$updatedata['sb_user_download'] = $udata. " , " .$userdata['user_name'];
	}
	else {
		$updatedata['sb_user_download'] = $userdata['user_name'];
		
	}
	$tabledocument_hub ->setWhere("sb_id = ".$sb_id);
	
		if($tabledocument_hub ->rowExists())
		{
			$tabledocument_hub ->updateRow($updatedata);
		}
}

exit;