<?php

require_once('adodb/adodb.inc.php');
require_once('../Auth.php');

$cnf = new stdClass();

$cnf->dbdriver = 'mysql';
$cnf->hostname = 'localhost';
$cnf->username = 'root';
$cnf->password = '';
$cnf->database = 'test';

function &newAuth($options = null) {
	global $cnf;

	$db = array(
		'usersTable' => 'accounts',
		'userIdField' => 'account_key',
		'usernameField' => 'login',
		'passwordField' => 'pass'
	);

	$auth = new Auth(array_merge($options, $db));

	$auth->dbdriver = $cnf->dbdriver;
	$auth->hostname = $cnf->hostname;
	$auth->username = $cnf->username;
	$auth->password = $cnf->password;
	$auth->database = $cnf->database;

	return $auth;
}

?>
