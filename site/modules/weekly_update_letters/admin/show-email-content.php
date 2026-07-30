<?php
$fwMainView = 'file:' . getcwd() . '/show-email-content.tpl';
$tableEmailLib = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');
$eid = $fwRequest->getParam('eid', 0);


	$tableEmailLib = new Fw_Db_Table($TABLE);
	$tableEmailLib->setWhere("$ID = $eid");
	$fwViewData['detail'] = $tableEmailLib->getRow();
    $fwViewData['title'] = 'Email Content';


