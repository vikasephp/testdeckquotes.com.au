<?php
$fwMainView = 'file:' . getcwd() . '/public_doc_detail.tpl';
$thisTable = new Fw_Db_Table('psr_public_documents');

$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);
$fwViewData['bsn_id'] = $bsn_id;

$thisTable->setWhere("psr_bsn_id = $bsn_id");
$fwViewData['public_doc'] = $thisTable->getAllRows();
