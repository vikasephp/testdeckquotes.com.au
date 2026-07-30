<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableChecklist = new Fw_Db_Table($TABLE);

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];
	unset($detail[$ID]);

		
		
    if($this_id > 0)
    	{
        $tableChecklist->setWhere("$ID = $this_id");
		
		$tableusers = new Fw_Db_Table('users');
		$tableusers->setWhere("user_id = $user_id");
		$usrdetail = $tableusers->getRow();
	     $opr = $tableChecklist->updateRow($detail);   
    	}
		else
		{
			 $opr = $tableChecklist->insertRow($detail); 
		}    	
	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
{
	$tableChecklist = new Fw_Db_Table($TABLE);
	$tableChecklist->setWhere("$ID = $this_id");
	$detail = $tableChecklist->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}

