<?php
$fwMainView = 'file:' . getcwd() . '/view_status.tpl';

$thisTable = new Fw_Db_Table("cou_comp_status");

$fwViewData['statusdata'] = $thisTable->getAllRows(); 

