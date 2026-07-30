<?php
$fwMainView = 'file:' . getcwd() . '/view_cgfb_resp.tpl';
$thisTable = new Fw_Db_Table("warranty_log_cgfb");
$fwViewData['typedata'] = $thisTable->getAllRows(); 

