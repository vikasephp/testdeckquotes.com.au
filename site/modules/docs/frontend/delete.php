<?php

$p_id = (int)$fwRequest->getparam('profile_id', 0);

if ($p_id > 0)
{
    $thisTable = new Fw_Db_Table('profile');
    $thisTable->setWhere("profile_id = " .$p_id);
    $thisTable->deleteRow();
	
//	$thisgroupTable = new Fw_Db_Table('users_groups');
//    $thisgroupTable->setWhere("user_id = $this_id");
//    $thisgroupTable->deleteRow();
	
}

Location(BASE_URL . $XFA['list']);