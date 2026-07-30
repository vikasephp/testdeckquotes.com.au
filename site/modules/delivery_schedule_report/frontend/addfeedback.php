<?php
$fwMainView = 'file:' . getcwd() . '/addfeedback.tpl';
$table = new Fw_Db_Table('delivery_schedule_report');
$submit = $fwRequest->getParam('feedbacksave', '');
$ds_id = $fwRequest->getParam('ds_id', 0);


$fwViewData['title'] = 'Add Feedback';

	
	if(!empty($submit))
	{
		
		 $detail['ds_feedback'] = $fwRequest->getParam('feedback','');
		 //db($detail);
		 //exit;
		 
		 $table->setWhere("ds_id = $ds_id");
	     	 $opr = $table->updateRow($detail);   
    	
		  if($opr){$fwViewData['opr'] = "Success!";}
	}

	

	$table->setWhere("ds_id = $ds_id");
	$fwViewData['detail'] = $table->getRow();
	
