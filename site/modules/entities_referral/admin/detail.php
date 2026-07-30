<?php

$tableDocCheck = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
	$data = $fwRequest -> getParam('data','');
	

	if($data['er_id']>0)
	{
		$er_id = $data['er_id'];
		unset($data['er_id']);
		$tableDocCheck -> setWhere("er_id = $er_id");
		$update = $tableDocCheck -> updateRow($data);
	}
	else
	{
		$insert = $tableDocCheck -> insertRow($data);
	}

	if($update)
	{
		$i = 1;
	}
	else
	{
		$i= 2;
	}

	Location(BASE_URL . $XFA["list"]."/msg/$i");
}	

/************ On Page Load************/

$er_id = $fwRequest -> getParam('er_id');

if ($er_id > 0)
{
	$tableDocCheck = new Fw_Db_Table($TABLE);
	$tableDocCheck->setWhere("$ID = $er_id");
	$detail = $tableDocCheck ->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}