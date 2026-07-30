<?php
$tablecats = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');
$this_id = (int)$fwRequest->getParam($ID, 0);

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
    $this_id = (int)$detail[$ID];
    unset($detail[$ID]);
		
    $detail['ag_text'] = stripslashes($detail['ag_text']);
	
     if($this_id > 0)
    	{
       		 $tablecats->setWhere("$ID = $this_id");
       		 $opr = $tablecats->updateRow($detail);   
		 Location(BASE_URL. $XFA['list']);
    	}
    else
    	{
		
		$opr = $tablecats->insertRow($detail);
		Location(BASE_URL. $XFA['list']);
	}
		 
		
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