<?php
$bsn_id = (int)$fwRequest->getparamget('bsn_id', 0);
if ($bsn_id > 0)
{
    $thisTable = new Fw_Db_Table('business');
    $thisTable->setWhere("bsn_id = ".$bsn_id);
    $detail['bsn_qar_wall_roof'] = '';
    $thisTable->updateRow($detail);		
}
Location(BASE_URL . 'quality_assurance_report.home');
exit;