<?php
$be_id = (int)$fwRequest->getparamget('buse_id', 0);
DB($be_id);
if ($be_id > 0)
{
    $thisTable = new Fw_Db_Table('byer_enquiry');
    $thisTable->setWhere("be_id = $be_id");
    $thisTable->deleteRow();
	
	
	$thisTable = new Fw_Db_Table('befollowups');
    $thisTable->setWhere("bef_be_id = $be_id");
    $thisTable->deleteRows();
	
	$thisTable = new Fw_Db_Table('byers_other_data');
    $thisTable->setWhere("bod_be_id = $be_id");
    $thisTable->deleteRows();
	
}
print("success");
exit;