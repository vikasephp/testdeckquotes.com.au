<?php
$fwMainView = 'file:' . getcwd() . '/view_type.tpl';


$thisTable = new Fw_Db_Table("type_options_cpr");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

