<?php
$fwMainView = 'file:' . getcwd() . '/view_explanation.tpl';
$thisTable = new Fw_Db_Table($PPTABLE);
$fwViewData['explanationdata'] = $thisTable->getAllRows();
