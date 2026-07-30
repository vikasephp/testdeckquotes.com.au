<?php
$tt_id = (int)$fwRequest->getparamget('buse_id', 0);
if ($tt_id > 0)
{
    $thisTable = new Fw_Db_Table('time_tracker');
    $thisTable->setWhere("tt_id = $tt_id");
    $thisTable->deleteRow();
}
print("success");
exit;