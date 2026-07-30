<?php
$fwMainView = 'file:' . getcwd() . '/view_who.tpl';


$thisTable = new Fw_Db_Table("delivery_conf_who");

$fwViewData['whodata'] = $thisTable->getAllRows(); 

