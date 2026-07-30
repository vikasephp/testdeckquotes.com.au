<?php

$id_list = $fwRequest->getParam('id_list', ''); 
$value   = $fwRequest->getParam('value', '');
$bsn_id  = $fwRequest->getParam('bsn_id', '');

if ($id_list != '') {
    $tableTask = new Fw_Db_Table('event_log_clearing_center');
    
    $ids = explode(',', $id_list);

    foreach ($ids as $id) {
        $id = (int)trim($id);
        if ($id <= 0) continue;

        $checkSql = "SELECT elcc_row_id FROM event_log_clearing_center WHERE elcc_row_id = " . $id;
        $existing = $fwDb->query($checkSql);

        $detail = array();
        $detail['elcc_location']    = $value;
        $detail['elcc_business_id'] = $bsn_id;

        if (!empty($existing)) {
            $tableTask->setWhere("elcc_row_id = $id");
            $tableTask->updateRow($detail);
        } 
        else {
            $detail['elcc_row_id'] = $id;
            $tableTask->insertRow($detail);
        }
    }
}

exit('Success');