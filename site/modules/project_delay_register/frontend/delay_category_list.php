<?php
$fwMainView = 'file:' . getcwd() . '/delay_category_list.tpl';

$fwViewData['title'] = 'Delay Categories';

$delId = (int)$fwRequest->getParam('delpdc', 0);
if ($delId > 0) {
	$fwDb->queryOne("DELETE FROM project_delay_category WHERE pdc_id = " . $delId);
}

$catTable = new Fw_Db_Table('project_delay_category');
$catTable->setOrderBy('pdc_category_name ASC');
$list = $catTable->getRows();
if (!is_array($list)) {
	$list = array();
}
$fwViewData['list'] = $list;
