<?php

$psttable = new Fw_Db_Table('auto_email_text_task');
$submit = $fwRequest->getParam('subAddDetail', '');

$table_id = (int)$fwRequest->getParam('au_id', 0);
$bst_id  = (int)$fwRequest->getParam('bst_id', 0);

$fwViewData['au_id'] = $table_id;
$fwViewData['bst_id'] = $bst_id;

if(!empty($submit))
{
    $detail = $fwRequest->getParam('data', array());

    $table_id = (int)$detail['au_id'];
    unset($detail['au_id']);

	if(!empty($table_id))
	{
		$psttable->setWhere("au_id = ".$table_id);
		$psttable->updateRow($detail);
	}else{
		$psttable->insertRow($detail);
	}
        Location(BASE_URL . 'business_status_taskAdmin.auto_email_list');
}	

if ($table_id > 0)
{
	$psttable->setWhere("au_id = $table_id");
	$detail = $psttable->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}

	$sql = "Select busness_status_task.bst_task_id from busness_status_task order by bst_task_id ASC";
	$fwViewData['tasklist'] = $fwDb->query($sql);	