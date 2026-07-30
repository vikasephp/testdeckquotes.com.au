<?php

$psttable = new Fw_Db_Table('auto_email_text_task');
$submit = $fwRequest->getParam('subAddDetail', '');

$bst_id  = (int)$fwRequest->getParam('bst_id', 0);

$sql = "Select * from auto_email_text_task where au_task_uid = ".$bst_id;
$data = $fwDb->queryOne($sql);

if(!empty($data))
{
	$fwViewData['detail'] = $data;
}

$fwViewData['bst_id'] = $bst_id;



if(!empty($submit))
{
    $detail = $fwRequest->getParam('data', array());
	
    $table_id = (int)$detail['au_id'];
    unset($detail['au_id']);

	
	$psttable->setWhere("au_task_uid = ".$detail['au_task_uid']);
	
    if($psttable->rowExists()) {	
		$psttable->updateRow($detail);
	} else {
		$psttable->insertRow($detail);
	}
        Location(BASE_URL . 'business_status_taskAdmin.detail/bst_id/'.$detail['au_task_uid']);
}	

//if ($table_id > 0)
//{
//	$psttable->setWhere("au_id = $table_id");
//	$detail = $psttable->getRow();
//	$fwViewData['detail'] = $detail;
//    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
//}
//else
//{
//    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
//}
//
	$sql = "Select busness_status_task.bst_task_id from busness_status_task order by bst_task_id ASC";
	$fwViewData['tasklist'] = $fwDb->query($sql);	