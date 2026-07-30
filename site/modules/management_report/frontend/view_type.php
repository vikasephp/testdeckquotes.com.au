<?php
$fwMainView = 'file:' . getcwd() . '/view_type.tpl';


$thisTable = new Fw_Db_Table("management_rep_pl_type");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

