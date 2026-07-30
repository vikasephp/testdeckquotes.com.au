<?php
$fwMainView = 'file:' . getcwd() . '/view_category.tpl';


$thisTable = new Fw_Db_Table("category_options");

$fwViewData['categorydata'] = $thisTable->getAllRows(); 

