<?php
$fwMainView = 'file:' . getcwd() . '/view_sn.tpl';


//$thisTable = new Fw_Db_Table("letter_text");
//$fwViewData['letterdata'] = $thisTable->getAllRows(); 

$sql_l = "Select * from cpr_sn_th";
$fwViewData['sndata'] = $fwDb->query($sql_l);

