<?php

$this_id = (int)$fwRequest->getparam('dif_id', 0);

if ($this_id > 0)
{
    $thisTable = new Fw_Db_Table('design_interface_features_2');
    $thisTable->setWhere("dif_id = ". $this_id);
    $thisTable->deleteRow();

}
exit;

//Location(BASE_URL . $XFA['detail'].'/bst_id/'. $bst_id);