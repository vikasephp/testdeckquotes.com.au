<?php
$this_id = (int)$fwRequest->getparam('wlca_id', 0);

if ($this_id > 0)
{
	$thisTable = new Fw_Db_Table('warranty_log_customer_action');
	$thisTable->setWhere("wlca_id = $this_id");
	$thisTable->deleteRow();	
}
	
Location(BASE_URL . "warranty_log2.view_customer_action");