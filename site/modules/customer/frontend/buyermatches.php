<?php
$fwMainView = 'file:' . getcwd() . '/buyermatches.tpl';
$BM_Table = new Fw_Db_Table('byer_matches');
$submit = $fwRequest->getParam('Addbuyermatches', '');
$fwViewData['cust_id'] = $fwRequest -> getParamget('cust_id', 0);
$bm_id = $fwRequest -> getParamget('bm_id',0);
$current_date = date('d-m-Y');
$current_time = date('H:i');


if(!empty($submit))
	{
		$detail = $fwRequest->getParam($TABLE, array());
		
		$bm_id = (int)$detail['bm_id'];
		unset($detail['bm_id']);
				$business_interest = "/";
				$set_states = "/";
				
				
		if($detail['abc']){		
		foreach($detail['abc'] as $k => $v)
		{$business_interest .= $v."/";}
		}
		if($detail['states'])
		{
		foreach($detail['states'] as $k => $v)
		{$set_states .= $v."/";}
		}
	unset($detail['abc']);	
	unset($detail['states']);
	$detail['bm_create_date'] = changedate_y_m_d($detail['bm_create_date']);
	$detail['bm_interest'] = $business_interest;
	$detail['bm_states'] = $set_states;

	
	if($bm_id >0)
		{
		$BM_Table->setWhere("bm_id = ".$bm_id);
		$BM_Table->updateRow($detail);
		}else{
		$BM_Table->insertRow($detail);
		}
		$fwViewData['dataupdate'] = "Success";
	}
if($bm_id>0)
	{
	$BM_Table->setWhere("bm_id = ".$bm_id);
	$fwViewData['detail'] = $BM_Table->getRow();
	
	}
/********** Begin business_interest **********/
	$business_interest_Table = new Fw_Db_Table('business_interest');
	$business_interest_Table->setWhere("bi_parent = 0");
	$interest = $business_interest_Table->getAllRows();
	$fwViewData['interest'] =  $interest;
	$business_interest_Table->setWhere("bi_parent != 0");
	$sub_interest = $business_interest_Table->getAllRows();
	$fwViewData['sub_interest'] =  $sub_interest;
/********** End business_interest **********/

/********** Begin States **********/
	$states_table = new Fw_Db_Table('states');
	$states_table -> setWhere("s_type = 'state'");
	$main_states = $states_table -> getRows();
	$fwViewData['main_states'] = $main_states;
/********** End States **********/
	
	if(empty($detail['bm_create_date'])){$detail['bm_create_date'] = $current_date;}
	if(empty($detail['bm_create_time'])){$detail['bm_create_time'] = $current_time;}
	$fwViewData['detail'] =$detail;