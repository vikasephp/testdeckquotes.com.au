<?php
$fwMainView = 'file:' . getcwd() . '/notes.tpl';
$table = new Fw_Db_Table('sub_pages');
 
$add_notes = $fwRequest->getParam('add_notes', '');

$sp_id = $fwRequest->getParam('sp_id', 0);
$fwViewData['sp_id']= $sp_id;


if($add_notes)
{
	$sp_id = $fwRequest->getParam('sp_id', '');
	$notesData = $fwRequest->getParam('sp_notes', '');
	

	
	$table->setWhere('sp_id = '.$sp_id);
	if($table->rowExists())
	{
		$notes['sp_notes'] = $notesData;
		$detail = $table->updateRow($notes);
	}	
	$fwViewData['opr'] = "Close";	
}
 
 
     $sqlnotes = "Select sp_notes  from  sub_pages where sp_id = ".$sp_id;
     $notesData = $fwDb->queryOne($sqlnotes);
	 $fwViewData['sp_notes'] = $notesData['sp_notes'];
	 
		