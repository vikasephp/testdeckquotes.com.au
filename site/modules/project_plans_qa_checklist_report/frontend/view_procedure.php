<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_ppqac");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

