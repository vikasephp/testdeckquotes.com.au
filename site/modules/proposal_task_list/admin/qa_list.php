<?php
$tablePages = new Fw_Db_Table("proposal_que_ans");
$submit = $fwRequest->getparam('submit', 0);
$tablePages->setOrderBy('ps_task_id DESC');
if(!empty($submit)) {
	$tablePages->setWhere("ps_answer = ' ' ");
}
$catdata=$tablePages->getAllRows();
$fwViewData['list'] = $catdata; 
$fwViewData['title'] = $MODULE_PLURAL;
