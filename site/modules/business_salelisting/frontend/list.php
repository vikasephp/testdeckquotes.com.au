<?php

$pagenum = $fwRequest->getparam('pagenum','');
$tablePages = new Fw_Db_Table($TABLE);
$tablestatus = new Fw_Db_Table('customers_status');
$tableintrest = new Fw_Db_Table('customers_type');
$submit = $fwRequest->getParam('search', '');
$tablePages->setOrderBy($ID.' DESC');
//$catdata=$tablePages->getAllRows();
//$fwViewData['list'] = $catdata; 

