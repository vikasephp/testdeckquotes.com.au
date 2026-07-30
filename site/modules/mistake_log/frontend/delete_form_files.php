<?php
$this_id = (int)$fwRequest->getparam('ml_id', 0);
if ($this_id > 0) {
    $thisTable = new Fw_Db_Table('mistake_log');
	//$thisTable->ml_image = '';
	$detail = array();
	$detail['ml_image'] = '';
    $thisTable->setWhere("ml_id = $this_id");
    $thisTable->updateRow($detail);
}
Location(BASE_URL . $XFA['detail'] . "/ml_id/" . $this_id);
exit;