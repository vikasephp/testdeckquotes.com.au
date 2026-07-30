<?php
if($_SESSION['user']['user_id'])
	{
//login track
	$tableUserlogged =  new Fw_Db_Table('logged_users');
	$logeddata['lu_user_id'] = $_SESSION['user']['user_id'];
	date_default_timezone_set('Australia/Canberra');
	$logeddata['lu_date'] = date('Y-m-d');
	$logeddata['lu_logout_date_time'] = date('Y-m-d H:i');
	$tableUserlogged->setWhere("lu_user_id = ".$_SESSION['user']['user_id']);
		unset($logeddata['lu_user_id']);
		$tableUserlogged->updateRow($logeddata);
//login track
	}

$fwAuthGroup->logout();

Location(BASE_URL . $XFA['login']);