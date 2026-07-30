<?php

$this_id = (int)$fwRequest->getparam('to_id', 0);
$tm_id = (int)$fwRequest->getparam('tm_id', 0);

if ($this_id > 0)
{
    $thisTable = new Fw_Db_Table('type_options');
    $thisTable->setWhere("to_id = $this_id");
    $thisTable->deleteRow();
}

Location(BASE_URL . "typeAdmin.view_options/tm_id/".$tm_id);