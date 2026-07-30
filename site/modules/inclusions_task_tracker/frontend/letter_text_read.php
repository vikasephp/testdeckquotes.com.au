<?php
$fwMainView = 'file:' . getcwd() . '/letter_text_read.tpl';

$lt_code = $fwRequest->getParam('lt_code', 0);
$sql = "SELECT lt_text from letter_text_inclusions WHERE lt_code = $lt_code";
$result = $fwDb->queryOne($sql);
$fwViewData['itt_letter_text_read'] = $result['lt_text'];
