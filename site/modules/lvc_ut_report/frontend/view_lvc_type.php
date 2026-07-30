<?php
$fwMainView = 'file:' . getcwd() . '/view_lvc_type.tpl';

$thisTable = new Fw_Db_Table("lvc_ut_lvc_type");

$fwViewData['lvcdata'] = $thisTable->getAllRows(); 

