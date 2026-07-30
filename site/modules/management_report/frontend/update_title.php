<?php

$id = $fwRequest->getParam('id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20',' ',$value);


	$sql = "Update management_report_titles set  mr_title_".$id." = '".$value. "' where mr_id = 1";	 
	$fwDb -> queryOne($sql);

 exit;