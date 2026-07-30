<?php
$fwMainView = 'file:' . getcwd() . '/view_action.tpl';


$thisTable = new Fw_Db_Table("street_sign_action_design");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

