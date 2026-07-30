<?php
$fwMainView = 'file:' . getcwd() . '/notes.tpl';

$td_id = $fwRequest->getParam('td_id', 0);

$table = new Fw_Db_Table('30_days_rec_report');	


	$table->setWhere("td_id = $td_id");
	$fwViewData['detail'] = $table->getRow();
        $fwViewData['title'] = 'Add/View Reason';
	$fwViewData['user_name'] = $user_name;
	
	$submit = $fwRequest->getParam('alertsave', '');
	
	if(!empty($submit))
	{
    		$detail['td_reason'] = $fwRequest->getParam('td_reason', '');

		
		
		if($td_id)
			{
			
				$table->setWhere("td_id = ".$td_id);
				$this_id = $table->updateRow($detail);		
			}
	
				if($td_id){$fwViewData['opr'] = "Success!";}
	}