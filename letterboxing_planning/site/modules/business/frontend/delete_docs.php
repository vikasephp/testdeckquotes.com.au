<?php
$bd_id = (int)$fwRequest->getparamget('bs_id', 0);
if ($bd_id > 0)
{
    $thisTable = new Fw_Db_Table('business_documents');
    $thisTable->setWhere("bd_id = $bd_id");
    $thisTable->deleteRow();
	
}
print("success");
exit;