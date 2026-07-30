<?php
$id = (int)$fwRequest->getparamget('dpn_unique_id', 0);
if ($id > 0)
{
    $thisTable = new Fw_Db_Table('document_renovation_name');
    $thisTable->setWhere("dpn_unique_id = ".$id);
    $detail['dpn_dr_latest_letter'] = '';
    $thisTable->updateRow($detail);		
}
Location(BASE_URL . 'design_report_renovation.home_active');
exit;