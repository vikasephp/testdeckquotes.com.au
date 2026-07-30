<?php
$fwMainView = 'file:' . getcwd() . '/view_letter_type.tpl';
$thisTable = new Fw_Db_Table("central_letter_database_letter_type");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

$fwViewData['page_title'] = $MODULE_PLURAL;
$fwViewData['primary_id'] = 'cld_id';