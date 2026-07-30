<?php
$this_id = (int)$fwRequest->getparam('spra_id', 0);

$spra_id = (int)$fwRequest->getparam('spra_id', 0);
$spra_sp_id = (int)$fwRequest->getparam('spra_sp_id', 0);

$fwViewData['spra_id'] = $spra_id;
$fwViewData['spra_sp_id'] = $spra_sp_id;

if ($this_id > 0)
{
	$sql_upd = "UPDATE site_progress_report_attachments SET spra_attachment = '' WHERE spra_id = $this_id";
    $fwDb->queryOne($sql_upd);	
}

Location(BASE_URL . "site_progress_report.edit_attachment_comment/spra_id/".$spra_id."/spra_sp_id/".$spra_sp_id);