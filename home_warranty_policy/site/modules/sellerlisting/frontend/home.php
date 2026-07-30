<?php
//$fwMainView = 'file:' . getcwd() . '/home.tpl';
$tablesl = new Fw_Db_Table($TABLE);
$mlbs_id = $fwRequest->getParamget('mlbs_id', '');
if($mlbs_id)
	{
	$detail['mlbs_current_status'] = trim($fwRequest->getParamget('mlbs_status', ''));
	$detail['mlbs_completedby'] = trim($fwRequest->getParamget('mlbs_completedby', ''));
	$detail['mlbs_last_buyer_feedback'] = trim($fwRequest->getParamget('mlbs_last_buyer_feedback', ''));
	$detail['mlbs_current_status'] = trim($fwRequest->getParamget('mlbs_current_status', ''));
	$detail['mlbs_update_date'] = changedate_y_m_d(trim($fwRequest->getParamget('mlbs_update_date', '')));
	$detail['mlbs_notes'] = trim($fwRequest->getParamget('mlbs_notes', ''));
	$tablesl->setWhere($ID ."=".$mlbs_id);
	$id = $tablesl->updateRow($detail);
	}
return $id;
exit;