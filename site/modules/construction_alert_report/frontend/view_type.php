<?php
$fwMainView = 'file:' . getcwd() . '/view_type.tpl';


$thisTable = new Fw_Db_Table("car_type");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

