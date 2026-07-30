<?php

require_once('adodb/adodb.inc.php');
require_once('adodb/adodb-session.php');
require_once('../RoleAuth.php');

$cnf = new stdClass();

$cnf->dbdriver = 'mysql';
$cnf->hostname = 'localhost';
$cnf->username = 'root';
$cnf->password = '';
$cnf->database = 'test';

$ADODB_SESSION_DRIVER = $cnf->dbdriver;
$ADODB_SESSION_CONNECT = $cnf->hostname;
$ADODB_SESSION_USER = $cnf->username;
$ADODB_SESSION_PWD = $cnf->password;
$ADODB_SESSION_DB = $cnf->database;
$ADODB_SESSION_TBL = 'sessions';

function &newRoleAuth($options = null) {
	global $cnf;

	$auth = new RoleAuth($options);

	$auth->dbdriver = $cnf->dbdriver;
	$auth->hostname = $cnf->hostname;
	$auth->username = $cnf->username;
	$auth->password = $cnf->password;
	$auth->database = $cnf->database;

	return $auth;
}

function &connect() {
	global $cnf;

	$db = &ADONewConnection($cnf->dbdriver);
	if (false === $db) {
		trigger_error("$cnf->dbdriver is not supported.", E_USER_ERROR);
	}

	$status = $db->Connect($cnf->hostname, $cnf->username, $cnf->password,
		$cnf->database);
	if (false === $status) {
		trigger_error("Can't connect to $cnf->hostname as $cnf->username.", E_USER_ERROR);
	}

	return $db;
}

?>
