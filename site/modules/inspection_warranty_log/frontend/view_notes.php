<?php

$fwMainView = 'file:' . getcwd() . '/view_notes.tpl';
$wa_id = (int) $fwRequest->getParam('wa_id', 0);

$query = 'SELECT bsn_id FROM business AS B INNER JOIN warranty_log AS WL ON WL.wa_project = B.bsn_name WHERE WL.wa_id = ' . $wa_id . ';';
$result = $fwDb->queryOne($query);
$fwViewData['bsn_id'] = $result['bsn_id'];

$ord = " ORDER BY if(  warranty_log_notes.wn_date = ' '
         OR warranty_log_notes.wn_date IS NULL , 1, 0 ) , STR_TO_DATE( warranty_log_notes.wn_date, '%d-%m-%Y' ) DESC";

$ord2 = " ORDER BY if(  warranty_supplier_update.ws_date = ' '
         OR warranty_supplier_update.ws_date IS NULL , 1, 0 ) ,  warranty_supplier_update.ws_date DESC";

$sql = "Select warranty_log_notes.*, DATEDIFF(STR_TO_date(wn_due_date, '%d-%m-%Y'), CURDATE() ) as diff_wn 
        from warranty_log_notes where wn_wa_id = " . $wa_id . ' ' . $ord;
$data = $fwDb->query($sql);

$sql2 = 'Select count(*) as tot from warranty_log_notes where wn_wa_id = ' . $wa_id;
$data2 = $fwDb->queryOne($sql2);

$sql_2 = "Select ws_id,ws_supplier_name, ws_update_text,ws_attachment, ws_attachment_2, ws_attachment_3, ws_attachment_4,
          ws_attachment_5, ws_date,ws_wr, ws_due_date , ws_resolved,
          DATEDIFF(STR_TO_date(ws_due_date, '%d-%m-%Y'), CURDATE() ) as diff_ws 
          from warranty_supplier_update 
          where  ws_wa_id = " . $wa_id . $ord2;
$suData = $fwDb->query($sql_2);

$sql3 = 'Select count(*) as tot from warranty_supplier_update where ws_wa_id = ' . $wa_id;
$data3 = $fwDb->queryOne($sql3);

foreach ($suData as $k => $v) {
	$suData[$k]['ws_date'] = changedate_d_m_y($v['ws_date']);
}

$sql_nt = "Select max(STR_TO_DATE(wn_date, '%d-%m-%Y' )) as notes_date from warranty_log_notes where wn_wa_id = " . $wa_id;
$ntdata = $fwDb->queryOne($sql_nt);

$sql_nt2 = 'Select max(ws_date) as notes_date2 from warranty_supplier_update where ws_wa_id = ' . $wa_id;
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
	if (! isset($attachmentData[$row['wna_wn_id']])) {
		$attachmentData[$row['wna_wn_id']] = [];
	}
	$attachmentData[$row['wna_wn_id']][] = $row['wna_attachment'];
}

foreach ($data as $index => $record) {
	$data[$index]['attachments'] = isset($attachmentData[$record['wn_id']]) ? $attachmentData[$record['wn_id']] : [];
	// $data[$index]['attachments_count'] = isset($attachmentData[$record['wn_id']]) ? count($attachmentData[$record['wn_id']]) : 0;
}

$fwViewData['wa_id'] = $wa_id;
$fwViewData['notesdata'] = $data;
$fwViewData['total'] = $data2['tot'] + $data3['tot'];
$fwViewData['sudata'] = $suData;
$fwViewData['attachmentData'] = $attachmentData;

// New Query to Show Data Order by Date
$queryN = "SELECT * FROM (
  SELECT 
    wln.wn_id AS id, 
    wln.wn_wa_id AS log_id, 
    STR_TO_DATE(wln.wn_date, '%d-%m-%Y') AS date, 
    wln.wn_notes AS notes, 
    wln.wn_added_by AS added_by, 
    (
    SELECT wna_attachment FROM warranty_log_note_attachments 
    WHERE wna_wn_id = wln.wn_id ORDER BY wna_id DESC LIMIT 1 OFFSET 0
  ) AS attachment,
  (
    SELECT wna_attachment FROM warranty_log_note_attachments 
    WHERE wna_wn_id = wln.wn_id ORDER BY wna_id DESC LIMIT 1 OFFSET 1
  ) AS attachment2,
  (
    SELECT wna_attachment FROM warranty_log_note_attachments 
    WHERE wna_wn_id = wln.wn_id ORDER BY wna_id DESC LIMIT 1 OFFSET 2
  ) AS attachment3,
  (
    SELECT wna_attachment FROM warranty_log_note_attachments 
    WHERE wna_wn_id = wln.wn_id ORDER BY wna_id DESC LIMIT 1 OFFSET 3
  ) AS attachment4,
  (
    SELECT wna_attachment FROM warranty_log_note_attachments 
    WHERE wna_wn_id = wln.wn_id ORDER BY wna_id DESC LIMIT 1 OFFSET 4
  ) AS attachment5,
    wln.wn_attachment AS attachment6,
    DATEDIFF(STR_TO_DATE(wln.wn_due_date, '%d-%m-%Y'), CURDATE()) AS diff_date,
    wln.wn_resolved AS resolved_status,
	wln.wn_due_date as due_date,
    'warranty_log_notes' AS source_table
  FROM warranty_log_notes wln 
  WHERE wln.wn_wa_id = " . $wa_id . "

  UNION ALL

  SELECT 
    ws.ws_id AS id, 
    ws.ws_wa_id AS log_id, 
    DATE(ws.ws_date) AS date, 
    ws.ws_update_text AS notes, 
    ws.ws_supplier_name AS added_by, 
    ws.ws_attachment AS attachment, 
    ws.ws_attachment_2 AS attachment2, 
    ws.ws_attachment_3 AS attachment3, 
    ws.ws_attachment_4 AS attachment4, 
    ws.ws_attachment_5 AS attachment5, 
    Null AS attachment6,
    DATEDIFF(STR_TO_DATE(ws.ws_due_date, '%d-%m-%Y'), CURDATE()) AS diff_date,
    ws.ws_resolved AS resolved_status,
	ws.ws_due_date as due_date,
    'warranty_supplier_update' AS source_table
  FROM warranty_supplier_update ws 
  WHERE ws.ws_wa_id = " . $wa_id . "
  
  UNION ALL
  
  SELECT 
    wlcdcn.cdcn_id AS id, 
    wlcdcn.cdcn_wa_id AS log_id, 
    DATE(wlcdcn.cdcn_added_date) AS date, 
    wlcdcn.cdcn_notes AS notes, 
    wlcdcn.cdcn_added_by AS added_by, 
    Null AS attachment, 
    Null AS attachment2, 
    Null AS attachment3, 
    Null AS attachment4, 
    Null AS attachment5, 
    Null AS attachment6,
    Null AS diff_date,
    0 AS resolved_status,
	Null as due_date,
    'warranty_log_cgfbdirectcosts_notes' AS source_table
  FROM warranty_log_cgfbdirectcosts_notes wlcdcn
  WHERE wlcdcn.cdcn_add_to_main_notes = 1 and wlcdcn.cdcn_wa_id = " . $wa_id . '
) AS combined
ORDER BY combined.date DESC';
$resultN = $fwDb->query($queryN);

$fwViewData['dataN'] = $resultN;
