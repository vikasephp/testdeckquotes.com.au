<?php
$user_id = (int)$fwRequest->getparam($ID, 0);
if($user_id > 0)
	{
		$thisTable = new Fw_Db_Table('users');
		$thisTable->setWhere("user_id = " .$user_id);
		$thisTable->deleteRow();
		
		$thisTable = new Fw_Db_Table(' users_groups');
		$thisTable->setWhere("user_id = " .$user_id);
		$thisTable->deleteRow();
		
		$thisTable = new Fw_Db_Table('customers');
		$thisTable->setWhere("user_id = " .$user_id);
		$thisTable->deleteRow();
	}
Location(BASE_URL . $XFA['list']);