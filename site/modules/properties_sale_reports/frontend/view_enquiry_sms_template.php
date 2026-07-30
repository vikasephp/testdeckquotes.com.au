<?php
$fwMainView = 'file:' . getcwd() . '/view_enquiry_sms_template.tpl';
$psre_id = (int)$fwRequest->getParam('psre_id', 0);

$sql = "SELECT * from psr_enquiry_sms_templates";
$data = $fwDb->query($sql);

$fwViewData['psre_id'] = $psre_id;
$fwViewData['data'] = $data; 