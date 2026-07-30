<?php
$fwMainView = 'file:' . getcwd() . '/proposal_alert_action.tpl';
$be_id = $fwRequest -> getParamget('be_id','');
$bsn_id = $fwRequest -> getParamget('bsn_id','');
	
	
$fwViewData['bsn_id'] = $bsn_id;
			
$submit = $fwRequest->getParam('updatetask', '');

if(!empty($submit))
{		
	$be_action_date = $fwRequest->getparam('be_action_date','');
	
	$sql_update = "UPDATE proposal_alert SET  be_action_date = '" .$be_action_date. "' WHERE be_id = ". $be_id;				
	
	if(!empty($sql_update))
	{
		$fwDb -> queryOne($sql_update);
	}
}
		
$sql = "select be_action_date from  proposal_alert WHERE be_id = ". $be_id;	

$data = $fwDb -> queryOne($sql);
$fwViewData['action_date'] = $data['be_action_date'];