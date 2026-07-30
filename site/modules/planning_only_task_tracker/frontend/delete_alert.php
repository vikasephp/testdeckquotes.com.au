<?php
$this_id = (int)$fwRequest->getparam('pca_id', 0);
$pca_bsn_id = (int)$fwRequest->getparam('bsn_id', 0);

if ($this_id > 0) {
    $thisTable = new Fw_Db_Table('planning_client_alerts');
    $thisTable->setWhere("pca_id = $this_id");
    $thisTable->deleteRow();
}
Location(BASE_URL . "planning_only_task_tracker.view_alert/bsn_id/$pca_bsn_id");
