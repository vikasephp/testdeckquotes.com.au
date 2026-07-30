<?php 
$tableTable = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
    $this_id = (int)$detail[$ID];
    unset($detail[$ID]);

    if ($this_id > 0)
    	{
        $tableTable->setWhere("$ID = $this_id");
        $tableTable->updateRow($detail);   
    	}
    else
    	{
        $tableTable->insertRow($detail);
    	}    
    Location(BASE_URL . $XFA['list']);
}	
$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
{
	$tableTable->setWhere("$ID = $this_id");
	$fwViewData['detail'] = $tableTable->getRow();
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}
$tableTable->setWhere("jbo_parent = 0");
$fwViewData['parents'] = $tableTable->getRows();
$form = $fwRequest->getParam($TABLE, array());
if($form){$fwViewData['detail']['jbo_parent'] = $form['jbo_parent'];}
if($fwViewData['detail']['jbo_parent'] > 0)
{
$tableTable->setWhere("jbo_parent = {$fwViewData['detail']['jbo_parent']} && jbo_subparent = 0");
$fwViewData['subparents'] = $tableTable->getRows();
}