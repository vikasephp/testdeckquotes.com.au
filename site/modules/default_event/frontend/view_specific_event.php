<?php
$fwMainView = 'file:' . getcwd() . '/view_specific_event.tpl';
$thisTable = new Fw_Db_Table("specific_event");
$fwViewData['typedata'] = $thisTable->getAllRows(); 

