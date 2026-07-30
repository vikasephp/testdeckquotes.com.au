<?php
$fwMainView = 'file:' . getcwd() . '/view_spoke_to_customer.tpl';

$thisTable = new Fw_Db_Table("customer_nps_spoke_cust");

$fwViewData['componentData'] = $thisTable->getAllRows(); 

