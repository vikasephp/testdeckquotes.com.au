<?php
$fwMainView = 'file:' . getcwd() . '/view_type.tpl';

$thisTable = new Fw_Db_Table("di_2_type_admin");

$fwViewData['statusdata'] = $thisTable->getAllRows(); 

