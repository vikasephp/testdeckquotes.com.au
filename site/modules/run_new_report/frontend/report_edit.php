<?php

$table = new Fw_Db_Table('pro_plan_quality_assu_checklist');

$ar_id = $fwRequest->getParam('ar_id', '');

$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status_date from business_sellers 		
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id";
		
$fwViewData['projdetail'] = $fwDb->query($sql);

$fwViewData['pbox'] ='true';
$fwViewData['download'] = 'false';

$psubmit = $fwRequest->getParam('psub', '');
if(!empty($psubmit)) {
	
	$prda = $fwRequest->getParam('projname1', 0);

	$s = explode('|',$prda);
	$pid = $s[0];
	$su  = $s[1];

	$fwViewData['pid'] = $pid;
	$fwViewData['project'] = $su;
	$_SESSION['project'] = $su;
				
	$sql_ele = "select elements.* from elements order by el_order " ;
	$fwViewData['elements_data'] = $fwDb->query($sql_ele);		
}

$fwViewData['title'] = "Run New Report";

$gsubmit = $fwRequest->getParam('generate', '');

if(!empty($gsubmit))
{
	
	 $tableQar = new Fw_Db_Table('quality_assurance_report');
		
	 $detail_1 = $fwRequest->getParam('element', array());
	 $detail_2 = $fwRequest->getParam('element_data', array());
	
	 $qarData['qa_bsn_id'] = $detail_1['id'];
	 $qarData['qa_cno']    = $detail_1['chkno'];
	 $qarData['qa_user']   = $detail_1['user'];
	 
	 $op = $tableQar->insertRow($qarData);
	 
	  
	foreach($detail_2 as $k1=>$v1)
	{
		$data['qac_bsn_id'] = $detail_1['id'];
		$data['qac_chk_no'] = $detail_1['chkno'];
		$data['qac_el_id'] = $k1;
		if($v1['yesno']) { $data['qac_yes_no'] = 1; } else { $data['qac_yes_no'] = 0; } 
		$data['qac_user'] =  $_SESSION['user']['user_name'];
		$data['qac_when'] = date('d-m-Y');
		
		$data['qac_comment'] = $v1['comment'];
		$opr = $table->insertRow($data);
		//db($data);
	}
}
