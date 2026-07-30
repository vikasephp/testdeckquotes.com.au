<?php 
$fwMainView = 'file:' . getcwd() . '/profile.tpl';
$sa_id = $fwRequest->getparam('sa_id', '');
$tableSaleagent = new Fw_Db_Table('saleagent');
$tableSaleagent->setWhere("sa_id = ".$sa_id);
$fwViewData['detail'] = $tableSaleagent->getRow();

