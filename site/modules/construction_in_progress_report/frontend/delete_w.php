<?php
$id = (int)$fwRequest->getparamget('bcust_id', 0);
if ($id > 0)
{
    $thisTable = new Fw_Db_Table('bus_customers');
    $thisTable->setWhere("bcust_id = ".$id);
    $detail['bcust_cip_latest_letter'] = '';
    $thisTable->updateRow($detail);		
}
Location(BASE_URL . 'construction_in_progress_report.home');
exit;