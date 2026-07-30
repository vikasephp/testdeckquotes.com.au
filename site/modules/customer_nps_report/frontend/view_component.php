<?php
$fwMainView = 'file:' . getcwd() . '/view_component.tpl';

$thisTable = new Fw_Db_Table("quote_builder_component");

$fwViewData['componentData'] = $thisTable->getAllRows(); 

