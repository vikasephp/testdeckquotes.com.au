<?php
$fwMainView = 'file:' . getcwd() . '/view_notes_checklist.tpl';
$wa_id = (int)$fwRequest->getParam('wa_id', 0);
$ch_id = (int)$fwRequest->getParam('ch_id', 0);


//$ord =  " ORDER BY if(  warranty_log_notes.wn_date = ' '
 //        OR warranty_log_notes.wn_date IS NULL , 1, 0 ) , STR_TO_DATE( warranty_log_notes.wn_date, '%d-%m-%Y' ) DESC";
		 
		 
$sql = "Select * from warranty_checklist_notes where cn_wa_id = ".$wa_id ." and cn_ch_id = ".$ch_id;


$data = $fwDb->query($sql);



$fwViewData['wa_id'] = $wa_id;
$fwViewData['ch_id'] = $ch_id;
$fwViewData['notesdata'] = $data; 
