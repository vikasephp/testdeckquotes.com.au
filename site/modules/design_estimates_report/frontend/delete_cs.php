<?php
$id = (int)$fwRequest->getparamget('dpn_unique_id', 0);
if ($id > 0)
{
    $thisTable = new Fw_Db_Table('document_proposal_name');
    $thisTable->setWhere("dpn_unique_id = ".$id);
    $detail['dpn_dr_cust_survey'] = '';
    $thisTable->updateRow($detail);		
}
Location(BASE_URL . 'design_report.home_active');
exit;