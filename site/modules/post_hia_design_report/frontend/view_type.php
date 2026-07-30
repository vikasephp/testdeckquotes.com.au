<?php
$fwMainView = 'file:' . getcwd() . '/view_type.tpl';

$thisTable = new Fw_Db_Table("post_hia_type");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

