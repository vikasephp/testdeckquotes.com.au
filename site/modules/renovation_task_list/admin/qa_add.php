<?php

$psttable = new Fw_Db_Table('renovation_que_ans');
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

	$sql = "Select renovation_task_list.bst_task_id from renovation_task_list order by bst_task_id ASC";
	$fwViewData['tasklist'] = $fwDb->query($sql);	