<?php

$this_id = (int)$fwRequest->getparam($ID, 0);

if ($this_id > 0)
{

    $thisTable = new Fw_Db_Table($TABLE);
    $thisTable->setWhere("$ID = $this_id");
    $thisTable->deleteRow();
	$thisgroupTable = new Fw_Db_Table('users_groups');
    $thisgroupTable->setWhere("user_id = $this_id");
    $thisgroupTable->deleteRow();
}

Location(BASE_URL . $XFA['list']);