<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tablecats = new Fw_Db_Table($TABLE);
$tableTable = new Fw_Db_Table('job_priceing_options');
$tableTableData = new Fw_Db_Table('job_priceing_data');
$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
    $this_id = (int)$detail[$ID];
    unset($detail[$ID]);
	

    if ($this_id > 0)
    	{
		

        $tablecats->setWhere("$ID = $this_id");
        $id = $tablecats->updateRow($detail);   
		$tableTableData->setWhere("jp_id = $this_id");
		
		
		if($detail['jp_data'])
				{
				$tableTableData->deleteRows();
						foreach($detail['jp_data'] as $key => $val)
								{			
							$data['jpd_opt_id'] = $key;				
							$data['jpd_opt_data'] = $val;	
							$data['jp_id'] = $this_id;	
							$tableTableData->insertRow($data);		
								}
				}
		
    	}
    else
    	{
        $this_id = $tablecats->insertRow($detail);
				if($detail['jp_data'])
				{
						foreach($detail['jp_data'] as $key => $val)
								{			
							$data['jpd_opt_id'] = $key;				
							$data['jpd_opt_data'] = $val;	
							$data['jp_id'] = $this_id;	
							$tableTableData->insertRow($data);		
								}
				}
    	}    
			
  $fwViewData['opr'] = "Success";
}	

$this_id = (int)$fwRequest->getParam($ID, 0);

if ($this_id > 0)
{
	$tablecats->setWhere("$ID = $this_id");
	$detail = $tablecats->getRow();
	$fwViewData['detail'] = $detail;
	
	
	$tableTableData->setWhere("jp_id = $this_id ");
	
	$fwViewData['optionsData'] = $tableTableData->getRows();

    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}
$tableTable->setWhere("jbo_parent = 0");
$fwViewData['parents'] = $tableTable->getRows();
$form = $fwRequest->getParam($TABLE, array());

if($form){$fwViewData['detail']['jp_type'] = $form['jp_type']; $fwViewData['detail']['jp_subtype'] = $form['jp_subtype'];}
if($fwViewData['detail']['jp_type'] > 0)
{
$tableTable->setWhere("jbo_parent = {$fwViewData['detail']['jp_type']} && jbo_subparent = 0 && jbo_status = 'Active'");
$fwViewData['subparents'] = $tableTable->getRows();
}

if($fwViewData['detail']['jp_subtype'] > 0)
{
$tableTable->setWhere("jbo_parent = {$fwViewData['detail']['jp_type']} && jbo_subparent = {$fwViewData['detail']['jp_subtype']} && jbo_status = 'Active'");
$fwViewData['options'] = $tableTable->getRows();
}