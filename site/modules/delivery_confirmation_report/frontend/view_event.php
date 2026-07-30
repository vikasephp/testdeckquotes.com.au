<?php
$fwMainView = 'file:' . getcwd() . '/view_event.tpl';


$thisTable = new Fw_Db_Table("delivery_conf_event");

$fwViewData['eventdata'] = $thisTable->getAllRows(); 

