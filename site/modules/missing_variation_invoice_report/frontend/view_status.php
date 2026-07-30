<?php
$fwMainView = 'file:' . getcwd() . '/view_status.tpl';

$thisTable = new Fw_Db_Table("missing_variations_status");

$fwViewData['statusdata'] = $thisTable->getAllRows(); 

