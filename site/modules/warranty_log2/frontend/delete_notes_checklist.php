<?php
$this_id = (int)$fwRequest->getparam('cn_id', 0);
$wa_id = (int)$fwRequest->getparam('wa_id', 0);
$ch_id = (int)$fwRequest->getparam('ch_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('warranty_checklist_notes');
		$thisTable->setWhere("cn_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "warranty_log.view_notes_checklist/ch_id/".$ch_id."/wa_id/".$wa_id);