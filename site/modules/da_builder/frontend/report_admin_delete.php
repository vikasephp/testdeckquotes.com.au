<?php
$this_id = (int)$fwRequest->getparam('ra_id', 0);
$rb_id = (int)$fwRequest->getparam('rb_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('report_builder_admin');
		$thisTable->setWhere("ra_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . 'da_builder.report_builder_admin/rb_id/'.$rb_id);