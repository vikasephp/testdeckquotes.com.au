<?php
$fwMainView = 'file:' . getcwd() . '/view_stage.tpl';

$thisTable = new Fw_Db_Table("wip_stage_options");
$fwViewData['stagedata'] = $thisTable->getAllRows(); 

