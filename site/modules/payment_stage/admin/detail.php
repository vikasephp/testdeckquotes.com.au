<?php
$tablecats = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');
	
if(!empty($submit))
{
    $detail = $fwRequest->getParam('stage', array());
    $ps_id = (int)$detail['ps_id'];
    unset($detail['ps_id']);

	if(!empty($ps_id)){$tablecats->setWhere("ps_id = ".$ps_id);$tablecats->updateRow($detail);}else{$tablecats->insertRow($detail);}

    Location(BASE_URL . $XFA['list']);
}	

$ps_id = (int)$fwRequest->getParam('ps_id', 0);


if ($ps_id > 0)
{
	$tablecats = new Fw_Db_Table($TABLE);
	$tablecats->setWhere("$ID = $ps_id");
	$detail = $tablecats->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}