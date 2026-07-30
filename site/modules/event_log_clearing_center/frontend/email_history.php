<?php
$fwMainView = 'file:' . getcwd() . '/email_history.tpl';

$sql = "SELECT * from event_log_clearing_center_email_history order by elcceh_id desc";
$data = $fwDb->query($sql);

$fwViewData['data'] = $data; 