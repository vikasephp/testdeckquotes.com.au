<?php
$fwMainView = 'file:' . getcwd() . '/view_email_template.tpl';


$thisTable = new Fw_Db_Table("insurance_manager_email");
$fwViewData['typedata'] = $thisTable->getAllRows(); 