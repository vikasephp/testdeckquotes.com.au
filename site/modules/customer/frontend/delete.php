<?php
$this_id = (int)$fwRequest->getparam('bcust_id', 0);
if ($this_id > 0)
{
    $thisTable = new Fw_Db_Table($TABLE);
    $thisTable->setWhere("$ID = $this_id");
	$data =  $thisTable->getRow();
	
	$thisTable = new Fw_Db_Table("users");
    $thisTable->setWhere("user_id = ".$data['bcust_user_id']);
    $thisTable->deleteRow();
	
	$thisTable = new Fw_Db_Table("users_groups");
    $thisTable->setWhere("user_id = ".$data['bcust_user_id']);
    $thisTable->deleteRow();
	
	$thisTable = new Fw_Db_Table($TABLE);
    $thisTable->setWhere("$ID = $this_id");
    $thisTable->deleteRow();
	
	$thisTable = new Fw_Db_Table("business_enquiry");
    $thisTable->setWhere("buse_cust_id = $this_id");
    $thisTable->deleteRows();
	
	$thisTable = new Fw_Db_Table("business_sellers");
    $thisTable->setWhere("bs_customers_id = $this_id");
    $thisTable->deleteRows();
	
	$thisTable = new Fw_Db_Table("buyer_business_for_sale");
    $thisTable->setWhere("bbfs_cust_id = $this_id");
    $thisTable->deleteRows();
	
	$thisTable = new Fw_Db_Table("byer_enquiry");
    $thisTable->setWhere("be_customer_id = $this_id");
    $thisTable->deleteRows();
	
	$thisTable = new Fw_Db_Table("byer_matches");
    $thisTable->setWhere("bm_cust_id = $this_id");
    $thisTable->deleteRows();	
	
	$thisTable = new Fw_Db_Table("befollowups");
    $thisTable->setWhere("bef_cust_id = $this_id");
    $thisTable->deleteRows();
	
	$thisTable = new Fw_Db_Table("byer_matches");
    $thisTable->setWhere("bm_cust_id = $this_id");
    $thisTable->deleteRows();

}
Location(BASE_URL . $XFA['list']);
