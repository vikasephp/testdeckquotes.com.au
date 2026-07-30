<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_post_hia");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

