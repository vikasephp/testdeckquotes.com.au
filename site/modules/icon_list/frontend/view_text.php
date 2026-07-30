<?php
$fwMainView = 'file:' . getcwd() . '/view_text.tpl';
$thisTable = new Fw_Db_Table("icon_list");
$ic_id = $fwRequest->getParam('ic_id', '');



$thisTable->setWhere("ic_id = $ic_id");
  $fwViewData['data'] = $thisTable->getRow();

