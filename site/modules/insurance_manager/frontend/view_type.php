<?php
$fwMainView = 'file:' . getcwd() . '/view_type.tpl';


$thisTable = new Fw_Db_Table("insurance_manager_type");
$fwViewData['typedata'] = $thisTable->getAllRows(); 