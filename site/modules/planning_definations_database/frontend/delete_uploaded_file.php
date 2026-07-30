<?php
$this_id = (int)$fwRequest->getparam('pdd_id', 0);
$column = $fwRequest->getparam('column', 0);
if ($this_id > 0) {
    $thisTable = new Fw_Db_Table('planning_defination_database');
	if ($column == 'pdd_icon'){
		$detail['pdd_icon'] = '';
	}elseif ($column == 'pdd_image'){
		$detail['pdd_image'] = '';	
	}
    $thisTable->setWhere("pdd_id = $this_id");
    $thisTable->updateRow($detail);
}
Location(BASE_URL . 'planning_definations_database.add_detail/pdd_id/' . $this_id);
exit;