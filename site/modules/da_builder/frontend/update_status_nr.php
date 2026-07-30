<?php

$id = $fwRequest->getParam('mr_id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20',' ',$value);


	$sql = "Update report_table_main set  mr_status  = '".$value."' where mr_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql2 = "select ns_color from status_admin_nr where ns_option = '".$value."'";
	$colr = $fwDb->queryOne($sql2);
	
	echo $colr['ns_color'];



 exit;