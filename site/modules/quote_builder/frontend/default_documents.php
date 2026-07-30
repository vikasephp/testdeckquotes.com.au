<?php
$fwMainView = 'file:' . getcwd() . '/default_documents.tpl';

$thisTable = new Fw_Db_Table("admin_document_check_list");

$fwViewData['dodData'] = $thisTable->getAllRows(); 

