<?php
$fwMainView = 'file:' . getcwd() . '/view_www.tpl';


$thisTable = new Fw_Db_Table("sub_pages_www");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

