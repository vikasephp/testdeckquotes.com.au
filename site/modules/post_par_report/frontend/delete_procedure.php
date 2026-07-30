<?php
$this_id = (int)$fwRequest->getparam('pr_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('pp_post_pr');
		$thisTable->setWhere("pr_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "post_par_report.view_procedure");