<?php
$this_id = (int)$fwRequest->getparam($ID, 0);

if ($this_id > 0)
{
    $thisTable = new Fw_Db_Table($TABLE);
    $thisTable->setWhere("$ID = $this_id");
    $thisTable->deleteRow();
	
	$thisTable = new Fw_Db_Table('byer_enquiry');
    $thisTable->setWhere("be_customer_id = $this_id");
    $thisTable->deleteRows();
	
	$thisTable = new Fw_Db_Table('buyer_business_for_sale');
    $thisTable->setWhere("bbfs_cust_id = $this_id");
    $thisTable->deleteRows();
	
	
}

Location(BASE_URL . $XFA['list']);