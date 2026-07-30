<?php
$id = (int)$fwRequest->getparam('id', 0);
if ($id > 0){
    $thisTable = new Fw_Db_Table('checklist_entities_referral');
    $thisTable->setWhere("id = $id");
    $thisTable->updateRow([
        'condition_snapshot' => '',
    ]);
    echo true;
}
echo false;
exit;