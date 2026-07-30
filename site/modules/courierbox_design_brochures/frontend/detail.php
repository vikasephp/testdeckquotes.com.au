<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tablecats = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
    $this_id = (int)$detail[$ID];
    unset($detail[$ID]);

	  if($this_id > 0)
		{
		$tablecats->setWhere("$ID = $this_id");
		$opr = $tablecats->updateRow($detail);   
		}
	else
		{
		$opr = $tablecats->insertRow($detail);
		}    
	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
	{
		$tablecats = new Fw_Db_Table($TABLE);
		$tablecats->setWhere("$ID = $this_id");
		$fwViewData['detail'] = $tablecats->getRow();
		$fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
	}
else
	{
		$fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
	}