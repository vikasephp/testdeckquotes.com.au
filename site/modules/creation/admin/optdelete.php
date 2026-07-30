<?php
$this_id = (int)$fwRequest->getparam($ID, 0);
$io_id = (int)$fwRequest->getParam("io_id", 0);
if ($this_id > 0 && $io_id > 0)
{
 	$tableOpt= new Fw_Db_Table('inquiry_options');  
    $tableOpt->setWhere("io_id = $io_id");
    $tableOpt->deleteRow();
}
Location(BASE_URL . $XFA['detail']."/".$ID."/".$this_id);