<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableDocuments = new Fw_Db_Table($TABLE);
$ss_id = $fwRequest->getParam($ID, '');
$submit = $fwRequest->getParam('subAddDetail', '');
$fwViewData['ss_id'] = $ss_id;

if(!empty($submit))
{
    $detail = $fwRequest->getParam('street_sign', array());
	$this_id=$detail[$ID];
	unset($detail[$ID]);
		
			if($this_id)
				{
							$tableDocuments->setWhere($ID." = ".$this_id);
							$this_id = $tableDocuments->updateRow($detail);		
				}
			else
				{
							$this_id = $tableDocuments->insertRow($detail); 
							         			
				}		
	
		if($this_id){$fwViewData['opr'] = "Success!"; $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;}
}	

if(!empty($ss_id)) {
	
	$tableDocuments->setWhere($ID." = ".$ss_id);
	$fwViewData['detail'] = $tableDocuments->getRow();
}
$fwViewData['title'] = "Add / Edit Street Sign";