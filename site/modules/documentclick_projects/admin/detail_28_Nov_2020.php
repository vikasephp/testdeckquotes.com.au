<?php

$table = new Fw_Db_Table('business');
$submit = $fwRequest->getParam('updateselect', '');

if($submit) {


$data2 = $fwRequest->getParam('projects', array());

$bsn = "(";
	
foreach($data2 as $k => $v)
{
	$bsn .= $k .",";	
}
$bsn .= " 0)";

$sql_1 = "update business set bsn_show_documentclick = 1 where bsn_id IN ".$bsn;
$fwDb->queryOne($sql_1);

$sql_2 = "update business set bsn_show_documentclick = 0 where bsn_id NOT IN ".$bsn;
$fwDb->queryOne($sql_2);
	//foreach($data as $k => $v)
//	{
//		if($v == 'on') {
//			 $detail['bsn_show_documentclick'] = 1; 
//		} else {
//			$detail['bsn_show_documentclick'] = 0;	
//		}
//		
//		
//			
//		$table->setWhere('bsn_id = '.$k);
//		$table->updateRow($detail);
//			
//	}
	

}

$tablePages = new Fw_Db_Table('business');
$tablePages->setOrderBy('bsn_id'.' DESC');
$catdata=$tablePages->getAllRows();
$fwViewData['list'] = $catdata; 
$fwViewData['title'] = $MODULE_PLURAL;