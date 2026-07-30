<?php

$table = new Fw_Db_Table('pro_plan_quality_assu_checklist');

$cno = $fwRequest->getParam('cno', '');
$bsn_id = $fwRequest->getParam('bsn_id', '');

$fwViewData['bsn_id'] = $bsn_id;
$fwViewData['cno'] =    $cno;

$sqlbsn = "Select bsn_name from business where bsn_id = ".$bsn_id;
$bsnData = $fwDb->queryOne($sqlbsn);
$fwViewData['bsn_name'] = $bsnData['bsn_name'];

$sql = "Select pro_plan_quality_assu_checklist.* , elements.* from pro_plan_quality_assu_checklist
        Inner Join elements on pro_plan_quality_assu_checklist.qac_el_id = elements.el_id
	where pro_plan_quality_assu_checklist.qac_bsn_id = ". $bsn_id . " And  pro_plan_quality_assu_checklist.qac_chk_no  = ".$cno;
		
 $rdetail = $fwDb->query($sql);

 $fwViewData['rdetail'] = $rdetail;
 

$fwViewData['title'] = "Run New Report";

$gsubmit = $fwRequest->getParam('generate', '');

if(!empty($gsubmit))
{
	$table = new Fw_Db_Table('pro_plan_quality_assu_checklist');
	$detail_2 = $fwRequest->getParam('element_data', array());

	  
	foreach($detail_2 as $k1=>$v1)
	{
		
		if($v1['yesno']) { $data['qac_yes_no'] = 1; } else { $data['qac_yes_no'] = 0; } 
		$data['qac_user'] =  $_SESSION['user']['user_name'];
		$data['qac_when'] = date('d-m-Y');
		
		$data['qac_comment'] = $v1['comment'];
		$table->setWhere("qac_bsn_id = ".$v1['bsn_id'] . " and qac_chk_no = '" .$v1['cno']. "' and qac_el_id = ".$v1['el_id'] );
		
	        if($table->rowExists()) {
			
			$fwViewData['opr'] = $table->updateRow($data);
		}
		
	}
	Location(BASE_URL . 'project_plans_qa_checklist_report.home');
}

$synchronize = $fwRequest->getParam('synchronize', '');

if($synchronize) {
	$bsn_id = $fwRequest->getParam('bsn_id', '');
	$cno = $fwRequest->getParam('cno', '');
	$syncData['qac_bsn_id'] = $bsn_id;
	$syncData['cno'] = $cno;
	
	
	
	$sql_el = "Select el_id from elements";
	$detailEl = $fwDb->query($sql_el);
	
	foreach($detailEl as $ke => $kv)
	{
		
		$table->setWhere("qac_bsn_id = ".$bsn_id . " and qac_chk_no = '" .$cno. "' and qac_el_id = ".$kv['el_id'] );
		
		if(!$table->rowExists()) {
			$syncData['qac_bsn_id'] = $bsn_id;
			$syncData['qac_chk_no'] = $cno;
			$syncData['qac_el_id'] = $kv['el_id'];
			$fwViewData['opr'] = $table->insertRow($syncData);
		}
		unset($syncData);
	}
	Location(BASE_URL . 'project_plans_qa_checklist_report.report_edit/cno/'.$cno.'/bsn_id/'.$bsn_id);
}
