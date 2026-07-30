<?php
$fwMainView = 'file:' . getcwd() . '/view_banner_action.tpl';


$thisTable = new Fw_Db_Table("street_sign_banner_pl");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

