<?php
$de_id = (int)$fwRequest->getparamget('de_id', 0);
if ($de_id > 0)
{
    $thisTable = new Fw_Db_Table('delivery');
    $thisTable->setWhere("de_id = $de_id");
    $thisTable->deleteRow();
	
}
print("success");
exit;