<?php
$fwMainView = 'file:' . getcwd() . '/custview.tpl';
$tablePages = new Fw_Db_Table($TABLE);

$this_id = $fwRequest->getparam('bcust_id', 0);
$tablePages->setWhere("bcust_id = " . $this_id);
$fwViewData['detail'] =  $tablePages->getRow();

//DB($fwViewData['detail']);
