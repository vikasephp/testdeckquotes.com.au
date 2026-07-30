<?php

require_once('./conf.php');

$options = array(
	'forceRedirect' => true,
	'redirect' => 'protected.php'
);

$auth = &newAuth($options);
$auth->forceLogin();

?>
