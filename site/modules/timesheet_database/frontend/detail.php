<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$table = new Fw_Db_Table('timesheet_database');
$submit = $fwRequest->getParam('subAddDetail', '');

 $fwViewData['td_open_date'] =  $fwRequest->getParam('opdt', '');

if(!empty($submit))
{
    $td_open_date =  $fwRequest->getParam('opendate', '');
	$detail = $fwRequest->getParam('timesheet', array());
	//$this_id = (int)$detail[$ID];
  	
	$detail['td_open_date'] = $td_open_date;
	$detail['td_user'] = $_SESSION['user']['user_name'];		
	$opr = $table->insertRow($detail); 
	
    $fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
}


	