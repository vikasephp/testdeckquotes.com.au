<?php
$tableDIKeyword = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');
	
if(!empty($submit))
{
    $detail = $fwRequest->getParam('keyword', array());
    $dik_id = (int)$detail['dik_id'];
    unset($detail['dik_id']);

	if(!empty($dik_id)){$tableDIKeyword->setWhere("dik_id = ".$dik_id);
	$tableDIKeyword->updateRow($detail);}
	else{$tableDIKeyword->insertRow($detail);}

    Location(BASE_URL . $XFA['list']);
}	

$dik_id = (int)$fwRequest->getParam('dik_id', 0);


if ($dik_id > 0)
{
	$tablecats = new Fw_Db_Table($TABLE);
	$tablecats->setWhere("$ID = $dik_id");
	$detail = $tablecats->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}

	$tablecats = new Fw_Db_Table($TABLE);
	$tablecats->setOrderBy('dik_id ASC');
	//$fwViewData['detail'] = $tablecats->getRows();
	$detail = $tablecats->getRows();
	
	
	foreach($detail as $dk => $dv)
	{
		$detail[$dk]['dik_keyfeature'] = str_replace("=",'\\',$detail[$dk]['dik_keyfeature']);	
	}
	
	foreach($detail as $dk => $dv)
	{
		$detail[$dk]['dik_keyfeature'] = str_replace("!",'/',$detail[$dk]['dik_keyfeature']);	
	}
	
	$fwViewData['detail'] = $detail;