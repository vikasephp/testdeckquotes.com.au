<?php
$bqa_id = (int)$fwRequest->getparamget('bqa_id', 0);
if ($bqa_id > 0)
{
    $thisTable = new Fw_Db_Table('business_qa');
    $thisTable->setWhere("bqa_id = $bqa_id");
    $thisTable->deleteRow();
print("success");		
}
exit;