<?php
$fwMainView = 'file:' . getcwd() . '/view_occupancy.tpl';

$thisTable = new Fw_Db_Table("roofing_occupancy");

$fwViewData['occData'] = $thisTable->getAllRows(); 

