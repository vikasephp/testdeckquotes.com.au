<?php
$this_id = (int)$fwRequest->getparam('td_id', 0);
$bsn_id = (int)$fwRequest->getparam('bsn_id', 0);
$chk_no = (int)$fwRequest->getparam('chk_no', 0);
if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('task_detail');
		$thisTable->setWhere("td_id = $this_id");
		$thisTable->deleteRow();

	}
Location(BASE_URL . 'ticketing_system.addtask/bsn_id/'.$bsn_id.'/chk_no/'.$chk_no);

//header('Location: '.$_SERVER[REQUEST_URI]);