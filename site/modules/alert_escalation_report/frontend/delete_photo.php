<?php
$aep_id = (int)$fwRequest->getparamget('aep_id', 0);
if ($aep_id > 0)
{
    $thisTable = new Fw_Db_Table('alert_escalation_photos');
    $thisTable->setWhere("aep_id = ".$aep_id);
    $detail['aep_photo'] = '';
    $thisTable->updateRow($detail);		
}
Location(BASE_URL . 'alert_escalation_report.home');
exit;