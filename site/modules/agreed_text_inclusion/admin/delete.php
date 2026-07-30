<?php

$this_id = (int)$fwRequest->getparam('ag_id', 0);

if ($this_id > 0)

{

    $thisTable = new Fw_Db_Table('agreed_text_inclusion');

    $thisTable->setWhere("ag_id = $this_id");

    $thisTable->deleteRow();

}

Location(BASE_URL . $XFA['list']);