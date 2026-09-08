<?php
/*
 * URL Table - list of URL Types (admin)
 * Shows all document/URL types with add, edit and delete options.
 */

$fwMainView = 'file:' . getcwd() . '/view_type.tpl';

/* Load all types, newest first */
$typesTable = new Fw_Db_Table($TYPE_TABLE);
$typesTable->setOrderBy('utt_id DESC');
$fwViewData['typedata'] = $typesTable->getAllRows();
if (!is_array($fwViewData['typedata'])) {
	$fwViewData['typedata'] = array();
}
