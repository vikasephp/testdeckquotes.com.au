<?php
$fwMainView = 'file:' . getcwd() . '/view_council.tpl';
$thisTable = new Fw_Db_Table("nsw_paqr_council_admin");
$fwViewData['councildata'] = $thisTable->getAllRows(); 