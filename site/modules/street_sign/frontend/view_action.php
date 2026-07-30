<?php
$fwMainView = 'file:' . getcwd() . '/view_action.tpl';


$thisTable = new Fw_Db_Table("street_sign_action");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

