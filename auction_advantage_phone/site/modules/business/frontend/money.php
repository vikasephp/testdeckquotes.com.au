<?php
$fwMainView = 'file:' . getcwd() . '/money.tpl';
$project_money = new Fw_Db_Table('project_money');
$business = new Fw_Db_Table('business');
$user_id = $_SESSION['user']['user_id'];

$fwViewData['user_id']=$user_id;
$fwViewData['bsn_id'] = $fwRequest->getParam('bsn_id', 0);

$pm_id = $fwRequest->getParam('pm_id', 0);
$submit = $fwRequest->getParam('subAddDetail', '');
if($submit)
{
 $detail = $fwRequest->getParam($TABLE, array());
 $table_id =  (int)$detail['pm_id'];
  
  $detail['pm_5per_amt'] = ($detail['pm_5per_amt'])? $detail['pm_5per_amt'] : 0;
  $detail['pm_45per_amt'] = ($detail['pm_45per_amt'])? $detail['pm_45per_amt'] : 0;
  $detail['pm_50per_amt'] = ($detail['pm_50per_amt'])? $detail['pm_50per_amt'] : 0;

  if($detail['pm_5per_amt']  == 0): $detail['pm_5per_note']	 = '';  endif;
  if($detail['pm_45per_amt'] == 0): $detail['pm_45per_note'] = '';  endif;
  if($detail['pm_50per_amt'] == 0): $detail['pm_50per_note'] = '';  endif;
  
  unset($detail['pm_id']);
	if($table_id > 0)
		{
			$project_money->setWhere("pm_id = ".$table_id);
			$table_id= $project_money->updateRow($detail);
		}
	else
		{			
			$detail['pm_user'] = $user_id;			
			$table_id=$project_money->insertRow($detail);
		}
$fwViewData['msg'] = $table_id;
}

if($fwViewData['bsn_id'] > 0)
	{
	$business->setWhere("bsn_id = ".$fwViewData['bsn_id']);
	$bsndata = $business->getRow();
	
	$removes = array("$", ",");
	$amount = str_replace($removes, "", $bsndata['bsn_advertLink']);
	
		if($amount > 0):
		$fwViewData['5perval'] = $amount * 5 / 100;
		$fwViewData['45perval'] = $amount * 45 / 100; 
		$fwViewData['50perval'] = $amount * 50 / 100;  
		endif;
		
		$project_money->setWhere("pm_business_id = ".$fwViewData['bsn_id']);
		$fwViewData['detail'] = $project_money->getRow();
		$fwViewData['button'] = "Save";
	}
$fwViewData['title'] = "Money Section";