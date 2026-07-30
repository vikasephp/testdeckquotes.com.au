<?php
$fwMainView = 'file:' . getcwd() . '/upload.tpl';
$tableUserdocs = new Fw_Db_Table('users_docs');
$user_id = $fwRequest->getparam('userid', 0);
$del = $fwRequest->getparam('udid', 0);
if($del > 0)
	{
	$tableUserdocs->setWhere("ud_id = ".$del);
	$tableUserdocs->deleteRow();
	}

if($user_id > 0)
	{
	$tableUserdocs->setWhere("ud_user_id = ".$user_id);
	$fwViewData['files'] = $tableUserdocs->getRows();
	}

