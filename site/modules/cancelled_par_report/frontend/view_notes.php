<?php
$fwMainView = 'file:' . getcwd() . '/view_notes.tpl';
$cp_id = (int)$fwRequest->getParam('cp_id', 0);
	
$sql = "Select * from cancellation_par_notes where cn_cp_id = ".$cp_id ;
$data = $fwDb->query($sql);

$fwViewData['cp_id'] = $cp_id;
$fwViewData['notesdata'] = $data; 