<?php
$fwMainView = 'file:' . getcwd() . '/email_response_popup.tpl';

$status = $fwRequest->getParam('status', 0);
$fwViewData['status'] = $status; 

$value = $fwRequest->getParam('value', 0);
$fwViewData['data'] = $value; 