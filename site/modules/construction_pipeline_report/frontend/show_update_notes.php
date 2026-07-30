<?php
$fwMainView = 'file:' . getcwd() . '/show_update_notes.tpl';
$table = new Fw_Db_Table('business_sellers');

$bsn_id = $fwRequest->getParam('bsn_id', 0);
$fwViewData['bsn_id']= $bsn_id;

$sqlplanNotes = "Select business_sellers.bs_plan_notes from business_sellers where business_sellers.bs_business_id = ".$bsn_id;
$planNotes = $fwDb->queryOne($sqlplanNotes);
$fwViewData['planNotes'] = $planNotes['bs_plan_notes'];

$updateNote = $fwRequest->getParam('updateNotes', '');
if(!empty($updateNote)) {
    $value = $fwRequest->getParam('updateNote', '');

    $bsDetail['bs_plan_notes'] = $value;
	
	$table->setWhere('bs_business_id = '.$bsn_id);
	$detail = $table->updateRow($bsDetail);	
}