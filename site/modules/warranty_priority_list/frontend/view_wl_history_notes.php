<?php
$fwMainView = 'file:' . getcwd() . '/view_wl_history_notes.tpl';

//Query to Show Data Order by Date
$query = "SELECT * FROM (
  SELECT 
    wln.wn_id AS id, 
    wln.wn_wa_id AS log_id, 
    STR_TO_DATE(wln.wn_date, '%d-%m-%Y') AS date, 
    wln.wn_notes AS notes, 
    wln.wn_added_by AS added_by, 
	(
		SELECT wa_project FROM warranty_log WHERE wa_id = wln.wn_wa_id
	) AS wa_project,
    DATEDIFF(STR_TO_DATE(wln.wn_due_date, '%d-%m-%Y'), CURDATE()) AS diff_date,
    wln.wn_resolved AS resolved_status,
	wln.wn_due_date as due_date,
    'warranty_log_notes' AS source_table
  FROM warranty_log_notes wln 

  UNION ALL

  SELECT 
    ws.ws_id AS id, 
    ws.ws_wa_id AS log_id, 
    DATE(ws.ws_date) AS date, 
    ws.ws_update_text AS notes, 
    ws.ws_supplier_name AS added_by, 
	(
		SELECT wa_project FROM warranty_log WHERE wa_id = ws.ws_wa_id
	) AS wa_project,
    DATEDIFF(STR_TO_DATE(ws.ws_due_date, '%d-%m-%Y'), CURDATE()) AS diff_date,
    ws.ws_resolved AS resolved_status,
	ws.ws_due_date as due_date,
    'warranty_supplier_update' AS source_table
  FROM warranty_supplier_update ws
) AS combined
ORDER BY combined.date DESC";

$result = $fwDb->query($query);
$fwViewData['data'] = $result;

$fwViewData['title'] = "Warranty Log Notes History";