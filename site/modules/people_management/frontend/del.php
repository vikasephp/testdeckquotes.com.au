<?php
$tableUserdocs = new Fw_Db_Table('customers');
$user_id = $fwRequest->getparam('userid', 0);
$data = "Error";
$delfield = $fwRequest->getparam('delfield', '');
if(!empty($delfield))
	{
	$tableUserdocs->setWhere("user_id = ".$user_id);
	$data1[$delfield]="";
	$tableUserdocs->updateRow($data1);
	$data = "Success";	
	}
print($data);
exit;