<?php
$fwMainView = 'file:' . getcwd() . '/view_response_sent.tpl';

$thisTable = new Fw_Db_Table("customer_nps_response_sent");

$fwViewData['componentData'] = $thisTable->getAllRows(); 

