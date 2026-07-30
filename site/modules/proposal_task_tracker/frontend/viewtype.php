<?php
$fwMainView = 'file:' . getcwd() . '/viewtype.tpl';

$thisTable = new Fw_Db_Table("ptt_sub_type");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

