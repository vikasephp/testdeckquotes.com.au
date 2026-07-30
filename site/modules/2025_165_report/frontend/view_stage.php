<?php
$fwMainView = 'file:' . getcwd() . '/view_stage.tpl';

$thisTable = new Fw_Db_Table("165_2025_stage");

$fwViewData['statusdata'] = $thisTable->getAllRows(); 

