<?php
$fwMainView = 'file:' . getcwd() . '/view_sub_type.tpl';

$thisTable = new Fw_Db_Table("develop_log_ephp_subtype");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

