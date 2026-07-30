<?php
$fwMainView = 'file:' . getcwd() . '/view_stream.tpl';

$thisTable = new Fw_Db_Table("mobile_list_stream");

$fwViewData['statusdata'] = $thisTable->getAllRows(); 

