<?php
$fwMainView = 'file:' . getcwd() . '/view_update.tpl';
$wa_id = $fwRequest->getParam('wa_id', '');
	
	$sql_2 = "Select ws_supplier_name, ws_update_text,ws_attachment, ws_attachment_2, ws_attachment_3, ws_attachment_4, ws_attachment_5,
	          ws_date,ws_wr from warranty_supplier_update where  ws_wa_id = ".$wa_id;
	$suData = $fwDb->query($sql_2);
	
$fwViewData['sudata'] = $suData;