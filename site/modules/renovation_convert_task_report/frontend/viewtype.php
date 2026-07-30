<?php
$fwMainView = 'file:' . getcwd() . '/viewtype.tpl';

$thisTable = new Fw_Db_Table("renovation_project_types");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

