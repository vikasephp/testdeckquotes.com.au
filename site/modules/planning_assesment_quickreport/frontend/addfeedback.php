<?php
$fwMainView = 'file:' . getcwd() . '/addfeedback.tpl';
$tableFeedback = new Fw_Db_Table('feedback');
$submit = $fwRequest->getParam('subAddDetail', '');
$bsn_id = $fwRequest->getParam('bsn_id', 0);

$fwViewData['title'] = 'Add Feedback';

	$tablesalesfollowup = new Fw_Db_Table('sales_followup');
	$sf_id = $fwRequest->getparamget('sf_id', 0);
	$bus_id = $fwRequest->getparamget('bus_id', 0);
	$submit = $fwRequest->getparam('feedbacksave','');
	
	if(!empty($submit))
	{
		{
		$detail = $fwRequest->getparam('follows',array());
		$detail['sf_notes'] = stripslashes($detail['sf_notes']);
		
	
		
		$this_id = (int)$detail['sf_id'];
		unset($detail['sf_id']);
		if($detail['sf_date']): $detail['sf_date'] = changedate_y_m_d($detail['sf_date']); endif;
		if($this_id > 0){
			$tablesalesfollowup->setWhere("sf_id = ".$this_id);	
			$tablesalesfollowup->updateRow($detail);
			}else{
			$detail['sf_pid'] = $bsn_id;
			$detail['sf_user_id'] = $_SESSION['user']['user_id'];
			$detail['sf_status'] = 'Active';
			$tablesalesfollowup->insertRow($detail);
			
			}
		}
    	
				if($bsn_id){$fwViewData['opr'] = "Success!";}
	}
	
	$tablefollowsource = new Fw_Db_Table('sales_followup_options');
	$tablefollowsource -> setWhere("sfo_status = 'Active'");
	$fwViewData['alltablefollowsource'] = $tablefollowsource->getRows();
	
	$tablefollowtypes = new Fw_Db_Table('sales_followup_types');
	$tablefollowtypes -> setWhere("tfo_status = 'Active'");
	$fwViewData['alltablefollowtypes'] = $tablefollowtypes->getRows();
	
