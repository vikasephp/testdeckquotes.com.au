<?php
$fwMainView = 'file:' . getcwd() . '/view_banner_action.tpl';


$thisTable = new Fw_Db_Table("street_sign_banner_action");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

