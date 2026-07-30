<?php
$fwMainView = 'file:' . getcwd() . '/view_stage.tpl';

$thisTable = new Fw_Db_Table("property_sale_project_stage");

$fwViewData['statusdata'] = $thisTable->getAllRows(); 

