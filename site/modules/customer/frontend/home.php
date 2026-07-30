<?php
$fwMainView = 'file:' . getcwd() . '/home.tpl';
$bsn_name = $fwRequest->getparamget('bsn_name', 0);
if($bsn_name){
$sql="SELECT business.bsn_id, business.bsn_name FROM business WHERE business.bsn_name LIKE '%".trim($bsn_name)."%'";
$userData= $fwDb->query($sql);
$fwViewData['detail'] = $userData;}
