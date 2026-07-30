<?php
$fwMainView = 'file:' . getcwd() . '/user_logon_planning_control.tpl';

$bsn_id = (int)$fwRequest->getparam('bsn_id', 0);

$query = 'SELECT * FROM business WHERE bsn_id = ' . $bsn_id . '';
$result = $fwDb->queryOne($query);

$fwViewData['item'] = $result;