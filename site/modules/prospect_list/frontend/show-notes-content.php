<?php
$fwMainView = 'file:' . getcwd() . '/show-notes-content.tpl';
$tableStreetSign = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');
$cl_id = $fwRequest->getParam('cl_id', 0);

	$tableStreetSign = new Fw_Db_Table($TABLE);
	$tableStreetSign->setWhere("cl_id = $cl_id");
	$fwViewData['detail'] = $tableStreetSign->getRow();
    $fwViewData['title'] = 'Notes';