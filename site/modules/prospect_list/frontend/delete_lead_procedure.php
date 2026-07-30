<?php
$this_id = (int)$fwRequest->getparam('lsp_id', 0);

$bsn_id = $fwRequest->getParam('bsn_id', '');
$fwViewData['bsn_id'] = $bsn_id;

if ($this_id > 0)
{
	$thisTable = new Fw_Db_Table('lead_standard_procedure');
	$thisTable->setWhere("lsp_id = $this_id");
	$thisTable->deleteRow();

	$pltcTable = new Fw_Db_Table('prospect_list_tab_completed');
	$pltcTable->setWhere("pltc_key = 'lead' AND pltc_sp_id = $this_id");
	$pltcTable->deleteRows();
}

Location(BASE_URL . "prospect_list.view_lead_procedure/bsn_id/".$bsn_id);