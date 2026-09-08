<?php
/*
 * URL Table - delete a URL Type (admin)
 * If the type is still used by some URLs we do not remove it, we just
 * mark it inactive so existing links keep working.
 */

$utt_id = (int)$fwRequest->getParam('utt_id', 0);
if ($utt_id > 0) {
	/* Check if any URL is still using this type */
	$used = $fwDb->queryOne("SELECT COUNT(*) AS cnt FROM url_table_pages WHERE utp_type_id = " . $utt_id);
	if (!empty($used['cnt']) && (int)$used['cnt'] > 0) {
		/* Still in use - soft disable instead of hard delete */
		$typesTable = new Fw_Db_Table($TYPE_TABLE);
		$typesTable->setWhere('utt_id = ' . $utt_id);
		$typesTable->updateRow(array('utt_status' => 0));
	} else {
		$typesTable = new Fw_Db_Table($TYPE_TABLE);
		$typesTable->setWhere('utt_id = ' . $utt_id);
		$typesTable->deleteRow();
	}
}
header('Location: ' . BASE_URL . 'business_document.view_type');
exit;
