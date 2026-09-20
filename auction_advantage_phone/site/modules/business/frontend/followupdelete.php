<?php
$this_id = (int)$fwRequest->getparam('bef_fups_id', 0);
$buse_id = (int)$fwRequest->getparam('buse_id', 0);
if ($this_id > 0)
{
    $thisTable = new Fw_Db_Table('befollowups');
    $thisTable->setWhere("bef_fups_id = $this_id");
    $thisTable->deleteRow();
	
}
Location(BASE_URL . $XFA['businessenquiry_detail']."/buse_id/".$buse_id);