<?php
$fwMainView = 'file:' . getcwd() . '/view_type.tpl';

$thisTable = new Fw_Db_Table("planning_project_type_admin");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

