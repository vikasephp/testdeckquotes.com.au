<?php
$fwMainView = 'file:' . getcwd() . '/edit_status.tpl';

$table = new Fw_Db_Table('pbns_status');
$fwViewData['statuslist'] = $table->getRows();