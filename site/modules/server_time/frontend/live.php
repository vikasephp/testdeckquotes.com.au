<?php
$fwMainView = 'file:' . getcwd() . '/live.tpl';

// date_default_timezone_set('Australia/Melbourne');

$fwViewData['datetime'] = date('Y-m-d H:i:s');

$fwViewData['timezone'] = date_default_timezone_get();