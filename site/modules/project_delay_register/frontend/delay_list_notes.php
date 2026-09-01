<?php
$fwMainView = 'file:' . getcwd() . '/delay_list_notes.tpl';

$pdtc_id = $fwRequest->getParam('pdtc_id', '');

	$sql_1 = "Select pdtc_notes from project_delay_timeline_center where  pdtc_id = ".$pdtc_id;
	$nData = $fwDb->queryOne($sql_1);

$fwViewData['notesdata'] = $nData;
