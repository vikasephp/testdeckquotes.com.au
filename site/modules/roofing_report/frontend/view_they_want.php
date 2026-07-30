<?php
$fwMainView = 'file:' . getcwd() . '/view_they_want.tpl';

$thisTable = new Fw_Db_Table("roofing_they_want");

$fwViewData['twData'] = $thisTable->getAllRows(); 

