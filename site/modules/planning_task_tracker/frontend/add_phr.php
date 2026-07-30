<?php
$fwMainView = 'file:' . getcwd() . '/add_phr.tpl';
$tablePhdr = new Fw_Db_Table('post_hia_design_report');

$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);
$fwViewData['bsn_id'] = $bsn_id;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $request = $fwRequest->getParam('request', array());
	$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);
	 
	$sqlphr = "select ph_request from post_hia_design_report where ph_bsn_id = ".$bsn_id;

	$data = $fwDb->queryOne($sqlphr);
	
	
	
	if($data['ph_request'] == $request) 
	{
		$fwViewData['opr'] = " This option is already added";
		
	}
	else {	
	
	 $sql = "Select bsn_name from business where bsn_id = ".$bsn_id;
	 $bsData = $fwDb->queryOne($sql);
	 
	 $detail['ph_bsn_name'] = $bsData['bsn_name'];
	 $detail['ph_bsn_id'] = $bsn_id;
	 $detail['ph_addto_user'] = $_SESSION['user']['user_name'];
	 $detail['ph_addto_date'] = date('d-m-Y');
	 $detail['ph_request'] = $request;
	 
     $opr = $tablePhdr->insertRow($detail); 
	   	
	 $fwViewData['opr'] = "Records added successfully";
	 
	 $usr = $_SESSION['user']['user_name'];
	 $dt = date('d-m-Y');
	 
	 $sql1 = "update business_sellers set bs_ptt_atop_user  = '".$usr."' where bs_business_id = ".$bsn_id;
	 $fwDb->queryOne($sql1);
	 
	 $sql2 = "update business_sellers set bs_ptt_atop_date  = '".$dt."' where bs_business_id = ".$bsn_id;
	 $fwDb->queryOne($sql2);
	 
	}

}

