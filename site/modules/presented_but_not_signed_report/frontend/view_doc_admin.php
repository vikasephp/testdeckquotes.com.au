<?php
$fwMainView = 'file:' . getcwd() . '/view_doc_admin.tpl';

$thisTable = new Fw_Db_Table("proposal_report_doc_name");

$fwViewData['docnamedata'] = $thisTable->getAllRows();