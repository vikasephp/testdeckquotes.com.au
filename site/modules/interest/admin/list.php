<?php
$tablePages = new Fw_Db_Table($TABLE);

$tablePages -> setWhere('bi_parent = 0');
$main_interest = $tablePages -> getRows();
$fwViewData['main_interest'] = $main_interest; 


/******************Begin first_interest******************/
$get_main_interest = $fwRequest -> getParam('get_main_interest','');
if($get_main_interest)
{
	$bi_parent = $get_main_interest;
}
else
{
	$tablePages -> setWhere('bi_parent = 0');
	$first_interest = $tablePages -> getRow();
	$bi_parent =  $first_interest['bi_id'];
}
$fwViewData['bi_parent'] = $bi_parent;

/****************End first_interest********************/

/**************** Begin all_interest ********************/
	$tablePages -> setWhere("bi_parent = $bi_parent");
	$list = $tablePages -> getRows();
	$fwViewData['list'] = $list;
/**************** End all_interest ********************/


/******Begin Send msg parameters to list *******/
$fwViewData['title'] = $MODULE_PLURAL;
$msg = $fwRequest -> getParam('msg','');
if(!empty($msg))
{
	if($msg = 1)
	{
		$msg = "Record(s) Inserted Successfully.";
	}
	elseif($msg = 2)
	{
		$msg = "Record(s) Updated Successfully.";
	}
	elseif($msg = 3)
	{
		$msg = "Record couldn't be able to Add or Update";
	}
	
	$fwViewData['msg'] = $msg;
}
/******End Send msg parameters to list *******/