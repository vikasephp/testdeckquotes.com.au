<?php
$rm_id = (int)$fwRequest->getparamget('rm_id', 0);
if ($rm_id > 0)
{
    $thisTable = new Fw_Db_Table('recorded_meeting');
    $thisTable->setWhere("rm_id = $rm_id");
    $thisTable->deleteRow();
	
}
print("success");
exit;