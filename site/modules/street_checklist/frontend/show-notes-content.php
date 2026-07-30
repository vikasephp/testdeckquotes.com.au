<?php
$fwMainView = 'file:' . getcwd() . '/show-notes-content.tpl';
$tableEmailLib = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');
$sc_id = $fwRequest->getParam('sc_id', 0);


	$tableEmailLib = new Fw_Db_Table($TABLE);
	$tableEmailLib->setWhere("$ID = $sc_id");
	$fwViewData['detail'] = $tableEmailLib->getRow();
    $fwViewData['title'] = 'Notes';


