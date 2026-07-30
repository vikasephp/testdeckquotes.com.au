<?php
$this_id = (int)$fwRequest->getparam('custbus_id', 0);
$bsn_id = (int)$fwRequest->getparam('bsn_id', 0);
if ($this_id > 0)
{
    $thisTable = new Fw_Db_Table('customer_business');
    $thisTable->setWhere("custbus_id = $this_id");
    $thisTable->deleteRow();
	
}

Location(BASE_URL . $XFA['detail']."/bsn_id/".$bsn_id);