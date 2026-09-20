<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';
$thisTable = new Fw_Db_Table($PPTABLE);
$fwViewData['proceduredata'] = $thisTable->getAllRows();
