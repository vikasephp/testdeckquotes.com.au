<?php
$user_id = $_SESSION['user']['user_id'];
$tablecats = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');
	
if(!empty($submit))
{
    $detail = $fwRequest->getParam('authors', array());
    $cat_id = (int)$detail['cat_id'];
    unset($detail['cat_id']);
	

    if ($cat_id > 0)
    {
			$tablecats->setWhere("$ID = $cat_id");
            $tablecats->updateRow($detail);
    }
    else
    {
        $tablecats->insertRow($detail);
    }
    
    Location(BASE_URL . $XFA['list']);
}	

$cat_id = (int)$fwRequest->getParam('cat_id', 0);

if ($cat_id > 0)
{
	$tablecats = new Fw_Db_Table($TABLE);
	$tablecats->setWhere("$ID = $cat_id");
	$fwViewData['detail'] = $tablecats->getRow();
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}