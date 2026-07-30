<?php
$fwMainView = 'file:' . getcwd() . '/view_audit.tpl';

$thisTable = new Fw_Db_Table("audit_admin");

$fwViewData['auditdata'] = $thisTable->getAllRows(); 

