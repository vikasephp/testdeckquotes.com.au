<?php
$fwMainView = 'file:' . getcwd() . '/addfeedback.tpl';
$tableBusiness = new Fw_Db_Table('business');
$submit = $fwRequest->getParam('subAddDetail', '');
$bsn_id = $fwRequest->getParam('bsn_id', 0);


	$tableBusiness->setWhere("bsn_id = $bsn_id");
	$fwViewData['detail'] = $tableBusiness->getRow();
        $fwViewData['title'] = 'Add/View Feedback';

	
	$submit = $fwRequest->getParam('feedbacksave', '');
	
	if(!empty($submit))
	{
    	$detail['bsn_project_story'] = $fwRequest->getParam('bsn_project_story', '');
		
		
		
		if($bsn_id )
				{
				
							$tableBusiness->setWhere("bsn_id = ".$bsn_id );
							$this_id = $tableBusiness->updateRow($detail);		
				}
	
				if($bsn_id){$fwViewData['opr'] = "Success!";}
	}