<?php
$fwMainView = 'file:' . getcwd() . '/view_project_type.tpl';
$thisTable = new Fw_Db_Table("ptt_project_type");
$fwViewData['typedata'] = $thisTable->getAllRows(); 