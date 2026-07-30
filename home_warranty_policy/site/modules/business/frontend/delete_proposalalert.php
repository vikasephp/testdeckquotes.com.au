<?php
$be_id = (int)$fwRequest->getparamget('buse_id', 0);
if ($be_id > 0)
{
    $thisTable = new Fw_Db_Table('proposal_alert');
    $thisTable->setWhere("be_id = $be_id");
    $thisTable->deleteRow();
}
print("success");
exit;