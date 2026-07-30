<?php
$fwMainView = 'file:' . getcwd() . '/view_reimbursements.tpl';

$thisTable = new Fw_Db_Table("timesheet_reimbursements");

$fwViewData['statusdata'] = $thisTable->getAllRows(); 

