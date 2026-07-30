<?php
$fwMainView = 'file:' . getcwd() . '/view_sent.tpl';

$thisTable = new Fw_Db_Table("deposite_report_sent");

$fwViewData['sentdata'] = $thisTable->getAllRows(); 

