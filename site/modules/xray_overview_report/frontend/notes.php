<?php
$fwMainView = 'file:' . getcwd() . '/notes.tpl';
$table = new Fw_Db_Table('business');
 
$add_notes = $fwRequest->getParam('add_notes', '');

$bsn_id = $fwRequest->getParam('bsn_id', 0);
$fwViewData['bsn_id']= $bsn_id;


if($add_notes)
{
	$bsn_id = $fwRequest->getParam('bsn_id', '');
	$notesData = $fwRequest->getParam('bsn_xor_notes', '');
	

	
	$table->setWhere('bsn_id = '.$bsn_id);
	if($table->rowExists())
	{
		$notes['bsn_xor_notes'] = $notesData;
		$detail = $table->updateRow($notes);
	}	
	$fwViewData['opr'] = "Close";	
}
 
 
     $sqlnotes = "Select bsn_xor_notes  from  business where bsn_id = ".$bsn_id;
     $notesData = $fwDb->queryOne($sqlnotes);
	 $fwViewData['bsn_xor_notes'] = $notesData['bsn_xor_notes'];
	 
		