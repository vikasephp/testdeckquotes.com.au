<?php
$fwMainView = 'file:' . getcwd() . '/view_notes.tpl';
$wa_id = (int)$fwRequest->getParam('wa_id', 0);

$ord =  " ORDER BY if(  warranty_log_notes.wn_date = ' '
         OR warranty_log_notes.wn_date IS NULL , 1, 0 ) , STR_TO_DATE( warranty_log_notes.wn_date, '%d-%m-%Y' ) DESC";

$ord2 =  " ORDER BY if(  warranty_supplier_update.ws_date = ' '
         OR warranty_supplier_update.ws_date IS NULL , 1, 0 ) ,  warranty_supplier_update.ws_date DESC";

$sql = "Select warranty_log_notes.*, DATEDIFF(STR_TO_date(wn_due_date, '%d-%m-%Y'), CURDATE() ) as diff_wn 
        from warranty_log_notes where wn_wa_id = " . $wa_id . ' ' . $ord;
$data = $fwDb->query($sql);

$sql2 = "Select count(*) as tot from warranty_log_notes where wn_wa_id = " . $wa_id;
$data2 = $fwDb->queryOne($sql2);

$sql_2 = "Select ws_id,ws_supplier_name, ws_update_text,ws_attachment, ws_attachment_2, ws_attachment_3, ws_attachment_4,
          ws_attachment_5, ws_date,ws_wr, ws_due_date , ws_resolved,
          DATEDIFF(STR_TO_date(ws_due_date, '%d-%m-%Y'), CURDATE() ) as diff_ws 
          from warranty_supplier_update 
          where  ws_wa_id = " . $wa_id . $ord2;
$suData = $fwDb->query($sql_2);

$sql3 = "Select count(*) as tot from warranty_supplier_update where ws_wa_id = " . $wa_id;
$data3 = $fwDb->queryOne($sql3);

foreach ($suData as $k => $v) {
	$suData[$k]['ws_date'] = changedate_d_m_y($v['ws_date']);
}

$sql_nt = "Select max(STR_TO_DATE(wn_date, '%d-%m-%Y' )) as notes_date from warranty_log_notes where wn_wa_id = " . $wa_id;
$ntdata = $fwDb->queryOne($sql_nt);


$sql_nt2 = "Select max(ws_date) as notes_date2 from warranty_supplier_update where ws_wa_id = " . $wa_id;
$ntdata2 = $fwDb->queryOne($sql_nt2);


if (strtotime($ntdata['notes_date']) > strtotime($ntdata2['notes_date2'])) {
	$fwViewData['top'] = 1;
} else {
	$fwViewData['top'] = 2;
}

$query = 'SELECT wna_wn_id, wna_attachment FROM warranty_log_note_attachments ORDER BY wna_id DESC';
$result = $fwDb->query($query);
$attachmentData = [];
foreach ($result as $row) {
	if(!isset($attachmentData[$row['wna_wn_id']])) {
		$attachmentData[$row['wna_wn_id']] = [];
	}
	$attachmentData[$row['wna_wn_id']][] = $row['wna_attachment'];
}

foreach($data as $index => $record) {
	$data[$index]['attachments'] = isset($attachmentData[$record['wn_id']]) ? $attachmentData[$record['wn_id']] : [];
	// $data[$index]['attachments_count'] = isset($attachmentData[$record['wn_id']]) ? count($attachmentData[$record['wn_id']]) : 0;
}


$fwViewData['wa_id'] = $wa_id;
$fwViewData['notesdata'] = $data;
$fwViewData['total'] = $data2['tot'] + $data3['tot'];
$fwViewData['sudata'] = $suData;
$fwViewData['attachmentData'] = $attachmentData;
