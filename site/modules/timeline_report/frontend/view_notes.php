<?php
$fwMainView = 'file:' . getcwd() . '/view_notes.tpl';

$tc_id = $fwRequest->getParam('tc_id', '');
	
	$sql_1 = "Select tc_notes from timeline_center where  tc_id = ".$tc_id;
	$nData = $fwDb->queryOne($sql_1);

$fwViewData['notesdata'] = $nData;

