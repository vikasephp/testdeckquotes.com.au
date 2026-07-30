<?php

$user_username = $fwRequest->getParam('user_username', '');

$status = $fwRequest->getParam('status', '');

$r = $fwRequest->getparam('r', '');

$actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";

$linkdata = explode("/r/",$actual_link);   $fwViewData['m'] = "";

if(isset($linkdata[1])){
    $fwViewData['m'] = $linkdata[1];
}


if (!empty($user_username))
{
    $fwAuthGroup->forceLogin();
    $fwAuthGroup->requireAtLeast('Administrators', 'Customers', 'Users', 'Employees', 'QA');
    $group = array_keys($_SESSION['user']['::groups::']);
    $group = $group[0];

	$m = $fwRequest->getparam('m', '');
	if (!empty($m))
    {
		 Location(BASE_URL . $m);
    }

    //if (!empty($r))
    //{
	//	 Location(BASE_URL . $r);
    //}


	//login track

	$tableUserlogged =  new Fw_Db_Table('logged_users');

	$logeddata['lu_user_id'] = $_SESSION['user']['user_id'];
	
	date_default_timezone_set('Australia/Canberra');

	$logeddata['lu_date'] = date('Y-m-d');

	$logeddata['lu_login_date_time'] = date('Y-m-d H:i');

	//$logeddata['lu_logout_date_time'] = "0000-00-00 00:00:00";

	$logeddata['lu_logged_ip'] = $_SERVER['REMOTE_ADDR'];
	
	$tableUserlogged->insertRow($logeddata);

//	$tableUserlogged->setWhere("lu_user_id = ".$_SESSION['user']['user_id']);
//
//	  if($tableUserlogged->rowExists()){
//
//		unset($logeddata['lu_user_id']);
//
//		$tableUserlogged->updateRow($logeddata);
//
//	  }else{
//
//		$tableUserlogged->insertRow($logeddata);
//
//		}

	//login track
	
		 
    switch($group)

    {

        case 'Customers':

            Location(BASE_URL . $XFA['site']);

            break;

        

		 case 'Users':
		 Location(BASE_URL . $XFA['site']);
         break;

			

		 case 'Employees':

            Location(BASE_URL . $XFA['site']);

            break;	

		 case 'QA':

            Location(BASE_URL . $XFA['admin']);

            break;	

        case 'Administrators':

        default:
            Location(BASE_URL . $XFA['admin']);
    }

}



$_SESSION['user'] = array();



$fwViewData['title'] = 'Login';

$fwViewData['status'] = $status;

$fwViewData['r'] = $r;

if($r == "site.login")

{

Location(BASE_URL . $XFA['login']."/status/2");

}