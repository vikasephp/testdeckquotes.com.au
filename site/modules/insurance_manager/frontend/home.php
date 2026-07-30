<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);
$where = " where 1 = 1 ";

$save_form_files = $fwRequest->getParam('save_form_files', '');

if ($save_form_files && !empty($_FILES['form_files']['name'][0])) {

	$this_id = (int)$fwRequest->getParam($ID, 0);
	$files = $_FILES['form_files'];

	foreach ($_FILES['form_files']['name'] as $index => $name) {
		$record = [];
		$docfile_1 = $name;
		$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);

		$temp_name_1 = $files['tmp_name'][$index];
	
		$fileUploaded = upload($docfile_1, $temp_name_1);
		$record['imf_file_name'] = $docfile_1;
		$table = new Fw_Db_Table('insurance_manager_form');
		$record['imf_im_id'] = $this_id;

	
		$table->insertRow($record);
		 header("Location: " . $_SERVER['REQUEST_URI']);
		 exit;
		//die();
	}
	// die();
}



$save_supporting_docs = $fwRequest->getParam('save_supporting_docs', '');
if ($save_supporting_docs && !empty($_FILES['supporting_docs']['name'][0])) {

	$this_id = (int)$fwRequest->getParam($ID, 0);
	$files = $_FILES['supporting_docs'];

	foreach ($_FILES['supporting_docs']['name'] as $index => $name) {
		$record = [];
		$docfile_1 = $name;
		$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);

		$temp_name_1 = $files['tmp_name'][$index];
	
		$fileUploaded = upload($docfile_1, $temp_name_1);
		$record['imd_supporting_doc'] = $docfile_1;
		$table = new Fw_Db_Table('insurance_manager_docs');
		$record['imd_im_id'] = $this_id;

	
		$table->insertRow($record);
		 header("Location: " . $_SERVER['REQUEST_URI']);
		 exit;
	}
	// die();
}

$additionalFilesArr = [];
$sql = 'SELECT * FROM insurance_manager_form';
$res = $fwDb->query($sql);
foreach ($res as $row) {
	if (!isset($additionalFilesArr[$row['imf_im_id']])) {
		$additionalFilesArr[$row['imf_im_id']] = [];
	}
	$additionalFilesArr[$row['imf_im_id']][$row['imf_id']] = $row['imf_file_name'];
}
$fwViewData['additionalFilesArr'] = $additionalFilesArr;


$additionalFilesArrSD = [];
$sql = 'SELECT * FROM insurance_manager_docs';
$res = $fwDb->query($sql);
foreach ($res as $row) {
	if (!isset($additionalFilesArrSD[$row['imd_im_id']])) {
		$additionalFilesArrSD[$row['imd_im_id']] = [];
	}
	$additionalFilesArrSD[$row['imd_im_id']][$row['imd_id']] = $row['imd_supporting_doc'];
}
$fwViewData['additionalFilesArrSD'] = $additionalFilesArrSD;

$clear = $fwRequest->getParam('clear', '');
if (!empty($clear)) {
	
	unset($_SESSION['im_type']);
	$fwViewData['im_type']= '';

	unset($_SESSION['im_responsible_person']);
	$fwViewData['im_responsible_person']= '';
	
	unset($_SESSION['im_status']);
	$fwViewData['im_status']= '';
	
	unset($_SESSION['im_responsible_broker']);
	$fwViewData['im_responsible_broker']= '';
	
	unset($_SESSION['im_expiry_date']);
	$fwViewData['im_expiry_date']= '';
}

$type = $fwRequest->getParam('type', '');

if (!empty($type)) {
	$where .= " AND im_type = " . $type;
	$_SESSION['im_type'] = $fwViewData['im_type'] = $im_type;
} elseif ($_SESSION['im_type']) {

	$where .= " AND im_type = " . $_SESSION['im_type'];
}

$status = $fwRequest->getParam('status', '');

if (!empty($status)) {
	$where .= " AND im_status = " . $status;
	$_SESSION['im_status'] = $fwViewData['im_status'] = $status;
} elseif ($_SESSION['im_status']) {

	$where .= " AND im_status = " . $_SESSION['im_status'];
}

$person = $fwRequest->getParam('person', '');

if (!empty($person)) {
	$where .= " AND im_responsible_person = " . $person;
	$_SESSION['im_responsible_person'] = $fwViewData['im_responsible_person'] = $person;
} elseif ($_SESSION['im_responsible_person']) {

	$where .= " AND im_responsible_person = " . $_SESSION['im_responsible_person'];
}

$broker = $fwRequest->getParam('broker', '');

if (!empty($broker)) {
	$where .= " AND im_responsible_broker like '%" . $broker."%'";
	$_SESSION['im_responsible_broker'] = $fwViewData['im_responsible_broker'] = $broker;
} elseif ($_SESSION['im_responsible_broker']) {

	$where .= " AND im_responsible_broker like '%" . $_SESSION['im_responsible_broker']."%'";
}

$exp_date = $fwRequest->getParam('exp_date', '');

if (!empty($exp_date)) {
	$where .= " AND im_expiry_date  = '" . $exp_date."'";
	$_SESSION['im_expiry_date'] = $fwViewData['im_expiry_date'] = $exp_date;
} elseif ($_SESSION['im_expiry_date']) {

	$where .= " AND im_expiry_date  = '" . $_SESSION['im_expiry_date']."'";
}

$matsql = "SELECT $TABLE.* FROM $TABLE  " .$where;


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

$sql_status = "SELECT * FROM insurance_manager_status";
$fwViewData['statusData'] = $fwDb->query($sql_status);

$sqlT = "select * from contacts where cs_company = 2 order by cs_first_name";
$fwViewData['contactdata'] = $fwDb->query($sqlT);

$sql_email = "SELECT * FROM insurance_manager_email";
$fwViewData['emailData'] = $fwDb->query($sql_email);

$fwViewData['title'] = $MODULE_PLURAL;


$sqlB = "select * from contacts order by cs_first_name";
$fwViewData['brokerdata'] = $fwDb->query($sqlB);





