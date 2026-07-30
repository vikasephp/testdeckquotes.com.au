<?php
$fwMainView = 'file:' . getcwd() . '/view_edit_project.tpl';

$thisTable = new Fw_Db_Table("quote_builder_component");

$fwViewData['componentData'] = $thisTable->getAllRows(); 

