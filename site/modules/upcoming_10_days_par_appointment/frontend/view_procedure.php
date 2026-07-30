<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_upcoming_ten_days_par_appointment");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

