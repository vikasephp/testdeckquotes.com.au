<?php
$fwMainView = 'file:' . getcwd() . '/action_items.tpl';
$wlai_bsn_id = $fwRequest->getParam('wlai_bsn_id', '');
$fwViewData['wlai_bsn_id'] = $wlai_bsn_id;

$query = 'SELECT bsn_name FROM business WHERE bsn_id = ' . $wlai_bsn_id;
$result = $fwDb->queryOne($query);
$fwViewData['bsn_name'] = $result['bsn_name'];

$wlai_sql = "SELECT * FROM watch_list_action_items where wlai_bsn_id = ".$wlai_bsn_id;
if($wlai_sql){
	$wlaiData = $fwDb->query($wlai_sql);
	$fwViewData['wlai'] = $wlaiData;
}

$fwViewData['title'] = 'Action Items';

//  ClientServices@cgfb.com.au and Supportsales@cgfb.com.au 