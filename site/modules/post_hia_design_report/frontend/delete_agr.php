<?php
$this_id = (int)$fwRequest->getparam('vd_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('variation_design_agreement');
		$thisTable->setWhere("vd_id = $this_id");
		$detail['vd_sv_agreement'] = '';
        $thisTable->updateRow($detail);
		
	}
Location(BASE_URL . "variation_design_agreement.home");