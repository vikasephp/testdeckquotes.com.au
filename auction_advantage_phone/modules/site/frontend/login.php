<?php

$user_username = $fwRequest->getParam('user_username', '');

$status = $fwRequest->getParam('status', '');

$r = $fwRequest->getparam('r', '');

if (!empty($user_username))

{

    $fwAuthGroup->forceLogin();

    $fwAuthGroup->requireAtLeast('Administrators', 'Customers', 'Users', 'Employees');



    $group = array_keys($_SESSION['user']['::groups::']);

    $group = $group[0];

  

  

    if (!empty($r))

    {

        Location(BASE_URL . $r);

    }

    

	//login track

	$tableUserlogged =  new Fw_Db_Table('logged_users');

	$logeddata['lu_user_id'] = $_SESSION['user']['user_id'];

	$logeddata['lu_date'] = date('Y-m-d');

	$logeddata['lu_login_date_time'] = date('Y-m-d H:i');

	$logeddata['lu_logout_date_time'] = "0000-00-00 00:00:00";

	$logeddata['lu_logged_ip'] = $_SERVER['REMOTE_ADDR'];

	$tableUserlogged->setWhere("lu_user_id = ".$_SESSION['user']['user_id']);

	  if($tableUserlogged->rowExists()){

		unset($logeddata['lu_user_id']);

		$tableUserlogged->updateRow($logeddata);

	  }else{

		$tableUserlogged->insertRow($logeddata);

		}

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