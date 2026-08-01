<?php
$this_id = (int)$fwRequest->getparam('plr_id', 0);
if ($this_id > 0) {
    $thisTable = new Fw_Db_Table('planning_legislation_register');
	//$thisTable->plr_int_html_url = '';
	$detail['plr_int_html_url'] = '';
    $thisTable->setWhere("plr_id = $this_id");
    $thisTable->updateRow($detail);
}
Location(BASE_URL . $XFA['home']);
exit;