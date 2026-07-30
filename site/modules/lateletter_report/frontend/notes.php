<?php
$fwMainView = 'file:' . getcwd() . '/notes.tpl';
$table = new Fw_Db_Table('progress_payment_detail');
 
$notes = $fwRequest->getParam('notessave', '');

$ppd_id = $fwRequest->getParam('ppd_id', 0);
$fwViewData['ppd_id']= $ppd_id;
if($notes)
{
	$wp_id = $fwRequest->getParam('ppd_id', '');
	$notes_text = $fwRequest->getParam('notes_text', '');
	
	
	$table->setWhere("ppd_id = $ppd_id");
	if($table->rowExists())
	{
		$notesDetail['ppd_notes'] = $notes_text;
		
		$detail = $table->updateRow($notesDetail);
	}	
	$fwViewData['opr'] = "Close";	
}
 
 
     $sql = "Select ppd_notes  from  progress_payment_detail where ppd_id = ".$ppd_id;
     
     $notesData = $fwDb->queryOne($sql);
	
     $fwViewData['notesData'] = $notesData['ppd_notes'];
	 