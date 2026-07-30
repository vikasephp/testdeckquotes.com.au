<?php

$fwMainView = 'file:' . getcwd() . '/quote_detail.tpl';
$tablePo = new Fw_Db_Table('purchase_order');
$bus_id = $fwRequest->getparam('bus_id', 0);
$poid = $fwRequest -> getParamget('poid','');

$sql = "select *  from purchase_order where po_id = ".$poid;
$quotedata = $fwDb->queryOne($sql); 
$fwViewData['detail'] = $quotedata;

$user = $_SESSION['user']['user_id'];