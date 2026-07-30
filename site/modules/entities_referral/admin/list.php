<?php

$tableDocCheck = new Fw_Db_Table($TABLE);
$current_business_status = $fwRequest -> getParam('current_business_status','');


$sql = "select * from entities_referral order by er_order";

$data = $fwDb->query($sql);

$fwViewData['doc'] = $data;
		

/**** End doc related to business status ***/

$msg =  $fwRequest -> getParam('msg','');

if($msg == 1)
{
	$msg = "One Record Updated Successfully";
}

elseif($msg == 2)
{
	$msg = "One Record Inserted Successfully";
}

$fwViewData['msg'] = $msg;
$fwViewData['title'] = $MODULE_PLURAL;

$psql = "select * from project_type";
$fwViewData['projdata'] = $fwDb->query($psql);