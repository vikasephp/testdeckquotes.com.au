<?php
$fwMainView = 'file:' . getcwd() . '/notes.tpl';
$table = new Fw_Db_Table('document_proposal_name');
$dpn_unique_id = $fwRequest->getParam('dpn_unique_id', 0);
 
$notesdetail = $fwRequest->getParam('notesdetail', '');

$dpn_unique_id = $fwRequest->getParam('dpn_unique_id', 0);
$fwViewData['dpn_unique_id']= $dpn_unique_id;
if($notesdetail)
{
	$dpn_unique_id = $fwRequest->getParam('dpn_unique_id', '');
	$notesData = $fwRequest->getParam('notes', '');
	
	
	$table->setWhere('dpn_unique_id = '.$dpn_unique_id);
	if($table->rowExists())
	{
		$notes['dpn_er_heritage_notes'] = $notesData;
		$detail = $table->updateRow($notes);
	}	
	$fwViewData['opr'] = "Close";	
}
 
 
     $sqlnotes = "Select dpn_er_heritage_notes  from  document_proposal_name where dpn_unique_id = ".$dpn_unique_id;
     
     $notesData = $fwDb->queryOne($sqlnotes);
	
     $fwViewData['notesData'] = $notesData['dpn_er_heritage_notes'];
	 
