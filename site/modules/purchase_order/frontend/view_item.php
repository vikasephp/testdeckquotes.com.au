<?php
$fwMainView = 'file:' . getcwd() . '/view_item.tpl';

$po_id = $fwRequest->getParam('po_id', '');

$fwViewData['po_id'] = $po_id;
$_SESSION['po_id'] = $po_id;


$sql_1 = "Select * from purchase_order_items where pi_po_id = ".$po_id; 
$taskdata = $fwDb->query($sql_1);
$fwViewData['taskdata'] =  $taskdata;


$sql_2 = "Select po_bsn_id from purchase_order where po_id = ".$po_id; 
$iddata = $fwDb->queryOne($sql_2);

$sql_3 = "select bsn_name from business where bsn_id = ".$iddata['po_bsn_id'];
$data = $fwDb->queryOne($sql_3);

$fwViewData['bsn_name'] = $data['bsn_name'];



  
  