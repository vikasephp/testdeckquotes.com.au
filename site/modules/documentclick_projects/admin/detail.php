<?php

$table = new Fw_Db_Table('business');

$submitstatus = $fwRequest->getParam('updatestatus', '');
if($submitstatus)
{
$docdata = $fwRequest->getParam('status', '');

$status1 = "";
$status2 = "";

$stchk1 = '(';
$stchk2 = '(';

foreach($docdata as $ks => $vs)
{
	$status1 .= " bsn_status like '%|".$vs ."|%' or";
	$status2 .= " bsn_status not like '%|".$vs ."|%' and ";
	
	$stchk1 .= $vs .",";
	$stchk2 .= $vs .",";
}

	$stchk1 .="0)";
	$stchk2 .="0)";

$status1 .= " bsn_status like '%|-1|%'";
$status2 .= " bsn_status not like '%|-1|%'";

$sql_5 = "update busness_status set st_click_project = 1 where st_id in ". $stchk1;
$fwDb->queryOne($sql_5);

$sql_6 = "update busness_status set st_click_project = 0 where st_id not in ". $stchk2;
$fwDb->queryOne($sql_6);

$sql_3 = "update business set bsn_show_documentclick = 1 where ". $status1;
$fwDb->queryOne($sql_3);

$sql_4 = "update business set bsn_show_documentclick = 0 where ". $status2;
$fwDb->queryOne($sql_4);

}

$submit = $fwRequest->getParam('updateselect', '');
if($submit) {

	$docdata = $fwRequest->getParam('doc_click', '');	

	$bsn = "(";
		
	foreach($docdata as $k => $v)
	{
		$bsn .= $v .",";	
	}
	$bsn .= " 0)";
	
	
	$sql_1 = "update business set bsn_show_documentclick = 1 where bsn_id IN ".$bsn;
	$fwDb->queryOne($sql_1);
	
	$sql_2 = "update business set bsn_show_documentclick = 0 where bsn_id NOT IN ".$bsn;
	$fwDb->queryOne($sql_2);

	}



$submitselected = $fwRequest->getParam('showselected', '');
if(!empty($submitselected))
{
$tablePages = new Fw_Db_Table('business');
	$tablePages->setWhere('bsn_show_documentclick = 1');
	$tablePages->setOrderBy('bsn_id'.' DESC');
	$catdata=$tablePages->getAllRows();
	$fwViewData['list'] = $catdata; 	
}
else {

	$tablePages = new Fw_Db_Table('business');

	$tablePages->setOrderBy('bsn_id'.' DESC');
	$catdata=$tablePages->getAllRows();
	$fwViewData['list'] = $catdata; 
}

$fwViewData['title'] = $MODULE_PLURAL;


$tablestatus = new Fw_Db_Table('busness_status');
$tablestatus->setOrderBy('st_id'.' ASC');
$fwViewData['business_status']=$tablestatus->getAllRows();