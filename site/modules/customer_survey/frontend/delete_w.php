<?php
$id = (int)$fwRequest->getparamget('bs_business_id', 0);
if ($id > 0)
{
    $thisTable = new Fw_Db_Table('business_sellers');
    $thisTable->setWhere("bs_business_id = ".$id);
    $detail['bs_cs_latest_letter'] = '';
    $thisTable->updateRow($detail);		
}
Location(BASE_URL . 'customer_survey.home');
exit;