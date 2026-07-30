<?php
$bs_id = (int)$fwRequest->getparamget('bs_id', 0);
if ($bs_id > 0)
{
    $thisTable = new Fw_Db_Table('business_sellers');
    $thisTable->setWhere("bs_id = $bs_id");
    $thisTable->deleteRow();
	
}
print("success");
exit;