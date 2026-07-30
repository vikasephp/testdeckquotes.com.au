<?php

$sql_1 = "Select bsn_id from business";
$data = $fwDb->query($sql_1);


foreach($data as $k => $v)
{
	
	$sql_1 = "select bs_cpr_onsite_date, bs_cpr_onsite_user from business_sellers where bs_business_id = ".$v['bsn_id'];
	$ondata = $fwDb->queryOne($sql_1);
	
	$sql = "update business set bsn_starting_onsite_date = '".$ondata['bs_cpr_onsite_date']. "' where bsn_id = ".$v['bsn_id'];
	$id = $fwDb->queryOne($sql);
	
	$sql_2 = "update business set bsn_onsite_user = '".$ondata['bs_cpr_onsite_user']. "' where bsn_id = ".$v['bsn_id'];
	$id3 = $fwDb->queryOne($sql_2);
	
	
	
	
}
exit;
