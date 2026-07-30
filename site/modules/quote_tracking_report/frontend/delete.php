<?php
$this_id = (int)$fwRequest->getparam('bsn_id', 0);
$sql = "update business_sellers set bs_qtr_remove =  1 where bs_business_id = ".$this_id;
$fwDb -> queryOne($sql);
	//if ($this_id > 0)
//	{
//		$thisTable = new Fw_Db_Table('quote_tracking_report');
//		$thisTable->setWhere("qt_id = $this_id");
//		$thisTable->deleteRow();
//		
//	}
Location(BASE_URL . "quote_tracking_report.home");