<?php
$fwMainView = 'file:' . getcwd() . '/view_status.tpl';


$thisTable = new Fw_Db_Table("buyers_agent_canberra_status");
$fwViewData['typedata'] = $thisTable->getAllRows(); 