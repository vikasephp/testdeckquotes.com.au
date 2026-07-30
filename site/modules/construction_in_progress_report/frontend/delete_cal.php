<?php
$id = (int)$fwRequest->getparamget('bsn_id', 0);
if ($id > 0)
{
    $thisTable = new Fw_Db_Table('business');
    $thisTable->setWhere("bsn_id = ".$id);
    $detail['bsn_cip_calendar'] = '';
    $thisTable->updateRow($detail);		
}
Location(BASE_URL . 'construction_in_progress_report.home');
exit;