<?php
$fwMainView = 'file:' . getcwd() . '/view_item.tpl';

$po = $fwRequest->getParam('po', '');

$sql = "Select po_id from purchase_order where po_po_number = '".$po."'"; 
$podata = $fwDb->queryOne($sql);

$sql_1 = "Select * from purchase_order_items where pi_po_id = ".$podata['po_id']; 
$taskdata = $fwDb->query($sql_1);
$fwViewData['taskdata'] =  $taskdata;

$sql_3 = "select dc_project from delivery_confirmation_report where dc_purchase_order = '".$po."'";
$data = $fwDb->queryOne($sql_3);

$fwViewData['bsn_name'] = $data['dc_project'];