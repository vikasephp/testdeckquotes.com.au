<?php
$id = (int)$fwRequest->getparamget('os_id', 0);
if ($id > 0)
{
    $thisTable = new Fw_Db_Table('165_report');
    $thisTable->setWhere("os_id = ".$id);
    $detail['os_doc_link'] = '';
    $thisTable->updateRow($detail);		
}
Location(BASE_URL . '165_report.home');
exit;