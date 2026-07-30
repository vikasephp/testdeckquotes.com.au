<?php
$this_id = (int)$fwRequest->getparam('psrpd_id', 0);
$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);

if ($this_id > 0) {
	$thisTable = new Fw_Db_Table('psr_public_documents');
	$thisTable->setWhere("psrpd_id = $this_id");
	$thisTable->deleteRow();
}
Location(BASE_URL . $BASEFOLDER . ".public_doc_detail/bsn_id/".$bsn_id);
