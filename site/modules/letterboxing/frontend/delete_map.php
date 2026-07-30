<?php
$id = (int)$fwRequest->getparamget('lb_id', 0);
if ($id > 0)
{
    $thisTable = new Fw_Db_Table('letterboxing');
    $thisTable->setWhere("lb_id = ".$id);
    $detail['lb_map'] = '';
    $thisTable->updateRow($detail);		
}
Location(BASE_URL . 'letterboxing.home');
exit;