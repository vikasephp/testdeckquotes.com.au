<?php
$fwMainView = 'file:' . getcwd() . '/view_stage.tpl';


//$thisTable = new Fw_Db_Table("letter_text");
//$fwViewData['letterdata'] = $thisTable->getAllRows(); 

$sql_l = "Select * from stage";
$fwViewData['stagedata'] = $fwDb->query($sql_l);

