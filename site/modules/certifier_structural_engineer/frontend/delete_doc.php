<?php
$this_id = (int)$fwRequest->getparam('ss_id', 0);
$bsn_id = $fwRequest->getParam('bsn_id', '');

$fwViewData['bsn_id'] = $bsn_id;
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('ss_required_doc');
		$thisTable->setWhere("ss_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "certifier_structural_engineer.view_doc/bsn_id/".$bsn_id);