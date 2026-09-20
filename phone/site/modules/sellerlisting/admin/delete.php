<?php

$this_id = (int)$fwRequest->getparam('sl_id', 0);

if ($this_id > 0)
{
    $thisTable = new Fw_Db_Table('seller_listing');
    $thisTable->setWhere("sl_id = $this_id");
    $thisTable->deleteRow();
}

Location(BASE_URL . $XFA['list']);