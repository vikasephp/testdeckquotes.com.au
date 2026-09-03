<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);
$table = new Fw_Db_Table('construction_alert_report');
$tablePhoto = new Fw_Db_Table('alert_escalation_photos');
$where = " where 1 = 1 ";

$fwViewData['title'] = 'Alert Escalation Report';
$fwViewData['BASEFOLDER2']  = 'construction_alert_report';

$clear = $fwRequest->getParam('clear', '');
if (!empty($clear)) {
	
	unset($_SESSION['im_type']);
	$fwViewData['im_type']= '';

	unset($_SESSION['im_responsible_person']);
	$fwViewData['im_responsible_person']= '';
}

$deescalate = $fwRequest->getParam('deescalate', '');
if ($deescalate) {

	$keys = array_keys($deescalate);
	$ky = $keys[0];
	$val = $deescalate[$ky];

	$detail['car_add_to_ae'] = 0;
	
	$table->setWhere('car_id = ' . $ky);
	if ($table->rowExists()) {
		$this_id = $table->updateRow($detail);
	}
}



$save_photo = $fwRequest->getParam('save_photo', '');
if ($save_photo) {

	if ($_FILES['esc_photo']['name']) {
		$car_id = $fwRequest->getParam('car_id', '');

		$doc1 = $_FILES['esc_photo']['name'];
		$file_type = $_FILES['esc_photo']['type'];

		$datetime = trim(date('d_m_Y_H_i_'), '0');
		$doc1 = preg_replace('/[^A-Z0-9._]/i', '_', $doc1);
		$src =  $_FILES['esc_photo']['tmp_name'];

		$docData['aep_photo'] = $doc1;
		$docData['aep_car_id'] = $car_id;

		 upload($doc1, $src);

	
			$detail2 = $tablePhoto->insertRow($docData);
		}		
	}







$matsql = "SELECT $TABLE.* FROM $TABLE  where  car_add_to_ae  = 1 and car_status <> 'Closed'" ;


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
	
	$sqln = "SELECT cn_notes ,cn_date
			FROM alert_escalation_notes
			WHERE cn_car_id = ".$v['car_id']."
			ORDER BY STR_TO_DATE(cn_date, '%d-%m-%Y') DESC
			LIMIT 1";
			
	$notesData = $fwDb->queryOne($sqln);	
	$listsnew[$k]['latest_notes'] = $notesData['cn_notes'];	
	$listsnew[$k]['cn_date'] = $notesData['cn_date'];	
	
	$sql_P = "select * from alert_escalation_photos where aep_car_id = " . $v['car_id'];

	$data1 = $fwDb->query($sql_P);

	
	$listsnew[$k]['eml_id'] = $emailid['eml_id'];
	$listsnew[$k]['photo_data'] = $data1;
	
}
$fwViewData['list'] = $listsnew;	

$sql_type = "SELECT * FROM insurance_manager_type";
$fwViewData['typeData'] = $fwDb->query($sql_type);







