<?php
$fwMainView = 'file:' . getcwd() . '/view_payment.tpl';

$thisTable = new Fw_Db_Table("design_agr_inv_pament");

$fwViewData['paymentdata'] = $thisTable->getAllRows(); 

