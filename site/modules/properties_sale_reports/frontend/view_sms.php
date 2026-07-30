<?php
$fwMainView = 'file:' . getcwd() . '/view_sms.tpl';
$psresh_id = (int)$fwRequest->getParam('psresh_id', 0);

$sql = "SELECT * FROM psr_enquiry_sms_history where psresh_id = ".$psresh_id ;
$data = $fwDb->query($sql);

$fwViewData['psresh_id'] = $psresh_id;
$fwViewData['data'] = $data; 