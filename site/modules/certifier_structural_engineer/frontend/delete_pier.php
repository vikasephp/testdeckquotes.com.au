<?php
$id = (int)$fwRequest->getparamget('cs_id', 0);
if ($id > 0)
{
    $thisTable = new Fw_Db_Table('construction_scheduler_report');
    $thisTable->setWhere("cs_id = ".$id);
    $detail['cs_pier_insp'] = '';
    $thisTable->updateRow($detail);
    $fwViewData['show'] =  3;		
}
Location(BASE_URL . 'construction_scheduler_report.home');
exit;