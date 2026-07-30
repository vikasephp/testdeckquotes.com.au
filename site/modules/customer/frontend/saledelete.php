<?php
$this_id = (int)$fwRequest->getparamget('be_id', 0);

if ($this_id > 0)
{
    $thisTable = new Fw_Db_Table('buyer_business_for_sale');
    $thisTable->setWhere("bbfs_id = $this_id");
    $thisTable->deleteRow();
print("Successfully Deleted.");	
}

