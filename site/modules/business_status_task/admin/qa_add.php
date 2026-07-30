<?php

$psttable = new Fw_Db_Table('ps_que_ans');
$submit = $fwRequest->getParam('subAddDetail', '');

$table_id = (int)$fwRequest->getParam('ps_id', 0);
$fwViewData['ps_id'] = $table_id;
if(!empty($submit))
{
    $detail = $fwRequest->getParam('data', array());

	$table_id = (int)$detail['ps_id'];
    unset($detail['ps_id']);

	if(!empty($table_id)){$psttable->setWhere("ps_id = ".$table_id);$psttable->updateRow($detail);}else{$psttable->insertRow($detail);}
    Location(BASE_URL . $XFA['qa_list']);
}	


if ($table_id > 0)
{
	$psttable->setWhere("ps_id = $table_id");
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