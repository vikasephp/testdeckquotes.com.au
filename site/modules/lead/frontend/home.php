<?php
$fwViewData['id']  = $fwRequest->getparam('id',0);
/*$tablePages = new Fw_Db_Table($TABLE);
$tableES = new Fw_Db_Table("enquirysource");
$tableES->setWhere("soe_status = 1");
$tableES->setOrderBy("soe_order ASC");
$fwViewData['soe'] = $tableES->getRows();*/
$fwViewData['title'] = $MODULE_SINGULAR;

