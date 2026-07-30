<?php


$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($value))
{
	$sql = "Update project_plans_report set  pp_uid374  = '".$value."'";	 
	$fwDb -> queryOne($sql);
}



 exit;