<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);

$api_key = "8f7c2d91b4e6a3f5c8d1e7b9a2f4c6d8";
$apiUrl = "https://buyersagentcanberra.com.au/wp-json/custom/v1/members";

$ch = curl_init($apiUrl);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    'x-api-key: '.$api_key
]);

$response = curl_exec($ch);

if (curl_errno($ch)) {
    echo curl_error($ch);
}

curl_close($ch);

$data = json_decode($response, true);

//echo "<pre>"; print_r($data['members']); exit('Checking');

$matsql = "SELECT $TABLE.* FROM $TABLE";
//echo $matsql;

$resultData = $fwDb->query($matsql);

if (!empty($resultData)) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}
	$rows = count($resultData);
	$page_rows = 300;
	$last = ceil($rows / $page_rows);
	if ($pagenum <= 1) {
		$pagenum = 1;
	} elseif ($pagenum > $last) {
		$pagenum = $last;
	}
	$fwViewData['last'] = $last;
	$fwViewData['lastone'] = $last - 1;
	$fwViewData['lasttow'] = $last - 2;
	$fwViewData['pagenum'] = $pagenum;
	$pagenatedatanext = $pagenum;
	$pagenatedataprev = $pagenum;
	for ($i = 0; $i < 9; $i++) {
		$paginate[$pagenatedatanext] = $pagenatedatanext;
		$pagenatedatanext++;
	}
	$fwViewData['paginatenext'] = $paginate;
	$pagenatedataprev = $pagenum;
	for ($i = 0; $i < 9; $i++) {
		$paginateprev[$pagenatedataprev] = $pagenatedataprev;
		$pagenatedataprev--;
	}
	$fwViewData['paginateprev'] = array_reverse($paginateprev);

	$max = 'limit ' . ($pagenum - 1) * $page_rows . ',' . $page_rows;
}

$fwViewData['list'] = $data['members'];

$fwViewData['title'] = $MODULE_PLURAL;
