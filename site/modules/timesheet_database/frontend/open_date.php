<?php
$fwMainView = 'file:' . getcwd() . '/open_date.tpl';
$table = new Fw_Db_Table('timesheet_database');
 
$add_date = $fwRequest->getParam('add_date', '');

//$sp_id = $fwRequest->getParam('sp_id', 0);
//$fwViewData['sp_id']= $sp_id;


if($add_date)
{
	$open_date = $fwRequest->getParam('open_date', '');
	
    $close_date = date('d-m-Y', strtotime($open_date. ' + 7 days'));
	
	$detail['dt_open_date'] = $open_date;
	$detail['dt_close_date'] = $close_date;
    $data = $table->insertRow($detail);
		
	$fwViewData['opr'] = "Close";	
}
 
 
     
	 
		