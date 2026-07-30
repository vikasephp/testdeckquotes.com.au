<?php
$fwMainView = 'file:' . getcwd() . '/show-notes-content.tpl';

$submit = $fwRequest->getParam('subAddDetail', '');
$cs_id = $fwRequest->getParam('cs_id', 0);

	$table = new Fw_Db_Table('contacts');
	$table->setWhere("cs_id = $cs_id");
	$fwViewData['detail'] = $table->getRow();
	
	
        $fwViewData['title'] = 'Notes';
	
	
	
	   