<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);
$where = " where 1 = 1 ";


$clear = $fwRequest->getParam('clear', '');
if (!empty($clear)) {
	
	unset($_SESSION['im_type']);
	$fwViewData['im_type']= '';

	unset($_SESSION['im_responsible_person']);
	$fwViewData['im_responsible_person']= '';
	

}


$matsql = "SELECT $TABLE.* FROM $TABLE  where  	car_add_to_ae  = 1" ;


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

	$sql2 =  $matsql . " " . $max;
	if ($sql2) {
		$lists = $fwDb->query($sql2);

		foreach ($lists as $list):
			$list['link'] =  $BASE_URL . "business.detail/bsn_id/" . $list['va_bsn_id'];			
			$listsnew[] = $list;
		endforeach;

		$fwViewData['list'] = $listsnew;
		//echo "<pre>"; print_r($lists); exit();
	}
}


foreach($listsnew as $k => $v)
{
	
	$sql_1 = "SELECT  ime_email_template FROM insurance_manager_email where ime_id  = ".$v['im_template_email'];
	$emailcode = $fwDb->queryOne($sql_1);

	
	$sql_2 = "select eml_id from emaillibrary where eml_code = '".$emailcode['ime_email_template']."'";
	

	$emailid = $fwDb->queryOne($sql_2);
	
	$listsnew[$k]['eml_id'] = $emailid['eml_id'];
	
}
$fwViewData['list'] = $listsnew;	

$sql_type = "SELECT * FROM insurance_manager_type";
$fwViewData['typeData'] = $fwDb->query($sql_type);







