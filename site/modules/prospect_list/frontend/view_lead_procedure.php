<?php
$fwMainView = 'file:' . getcwd() . '/view_lead_procedure.tpl';

$bsn_id = $fwRequest->getParam('bsn_id', '');
$fwViewData['bsn_id'] = $bsn_id;

$thisTable = new Fw_Db_Table("lead_standard_procedure");
$thisTable->setOrderBy("lsp_doc_sequence ASC");

$fwViewData['proceduredata'] = $thisTable->getAllRows();