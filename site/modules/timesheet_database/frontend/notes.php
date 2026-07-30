<?php
$fwMainView = 'file:' . getcwd() . '/notes.tpl';
$table = new Fw_Db_Table('timesheet_database');
 
$add_notes = $fwRequest->getParam('add_notes', '');

$td_id = $fwRequest->getParam('td_id', 0);
$fwViewData['td_id']= $td_id;


if($add_notes)
{
	$td_id = $fwRequest->getParam('td_id', '');
	$notesData = $fwRequest->getParam('td_notes', '');
	

	
	$table->setWhere('td_id = '.$td_id);
	if($table->rowExists())
	{
		$notes['td_notes'] = $notesData;
		$detail = $table->updateRow($notes);
	}	
	//$fwViewData['opr'] = "Close";	
}
 
 
     $sqlnotes = "Select td_notes  from  timesheet_database where td_id = ".$td_id;
     $notesData = $fwDb->queryOne($sqlnotes);
	 $fwViewData['td_notes'] = $notesData['td_notes'];
	 
		