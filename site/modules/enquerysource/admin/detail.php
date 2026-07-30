<?php
$tablecats = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');
	
if(!empty($submit))
{
    $detail = $fwRequest->getParam('status', array());
    $table_id = (int)$detail[$ID];
    unset($detail[$ID]);

	if(!empty($table_id)){$tablecats->setWhere("$ID = ".$table_id);$tablecats->updateRow($detail);}else{$tablecats->insertRow($detail);}

    Location(BASE_URL . $XFA['list']);
}	
$table_id = (int)$fwRequest->getParam($ID, 0);
if ($table_id > 0)
	{
		$tablecats = new Fw_Db_Table($TABLE);
		$tablecats->setWhere("$ID = $table_id");
		$detail = $tablecats->getRow();
		$fwViewData['detail'] = $detail;
		$fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
	}
else
	{
		$fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
	}