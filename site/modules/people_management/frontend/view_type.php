<?php
$fwMainView = 'file:' . getcwd() . '/view_type.tpl';

$thisTable = new Fw_Db_Table("people_man_type_admin");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

