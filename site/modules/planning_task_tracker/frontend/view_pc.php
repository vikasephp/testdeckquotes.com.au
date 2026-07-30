<?php
$fwMainView = 'file:' . getcwd() . '/view_pc.tpl';

$sql_l = "Select * from ptt_plans_changed";
$fwViewData['pcdata'] = $fwDb->query($sql_l);

