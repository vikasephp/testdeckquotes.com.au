<?php
$fwMainView = 'file:' . getcwd() . '/view_component.tpl';

$thisTable = new Fw_Db_Table("quote_builder_component");

$sql = "SELECT quote_builder_component.*, emaillibrary.eml_code FROM quote_builder_component LEFT JOIN emaillibrary ON emaillibrary.eml_id = quote_builder_component.qb_email_code";

//$fwViewData['componentData'] = $thisTable->getAllRows();

$fwViewData['componentData'] = $fwDb->query($sql); 