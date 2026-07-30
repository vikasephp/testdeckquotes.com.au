<?php
$id = (int)$fwRequest->getparamget('bsn_id', 0);
if ($id > 0)
{
    $thisTable = new Fw_Db_Table('business');
    $thisTable->setWhere("bsn_id = ".$id);
    $detail['bsn_ccf_meet_result'] = '';
    $thisTable->updateRow($detail);		
}
Location(BASE_URL . 'customer_complete_followup_report.home');
exit;