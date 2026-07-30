<?php
$fwMainView = 'file:' . getcwd() . '/notes.tpl';
$table = new Fw_Db_Table('debt_management');
 
$add_notes = $fwRequest->getParam('add_notes', '');

$dm_id = $fwRequest->getParam('dm_id', 0);
$fwViewData['dm_id']= $dm_id;


if($add_notes)
{
	$dm_id = $fwRequest->getParam('dm_id', '');
	$notesData = $fwRequest->getParam('dm_notes', '');
	

	
	$table->setWhere('dm_id = '.$dm_id);
	if($table->rowExists())
	{
		$notes['dm_notes'] = $notesData;
		$detail = $table->updateRow($notes);
	}	
	$fwViewData['opr'] = "Close";	
}
 
 
     $sqlnotes = "Select dm_notes  from  debt_management where dm_id = ".$dm_id;
     $notesData = $fwDb->queryOne($sqlnotes);
	 $fwViewData['dm_notes'] = $notesData['dm_notes'];
	 
		