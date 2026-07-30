<?php
$fwMainView = 'file:' . getcwd() . '/view_type.tpl';


$thisTable = new Fw_Db_Table("street_sign_type");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

