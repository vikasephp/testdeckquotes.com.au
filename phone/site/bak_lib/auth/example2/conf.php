<?php

require_once('adodb/adodb.inc.php');
require_once('../GroupAuth.php');

$cnf = new stdClass();

$cnf->dbdriver = 'mysql';
$cnf->hostname = 'localhost';
$cnf->username = 'root';
$cnf->password = '';
$cnf->database = 'test';

function &newGroupAuth($options = null) {
	global $cnf;

	$auth = new GroupAuth($options);

	$auth->cacheLevel = AUTH_NO_CACHE;

	$auth->dbdriver = $cnf->dbdriver;
	$auth->hostname = $cnf->hostname;
	$auth->username = $cnf->username;
	$auth->password = $cnf->password;
	$auth->database = $cnf->database;

	return $auth;
}

?>
