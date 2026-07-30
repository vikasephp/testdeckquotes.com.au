<?php
$fwMainView = 'file:' . getcwd() . '/view_status.tpl';
$thisTable = new Fw_Db_Table("central_letter_database_status");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

$fwViewData['page_title'] = $MODULE_PLURAL;
$fwViewData['primary_id'] = 'cld_id';