<?php
$this_id = (int)$fwRequest->getParam('docqa_id', 0);

if ($this_id > 0) {
    $detail = array(
        'docqa_graphic' => ''
    );

    $thisTable = new Fw_Db_Table('dual_occupancy_canberra_qanda');
    $thisTable->setWhere("docqa_id = " . $this_id);
    $thisTable->updateRow($detail);
}

Location(BASE_URL . 'dual_occupancy_canberra_q_and_a.detail/docqa_id/' . $this_id);
exit;