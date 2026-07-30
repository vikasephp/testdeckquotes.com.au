<?php
$this_id = (int)$fwRequest->getparam('osp_id', 0);

$bsn_id = $fwRequest->getParam('bsn_id', '');
$fwViewData['bsn_id'] = $bsn_id;

if ($this_id > 0)
{
	$thisTable = new Fw_Db_Table('onboarding_standard_procedure');
	$thisTable->setWhere("osp_id = $this_id");
	$thisTable->deleteRow();
	
	$pltcTable = new Fw_Db_Table('prospect_list_tab_completed');
	$pltcTable->setWhere("pltc_key = 'onboarding' AND pltc_sp_id = $this_id");
	$pltcTable->deleteRows();
}

Location(BASE_URL . "prospect_list.view_onboarding_procedure/bsn_id/".$bsn_id);