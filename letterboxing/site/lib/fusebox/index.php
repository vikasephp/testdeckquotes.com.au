<?php

if (!function_exists('minVer')) {
	function minVer( $vercheck ) {
		$minver = preg_replace("%\.%", "", $vercheck); 
		$curver = preg_replace("%\.%", "", phpversion());
		if ($curver < $minver) {
			return false;
		} else {
			return true;
		}
	}
}

//require the core FuseBox
if (minVer("4.1.0")) {
	require("fbx_Fusebox3.0_PHP4.1.x.php");
} elseif (minVer("4.0.6")) {
	require("fbx_Fusebox3.0_PHP4.0.6.php");
} else {
	print "Please manually select the correct core Fusebox file for your server.";
}

?>