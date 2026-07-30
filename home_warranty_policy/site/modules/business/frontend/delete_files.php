<?php
$bf_id = (int)$fwRequest->getparamget('bf_id', 0);
if ($bf_id > 0)
{
    $thisTable = new Fw_Db_Table('business_file');
    $thisTable->setWhere("bf_id = $bf_id");
    $thisTable->deleteRow();
print("success");
exit;	
}
