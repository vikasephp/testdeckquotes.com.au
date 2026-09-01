<?php
require_once dirname(__FILE__) . '/cse_extra_docs.php';

$this_id = (int)$fwRequest->getparam('ss_id', 0);
$bsn_id = $fwRequest->getParam('bsn_id', '');
$cse_id = $fwRequest->getParam('cse_id', '');
$return = cse_allowed_return($fwRequest->getParam('return', 'view_doc'));

$fwViewData['bsn_id'] = $bsn_id;
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('ss_required_doc');
		$thisTable->setWhere("ss_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "certifier_structural_engineer.".$return."/cse_id/".$cse_id."/bsn_id/".$bsn_id);
