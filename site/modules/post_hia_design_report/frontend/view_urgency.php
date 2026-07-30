<?php
$fwMainView = 'file:' . getcwd() . '/view_urgency.tpl';

$thisTable = new Fw_Db_Table("post_hia_urgency");

$fwViewData['urgencydata'] = $thisTable->getAllRows(); 

