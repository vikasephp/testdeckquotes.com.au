<?php
$this_id = (int)$fwRequest->getparam($ID, 0);
$color = (int)$fwRequest->getparam('color', 0);
	if ($this_id > 0)
	{
		if($color == 1) { $col = 0; } else { $col = 1; }
		$colordetail['car_row_color'] = $col;
		$thisTable = new Fw_Db_Table($TABLE);
		$thisTable->setWhere("$ID = $this_id");
		$thisTable->updateRow($colordetail);
	}
Location(BASE_URL . $XFA['home']);