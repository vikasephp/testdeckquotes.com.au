<?php
$fwMainView = 'file:' . getcwd() . '/view_ppt.tpl';


$thisTable = new Fw_Db_Table("planning_project_types");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

