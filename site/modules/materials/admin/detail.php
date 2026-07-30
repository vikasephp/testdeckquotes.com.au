<?php
$tablecats = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
    $this_id = (int)$detail[$ID];
    unset($detail[$ID]);

	
    if ($this_id > 0)
    	{
        $tablecats->setWhere("$ID = $this_id");
        $tablecats->updateRow($detail);   
    	}
    else
    	{
        $tablecats->insertRow($detail);
    	}    
    Location(BASE_URL . $XFA['list']);
}	

$this_id = (int)$fwRequest->getParam($ID, 0);

if ($this_id > 0)
{
	$tablecats = new Fw_Db_Table($TABLE);
	$tablecats->setWhere("$ID = $this_id");
	$detail = $tablecats->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}