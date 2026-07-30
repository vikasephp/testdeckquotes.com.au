<?php
$id = (int)$fwRequest->getparamget('bs_business_id', 0);
if ($id > 0)
{
    $thisTable = new Fw_Db_Table('business_sellers');
    $thisTable->setWhere("bs_business_id = ".$id);
    $detail['bs_cou_weekly'] = '';
    $thisTable->updateRow($detail);		
}
Location(BASE_URL . 'cou_component_document_report.home');
exit;