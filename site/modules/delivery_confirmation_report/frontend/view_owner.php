<?php
$fwMainView = 'file:' . getcwd() . '/view_owner.tpl';


$thisTable = new Fw_Db_Table("delivery_conf_owner");

$fwViewData['ownerdata'] = $thisTable->getAllRows(); 

