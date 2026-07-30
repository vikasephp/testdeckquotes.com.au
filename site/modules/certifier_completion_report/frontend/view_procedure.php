<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_cer_com_rep");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

