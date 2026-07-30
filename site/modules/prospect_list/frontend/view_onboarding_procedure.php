<?php
$fwMainView = 'file:' . getcwd() . '/view_onboarding_procedure.tpl';

$bsn_id = $fwRequest->getParam('bsn_id', '');
$fwViewData['bsn_id'] = $bsn_id;

$thisTable = new Fw_Db_Table("onboarding_standard_procedure");
$thisTable->setOrderBy("osp_doc_sequence ASC");
$fwViewData['proceduredata'] = $thisTable->getAllRows();