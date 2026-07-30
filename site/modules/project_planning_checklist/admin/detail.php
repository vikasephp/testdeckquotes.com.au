<?php

$tableDocCheck = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
	$data = $fwRequest -> getParam('data','');
	

	if($data['ppc_id']>0)
	{
		$ppc_id = $data['ppc_id'];
		unset($data['ppc_id']);
		$tableDocCheck -> setWhere("ppc_id = $ppc_id");
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

$ppc_id = $fwRequest -> getParam('ppc_id');

if ($ppc_id > 0)
{
	$tableDocCheck = new Fw_Db_Table($TABLE);
	$tableDocCheck->setWhere("$ID = $ppc_id");
	$detail = $tableDocCheck ->getRow();
	$fwViewData['detail'] = $detail;

	
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}

// ************** Retrive Project Type ********************//
	$tableProjType = new Fw_Db_Table('project_planning_type');
	$fwViewData['typedetail'] = $tableProjType ->getRows();