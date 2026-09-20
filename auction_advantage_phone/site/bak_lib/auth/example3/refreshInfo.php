<?php

require_once('./conf.php');

// Compatibility with PHP 4.0.x
if (!isset($_ENV)) { // PHP 4.0.x
	$_REQUEST = array_merge($HTTP_GET_VARS, $HTTP_POST_VARS, $HTTP_COOKIE_VARS);
}

$auth = &newRoleAuth();

$auth->refreshInfo();

?>
<pre><?php print_r($auth->user); ?></pre>
