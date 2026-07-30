<?php
$tablecats = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');
	
if(!empty($submit))
{
    $detail = $fwRequest->getParam('status', array());
    $st_id = (int)$detail['st_id'];
    unset($detail['st_id']);

	if(!empty($st_id)){$tablecats->setWhere("st_id = ".$st_id);$tablecats->updateRow($detail);}else{$tablecats->insertRow($detail);}

    Location(BASE_URL . $XFA['list']);
}	

$st_id = (int)$fwRequest->getParam('st_id', 0);


if ($st_id > 0)
{
	$tablecats = new Fw_Db_Table($TABLE);
	$tablecats->setWhere("$ID = $st_id");
	$detail = $tablecats->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}