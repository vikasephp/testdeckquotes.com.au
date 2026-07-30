<?php
$fwMainView = 'file:' . getcwd() . '/edit_status.tpl';

$table = new Fw_Db_Table('proposal_report_status');
$fwViewData['statuslist'] = $table->getRows();