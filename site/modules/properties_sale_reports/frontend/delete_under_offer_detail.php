<?php
$this_id = (int)$fwRequest->getparam('psruo_id', 0);
$bsn_id = (int)$fwRequest->getparam('bsn_id', 0);

if ($this_id > 0)
{
	$thisTable = new Fw_Db_Table('properties_sale_reports_under_offer');
	$thisTable->setWhere("psruo_id = $this_id and psruo_bsn_id = $bsn_id");
	$thisTable->deleteRow();
}
	
Location(BASE_URL . "properties_sale_reports.view_project/bsn_id/$bsn_id");