<?php
$fwMainView = 'file:' . getcwd() . '/view_alert.tpl';
$thisTable = new Fw_Db_Table("nsw_paqr_alert_admin");
$fwViewData['alertdata'] = $thisTable->getAllRows(); 