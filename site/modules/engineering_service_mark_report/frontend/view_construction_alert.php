<?php
$fwMainView = 'file:' . getcwd() . '/view_construction_alert.tpl';
$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);
$fwViewData['bsn_id'] = $bsn_id;


 $sqlbus = "Select bsn_name from business where bsn_id = ".$bsn_id;
 $busdata = $fwDb->queryOne($sqlbus);
 


$sql = "Select *  from construction_alert_report where  car_project ='".$busdata['bsn_name']."' and car_type = 'Certifier – Final'" ;
$data = $fwDb->query($sql);
$fwViewData['data'] = $data;



