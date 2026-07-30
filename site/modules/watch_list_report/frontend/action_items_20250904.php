<?php
$fwMainView = 'file:' . getcwd() . '/action_items.tpl';
$wlai_bsn_id = $fwRequest->getParam('wlai_bsn_id', '');
$fwViewData['wlai_bsn_id'] = $wlai_bsn_id;

$wlai_sql = "SELECT * FROM watch_list_action_items where wlai_bsn_id = ".$wlai_bsn_id;
if($wlai_sql){
	$wlaiData = $fwDb->query($wlai_sql);
	$fwViewData['wlai'] = $wlaiData;
}

$fwViewData['title'] = 'Action Items';