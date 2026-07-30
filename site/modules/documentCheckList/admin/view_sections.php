<?php
$fwMainView = 'file:' . getcwd() . '/view_sections.tpl';


$thisTable = new Fw_Db_Table("dc_sections");

$fwViewData['sectionsdata'] = $thisTable->getAllRows(); 

