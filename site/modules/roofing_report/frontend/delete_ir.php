<?php
$id = (int)$fwRequest->getparamget('rr_id', 0);
if ($id > 0)
{
    $thisTable = new Fw_Db_Table('roofing_report');
    $thisTable->setWhere("rr_id = ".$id);
    $detail['rr_inspection_report'] = '';
    $thisTable->updateRow($detail);		
}
Location(BASE_URL . 'roofing_report.home');
exit;