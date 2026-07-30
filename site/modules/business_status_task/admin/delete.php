<?php

$this_id = (int)$fwRequest->getparam($ID, 0);

if ($this_id > 0)
{
	$logTable = new Fw_Db_Table('business_task_delete_log');
	
    $thisTable = new Fw_Db_Table($TABLE);
    $thisTable->setWhere("$ID = $this_id");
	$data =  $thisTable->getRow();
	
	$uid = $_SESSION['user']['user_id'];
	
	$userTable = new Fw_Db_Table('users');
    $userTable->setWhere("user_id = $uid");
	$userdata =  $userTable->getRow();
	
	$deldata['tdl_bst_id'] = $data['bst_task_id'];
	$deldata['tdl_task_name'] = $data['bst_task_name'];
	$deldata['tdl_user'] = $userdata['user_name'];
	
	$logTable->insertRow($deldata);
	 
    $thisTable->deleteRow();
	
	
}

Location(BASE_URL . $XFA['list']);