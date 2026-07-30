<?php
$ms_id = (int)$fwRequest->getparamget('ms_id', 0);
if ($ms_id > 0)
{
    $thisTable = new Fw_Db_Table('ms_team');
    $thisTable->setWhere("ms_id = $ms_id");
    $thisTable->deleteRow();
	
}
print("success");
exit;