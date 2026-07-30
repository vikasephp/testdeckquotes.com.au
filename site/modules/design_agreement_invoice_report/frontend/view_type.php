<?php
$fwMainView = 'file:' . getcwd() . '/view_type.tpl';

$thisTable = new Fw_Db_Table("design_agr_inv_type");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

