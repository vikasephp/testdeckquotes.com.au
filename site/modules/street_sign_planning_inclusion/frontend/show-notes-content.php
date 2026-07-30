<?php
$fwMainView = 'file:' . getcwd() . '/show-notes-content.tpl';
$tableStreetSign = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');
$ss_id = $fwRequest->getParam('ss_id', 0);

	$tableStreetSign = new Fw_Db_Table($TABLE);
	$tableStreetSign->setWhere("ss_id = $ss_id");
	$fwViewData['detail'] = $tableStreetSign->getRow();
    $fwViewData['title'] = 'Notes';