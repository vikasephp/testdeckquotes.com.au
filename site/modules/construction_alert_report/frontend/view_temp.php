<?php
$fwMainView = 'file:' . getcwd() . '/view_temp.tpl';
$table = new Fw_Db_Table('email_template_mini');

$et_id = $fwRequest->getParam('et_id', 0);

$table->setWhere("et_id = $et_id");
$fwViewData['detail'] = $table->getRow();
$fwViewData['title'] = 'View Email Template Content';

	
	