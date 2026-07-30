<?php
$fwMainView = 'file:' . getcwd() . '/viewletter.tpl';


//$thisTable = new Fw_Db_Table("letter_text");
//$fwViewData['letterdata'] = $thisTable->getAllRows(); 

$sql_l = "Select * from letter_text_cou order by lt_code ";
$fwViewData['letterdata'] = $fwDb->query($sql_l);

