<?php
// $fwViewData['blank_page'] = true;


$pagenum = $fwRequest->getparamget('pagenum', 0);
$table = new Fw_Db_Table('template_docs');
$where = "WHERE 1 = 1";

$pd = $fwRequest->getParam('pd', '');
$filter_pd = preg_replace('/\D/', '', $pd);
$fwViewData['filter_pd'] = $filter_pd;

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "https://ai.deckquotes.com.au/api/v1/procedure/document?id=$pd");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    'Authorization: Bearer A9fK2LmP4QX7ZbR3', // Set the Bearer token
    'Accept: application/json'        // Optional: ensure API returns JSON
]);
$response = curl_exec($ch);
curl_close($ch);
$procedureData = json_decode($response, true);

$jsonData = json_encode($procedureData, JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_UNESCAPED_SLASHES);
$fwViewData['json_script_data'] = $jsonData;

if ($filter_pd > 0) {
	//$title_sql = "SELECT dh_ai_procedure FROM `template_docs` where dh_id = ".$filter_pd;
	$title_sql = "SELECT dh_title FROM `template_docs` where dh_id = " . $filter_pd;
	$title_Data = $fwDb->queryOne($title_sql);
	$fwViewData['title'] = $title_Data['dh_title'];
} else {
	$fwViewData['title'] = $MODULE_PLURAL;
}