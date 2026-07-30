<?php
$fwMainView = 'file:' . getcwd() . '/view_position.tpl';

$thisTable = new Fw_Db_Table("contacts_position");

$fwViewData['typedata'] = $thisTable->getAllRows(); 
