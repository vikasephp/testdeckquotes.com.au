<?php
$this_id = (int)$fwRequest->getparam('psrest_id', 0);

if ($this_id > 0) {
	$thisTable = new Fw_Db_Table('psr_enquiry_sms_templates');
	$thisTable->setWhere("psrest_id = $this_id");
	$thisTable->deleteRow();
}
Location(BASE_URL . "properties_sale_reports.view_enquiry_sms_template");
