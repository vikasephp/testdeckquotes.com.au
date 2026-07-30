<?php
$fwMainView = 'file:' . getcwd() . '/view_status.tpl';

$thisTable = new Fw_Db_Table("design_agr_inv_status");

$fwViewData['statusdata'] = $thisTable->getAllRows(); 

