<?php
$fwMainView = 'file:' . getcwd() . '/show-notes-content.tpl';

$submit = $fwRequest->getParam('subAddDetail', '');
$co_id = $fwRequest->getParam('co_id', 0);

	$table = new Fw_Db_Table('companies');
	$table->setWhere("co_id = $co_id");
	$fwViewData['detail'] = $table->getRows();
        $fwViewData['title'] = 'Notes';
	
	
	
	   