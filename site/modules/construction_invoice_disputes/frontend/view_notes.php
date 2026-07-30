<?php
$fwMainView = 'file:' . getcwd() . '/view_notes.tpl';
$id = (int)$fwRequest->getParam('ldd_id', 0);

$query = "SELECT * FROM construction_invoice_disputes_notes where cidn_ldd_id = $id";
$result = $fwDb->query($query);

$fwViewData['data'] = $result;
$fwViewData['cidn_ldd_id'] = $id;