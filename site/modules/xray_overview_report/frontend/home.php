<?php
$pagenum = $fwRequest->getparam('pagenum', '');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('business_sellers');

require_once(MODULES_DIR . 'PDFMerger.php');

use PDFMerger\PDFMerger;

$fwViewData['ran'] =  rand(100000, 999999);

//$where = ' Where business_sellers.bs_xor_hide = 0';
if (!isset($_GET['export']) || $_GET['export'] != 1) {
    $where = ' WHERE business_sellers.bs_xor_hide = 0 ';
} else {
	$where = " WHERE 1 = 1";
}


$ord = " order by business.bsn_status  ASC";
$user = $_SESSION['user']['user_name'];
$dt = date('d-m-Y');

$move = $fwRequest->getParam('move', '');
if ($move) {
	$keys_2 = array_keys($move);
	$ky_2 = $keys_2[0];
	$val_2 = $move[$ky_2];

	$detail['bs_xray_old'] = $val_2;

	$table->setWhere("bs_business_id = " . $ky_2);
	if ($table->rowExists()) {
		$this_id = $table->updateRow($detail);
	}
}

$clear = $fwRequest->getParam('clear', '');
if (!empty($clear)) {
	unset($_SESSION['status_search']);
}

$hide = $fwRequest->getParam('hide', '');
if ($hide) {
	$keys_2 = array_keys($hide);
	$ky_2 = $keys_2[0];
	$val_2 = $hide[$ky_2];

	$detail['bs_xor_hide'] = $val_2;
	$table->setWhere("bs_business_id = " . $ky_2);
	if ($table->rowExists()) {
		$this_id = $table->updateRow($detail);
	}
}

$hidden = $fwRequest->getParam('hidden', '');
if (!empty($hidden)) {
	$where = " WHERE 1 = 1";
}

//$show_complete = $fwRequest->getParam('show_complete', '');
//if(!empty($show_complete)) {
//	$where = " where business_sellers.bs_xor_hide = 0  Or business.bsn_status like '%|4|%' ";	
//}

$status_search = $fwRequest->getParam('status_search', '');
if (!empty($status_search)) {
	$where .= " and business.bsn_status like '%|" . $status_search . "|%'";
	$_SESSION['status_search'] = $status_search;
} else if (!empty($_SESSION['status_search'])) {
	$where .= " and business.bsn_status like '%|" . $_SESSION['status_search'] . "|%'";
}


$last_audit = $fwRequest->getParam('last_audit', '');
if ($last_audit) {
	$keys_2 = array_keys($last_audit);
	$ky_2 = $keys_2[0];
	$val_2 = $last_audit[$ky_2];

	$detail['bs_xry_last_audit'] = $val_2;
	$detail['bs_xry_last_audit_user'] = $_SESSION['user']['user_name'];
	$detail['bs_xry_last_audit_date'] = date('d-m-Y');

	$table->setWhere("bs_business_id = " . $ky_2);
	if ($table->rowExists()) {
		$this_id = $table->updateRow($detail);
	}
}

$add_to_deposite = $fwRequest->getParam('add_to_deposite', '');
if ($add_to_deposite) {
	$keys_4 = array_keys($add_to_deposite);
	$ky_4 = $keys_4[0];
	$val_4 = $add_to_deposite[$ky_4];

	$detail['bs_xry_add_to_deposite'] = $val_4;

	$table->setWhere("bs_business_id = " . $ky_4);
	if ($table->rowExists()) {
		$this_id = $table->updateRow($detail);
	}
}
$clear_search = $fwRequest->getParam('clear_search', '');
if (!empty($clear_search)) {
	unset($_SESSION['keyword']);
	unset($keyword);
	$fwViewData['keyword'] = '';
}

$keyword = $fwRequest->getParam('keyword', '');
if ($keyword):
	$where .= " AND  business.bsn_name LIKE '%" . $keyword . "%'";
	$_SESSION['keyword'] = $keyword;
elseif ($_SESSION['keyword']):
	$where .= " AND business.bsn_name LIKE '%" . $_SESSION['keyword'] . "%' ";
endif;



//$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
//        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status, business.bsn_address, bus_customers.bcust_id,
//		business_sellers.bs_xray_old
//	    from business_sellers 		
//	    Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
//	    Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " 
//	    And  (business.bsn_status like '%|2|%'  Or business.bsn_status like '%|5|%'  Or business.bsn_status like '%|6|%' 
//		   Or business.bsn_status like '%|3|%'  Or business.bsn_status like '%|4|%' )
//	       Group By business.bsn_id " .$ord ;


$sql = "SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, business.bsn_id, business.bsn_name,
		business.bsn_sub_status, business.bsn_status, business.bsn_address, bus_customers.bcust_id, business_sellers.bs_xor_hide, business.bsn_xor_sbc from business_sellers Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where . " AND business.bsn_status like '%|2|%' Group By business.bsn_id		
		UNION
		SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, business.bsn_id, business.bsn_name,
		business.bsn_sub_status, business.bsn_status, business.bsn_address, bus_customers.bcust_id , business_sellers.bs_xor_hide, business.bsn_xor_sbc from business_sellers Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where . " AND business.bsn_status like '%|5|%' Group By business.bsn_id
		UNION
		SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, business.bsn_id, business.bsn_name,
		business.bsn_sub_status, business.bsn_status, business.bsn_address, bus_customers.bcust_id , business_sellers.bs_xor_hide, business.bsn_xor_sbc from business_sellers Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where . " AND business.bsn_status like '%|6|%' Group By business.bsn_id
		UNION
		SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, business.bsn_id, business.bsn_name,
		business.bsn_sub_status, business.bsn_status, business.bsn_address, bus_customers.bcust_id , business_sellers.bs_xor_hide, business.bsn_xor_sbc from business_sellers Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where . " AND business.bsn_status like '%|3|%' Group By business.bsn_id
		UNION
		SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, business.bsn_id, business.bsn_name,
		business.bsn_sub_status, business.bsn_status, business.bsn_address, bus_customers.bcust_id , business_sellers.bs_xor_hide , business.bsn_xor_sbc from business_sellers Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where . " AND business.bsn_status like '%|4|%' Group By business.bsn_id";

//echo $sql;
if ($sql) {
	$userData = $fwDb->query($sql);
}

$query = 'SELECT ppd_bsn_id, ppd_hia_value, ppd_value, ppd_stage, ppd_invoice_sent FROM progress_payment_detail';
$result = $fwDb->query($query);
$paymentData = [];
foreach ($result as $row) {
	if (!isset($paymentData[$row['ppd_bsn_id']])) {
		$paymentData[$row['ppd_bsn_id']] = [];
	}
	$paymentData[$row['ppd_bsn_id']][] = $row;
}

foreach ($userData as $uk => $uv) {
	$hidetail['bs_xor_hide'] =  1;
	$total_hia_value = 0;
	$total_ppd_value = 0;
	foreach ($paymentData[$uv['bsn_id']] as $record) {
		// echo $record['ppd_hia_value'] . ' | ' . $record['ppd_value'];
		// echo "<br>";
		$ppd_hia_value = str_replace('$', '', $record['ppd_hia_value']);
		$ppd_hia_value = str_replace(',', '', $ppd_hia_value);
		// $ppd_hia_value = str_replace('.', '', $ppd_hia_value);
		$total_hia_value += (float)$ppd_hia_value;
		$ppd_value = str_replace('$', '', $record['ppd_value']);
		$ppd_value = str_replace(',', '', $ppd_value);
		// $ppd_value = str_replace('.', '', $ppd_value);
		$total_ppd_value += (float)$ppd_value;
	}
	if ($total_ppd_value >= $total_hia_value && $uv['bs_xor_hide'] != 1) {
		$table->setWhere("bs_business_id = " . $uv['bs_business_id']);
		if ($table->rowExists()) {
			$this_id = $table->updateRow($hidetail);
		}
	}
	// echo $uv['bsn_id'] . "| $total_hia_value | $total_ppd_value | ";
	// echo "<hr>";
	// db($uv['bsn_id']);
	// db($total_hia_value);
	// db($total_ppd_value);
}
// Again run the same query. Do not delete below line
$userData = $fwDb->query($sql);

$query = "SELECT sp_bsn_id, COUNT(*) AS total FROM bus_special_condition WHERE LENGTH(sp_pdf) > 0 GROUP BY sp_bsn_id";
$result = $fwDb->query($query);
$sc_1_data = [];
foreach ($result as $row) {
	$sc_1_data[$row['sp_bsn_id']] = $row;
}

$query = "SELECT va_bsn_id, COUNT(*) AS total_var FROM bus_variations WHERE LENGTH(va_signed) > 0 GROUP BY va_bsn_id";
$result = $fwDb->query($query);
$var_data = [];
foreach ($result as $row) {
	$var_data[$row['va_bsn_id']] = $row;
}
// db($sc_1_data);
// db($var_data);

$total2 = sizeof($userData);
$fwViewData['active'] =  $total2;

$fwViewData['total'] = sizeof($userData);

if (!empty($userData)) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}

	$rows = count($userData);

	$page_rows = 350;
	$last = ceil($rows / $page_rows);

	if ($pagenum <= 1) {
		$pagenum = 1;
	} elseif ($pagenum > $last) {
		$pagenum = $last;
	}
	$numstartvounter =  $page_rows * ($pagenum - 1) + 1;
	$fwViewData['numstartvounter'] = $numstartvounter;

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

	$sql2 =  $sql . " " . $max;

	if ($sql2) {

		$setdata2 = $fwDb->query($sql2);

		foreach ($setdata2 as $k => $v) {
			$link = $BASE_URL . "business.detail/bsn_id/" . $v['bsn_id'];

			$status_string = "'" . $v['bsn_status'] . "'";
			$status = '';

			if (strpos($status_string, '|1|') > 0) {
				$status .= "Convert<br>";
			}
			if (strpos($status_string, '|2|') > 0) {
				$status .= "Planning Approvals<br>";
			}
			if (strpos($status_string, '|5|') > 0) {
				$status .= "Inclusions<br>";
			}
			if (strpos($status_string, '|6|') > 0) {
				$status .= "Pre Construction<br>";
			}
			if (strpos($status_string, '|3|') > 0) {
				$status .= "Construction<br>";
			}
			if (strpos($status_string, '|4|') > 0) {
				$status .= "Complete<br>";
			}
			if (strpos($status_string, '|12|') > 0) {
				$status .= "Design Phase<br>";
			}

			// $sql_1 = "select ppd_hia_value, ppd_value from  progress_payment_detail 
			//       where ppd_bsn_id = " . $v['bsn_id'] . " and ppd_stage like '%Deposit%' ";
			// $data_1 = $fwDb->queryOne($sql_1);

			// $sql_2 = "select ppd_hia_value, ppd_value, ppd_invoice_sent from  progress_payment_detail 
			//       where ppd_bsn_id = " . $v['bsn_id'] . " and ppd_stage like '%Planning Approvals Submitted%' ";
			// $data_2 = $fwDb->queryOne($sql_2);

			// $sql_3 = "select ppd_hia_value, ppd_value, ppd_invoice_sent from  progress_payment_detail 
			//       where ppd_bsn_id = " . $v['bsn_id'] . " and ppd_stage like '%Floor Systems Complete%' ";
			// $data_3 = $fwDb->queryOne($sql_3);

			// $sql_4 = "select ppd_hia_value, ppd_value, ppd_invoice_sent from  progress_payment_detail 
			//       where ppd_bsn_id = " . $v['bsn_id'] . " and ppd_stage like '%Wall and Roof Frames Complete%' ";
			// $data_4 = $fwDb->queryOne($sql_4);

			// $sql_5 = "select ppd_hia_value, ppd_value, ppd_invoice_sent from  progress_payment_detail 
			//       where ppd_bsn_id = " . $v['bsn_id'] . " and ppd_stage like '%Close Up Complete%' ";
			// $data_5 = $fwDb->queryOne($sql_5);

			// $sql_6 = "select ppd_hia_value, ppd_value, ppd_invoice_sent from  progress_payment_detail 
			//       where ppd_bsn_id = " . $v['bsn_id'] . " and ppd_stage like '%Fixing Complete%' ";
			// $data_6 = $fwDb->queryOne($sql_6);

			// $sql_7 = "select ppd_hia_value, ppd_value, ppd_invoice_sent from  progress_payment_detail 
			//       where ppd_bsn_id = " . $v['bsn_id'] . " and ppd_stage like '%Painting Complete%' ";
			// $data_7 = $fwDb->queryOne($sql_7);

			// $sql_8 = "select ppd_hia_value, ppd_value, ppd_invoice_sent from  progress_payment_detail 
			//       where ppd_bsn_id = " . $v['bsn_id'] . " and ppd_stage like '%Project Completion%' ";
			// $data_8 = $fwDb->queryOne($sql_8);

			$setdata2[$k]['bsn_id'] = $v['bsn_id'];
			$setdata2[$k]['bs_customers_id'] = $v['bs_customers_id'];
			$setdata2[$k]['bcust_id'] = $v['bcust_id'];
			$setdata2[$k]['bsn_address'] = $v['bsn_address'];
			$setdata2[$k]['link'] = $link;
			$setdata2[$k]['status'] = $status;

			$data_1 = $data_2 = $data_3 = $data_4 = $data_5 = $data_6 = $data_7 = $data_8 = [];
			// $total_hia_value = 0;
			// $total_ppd_value = 0;
			foreach ($paymentData[$v['bsn_id']] as $record) {
				// $ppd_hia_value = str_replace('$', '', $record['ppd_hia_value']);
				// $ppd_hia_value = str_replace(',', '', $ppd_hia_value);
				// $total_hia_value += $ppd_hia_value;
				// $ppd_value = str_replace('$', '', $record['ppd_value']);
				// $ppd_value = str_replace(',', '', $ppd_value);			
				// $total_ppd_value += $ppd_value;
				if (strpos($record['ppd_stage'], 'Deposit') !== false) {
					$data_1 = $record;
					continue;
				}
				if (strpos($record['ppd_stage'], 'Planning Approvals Submitted') !== false) {
					$data_2 = $record;
					continue;
				}
				if (strpos($record['ppd_stage'], 'Floor Systems Complete') !== false) {
					$data_3 = $record;
					continue;
				}
				if (strpos($record['ppd_stage'], 'Wall and Roof Frames Complete') !== false) {
					$data_4 = $record;
					continue;
				}
				if (strpos($record['ppd_stage'], 'Close Up Complete') !== false) {
					$data_5 = $record;
					continue;
				}
				if (strpos($record['ppd_stage'], 'Fixing Complete') !== false) {
					$data_6 = $record;
					continue;
				}
				if (strpos($record['ppd_stage'], 'Painting Complete') !== false) {
					$data_7 = $record;
					continue;
				}
				if (strpos($record['ppd_stage'], 'Project Completion') !== false) {
					$data_8 = $record;
					continue;
				}
			}

			$setdata2[$k]['ppd_hia_value_1'] = $data_1['ppd_hia_value'];
			$setdata2[$k]['ppd_value_1'] = $data_1['ppd_value'];

			$setdata2[$k]['ppd_hia_value_2'] = $data_2['ppd_hia_value'];
			$setdata2[$k]['ppd_value_2'] = $data_2['ppd_value'];

			if (!empty($data_2['ppd_invoice_sent'])) {
				$setdata2[$k]['ppd_invoice_sent'] = $data_2['ppd_invoice_sent'];
			}

			if (!empty($data_3['ppd_invoice_sent'])) {
				$setdata2[$k]['ppd_invoice_sent_3'] = $data_3['ppd_invoice_sent'];
			}

			if (!empty($data_4['ppd_invoice_sent'])) {
				$setdata2[$k]['ppd_invoice_sent_4'] = $data_4['ppd_invoice_sent'];
			}

			if (!empty($data_5['ppd_invoice_sent'])) {
				$setdata2[$k]['ppd_invoice_sent_5'] = $data_5['ppd_invoice_sent'];
			}

			if (!empty($data_6['ppd_invoice_sent'])) {
				$setdata2[$k]['ppd_invoice_sent_6'] = $data_6['ppd_invoice_sent'];
			}

			if (!empty($data_7['ppd_invoice_sent'])) {
				$setdata2[$k]['ppd_invoice_sent_7'] = $data_7['ppd_invoice_sent'];
			}

			if (!empty($data_8['ppd_invoice_sent'])) {
				$setdata2[$k]['ppd_invoice_sent_8'] = $data_8['ppd_invoice_sent'];
			}

			$setdata2[$k]['ppd_hia_value_3'] = $data_3['ppd_hia_value'];
			$setdata2[$k]['ppd_value_3'] = $data_3['ppd_value'];

			$setdata2[$k]['ppd_hia_value_4'] = $data_4['ppd_hia_value'];
			$setdata2[$k]['ppd_value_4'] = $data_4['ppd_value'];

			$setdata2[$k]['ppd_hia_value_5'] = $data_5['ppd_hia_value'];
			$setdata2[$k]['ppd_value_5'] = $data_5['ppd_value'];

			$setdata2[$k]['ppd_hia_value_6'] = $data_6['ppd_hia_value'];
			$setdata2[$k]['ppd_value_6'] = $data_6['ppd_value'];

			$setdata2[$k]['ppd_hia_value_7'] = $data_7['ppd_hia_value'];
			$setdata2[$k]['ppd_value_7'] = $data_7['ppd_value'];

			$setdata2[$k]['ppd_hia_value_8'] = $data_8['ppd_hia_value'];
			$setdata2[$k]['ppd_value_8'] = $data_8['ppd_value'];

			// $sqlsc_1 = "select count(*) as total from bus_special_condition where sp_bsn_id = " . $v['bsn_id'] . " And length(sp_pdf) > 0 ";
			// $sc_1_data = $fwDb->queryOne($sqlsc_1);
			$setdata2[$k]['total_sc'] = $sc_1_data[$v['bsn_id']]['total'] ?? 0;

			// $sqlvar = "SELECT COUNT(*) AS total_var FROM bus_variations WHERE va_bsn_id = " . $v['bsn_id'] . " AND LENGTH(va_signed) > 0";
			// $var_data = $fwDb->queryOne($sqlvar);
			$setdata2[$k]['total_var'] = $var_data[$v['bsn_id']]['total_var'] ?? 0;
		}

		$fwViewData['list'] =  $setdata2;
	}
}

// Special Condition Merge Starts

$special_cond = $fwRequest->getParam('special_cond', '');

if (!empty($special_cond)) {
	$bsn_id = $fwRequest->getParam('bsn_id', '');

	$sqlsc = "select sp_pdf from bus_special_condition where sp_bsn_id = " . $bsn_id;
	$data = $fwDb->query($sqlsc);


	$pdf = new PDFMerger;
	$fn = "special_condition.pdf";

	foreach ($data as $k => $v) {
		if (!empty($v['sp_pdf'])) {
			if (!is_dir(BASE_DIR . FILE_PATH . 'files/special_conditions_doc/')) {
				mkdir(BASE_DIR . FILE_PATH . 'files/special_conditions_doc/', 0777, TRUE);
			}

			$destination = BASE_DIR . FILE_PATH . "files/special_conditions_doc/" . $v['sp_pdf'];
			$folder_path = "files/special_conditions_doc/";
			$source = get_file_raw_data($folder_path, $v['sp_pdf']);
			copy($source, $destination);

			$docfile = BASE_DIR . 'files/special_conditions_doc/' . $v['sp_pdf'];
			$newfile = "new_" . $v['sp_pdf'];

			shell_exec('gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=' . $newfile . ' ' . $docfile);

			rename($newfile, BASE_DIR . 'files/merged/' . $newfile);
			//sleep(1);

			$newfile2 = BASE_DIR . 'files/merged/' . $newfile;
			//$pdf->addPDF($docfile);
			$pdf->addPDF($newfile2);
		}
	}


	$pdf->merge('file', BASE_DIR . 'files/merged/' . $fn);

	$filepath_url = 'files/merged/' . $fn;
	echo "<script>window.open('$filepath_url', '_blank','toolbar=yes, width=800, height=550'); window.focus();</script>";
}


// Special Condition Merge Ends



// Variations Merge Starts


$variations = $fwRequest->getParam('variations', '');

if (!empty($variations)) {
	$bsn_id = $fwRequest->getParam('bsn_id', '');

	$sqlsc = "select va_signed from  bus_variations  where va_bsn_id = " . $bsn_id;
	$data = $fwDb->query($sqlsc);


	$pdf = new PDFMerger;
	$fn = "variations.pdf";

	foreach ($data as $k => $v) {
		if (!empty($v['va_signed'])) {
			if (!is_dir(BASE_DIR . FILE_PATH . 'files/variations_doc/')) {
				mkdir(BASE_DIR . FILE_PATH . 'files/variations_doc/', 0777, TRUE);
			}

			$destination = BASE_DIR . FILE_PATH . "files/variations_doc/" . $v['va_signed'];
			$folder_path = "files/variations_doc/";
			$source = get_file_raw_data($folder_path, $v['va_signed']);
			copy($source, $destination);

			$docfile = BASE_DIR . 'files/variations_doc/' . $v['va_signed'];
			$newfile = "new_" . $v['va_signed'];

			shell_exec('gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=' . $newfile . ' ' . $docfile);

			rename($newfile, BASE_DIR . 'files/merged/' . $newfile);
			//sleep(1);

			$newfile2 = BASE_DIR . 'files/merged/' . $newfile;
			//$pdf->addPDF($docfile);
			$pdf->addPDF($newfile2);
		}
	}


	$pdf->merge('file', BASE_DIR . 'files/merged/' . $fn);

	$filepath_url = 'files/merged/' . $fn;
	echo "<script>window.open('$filepath_url', '_blank','toolbar=yes, width=800, height=550'); window.focus();</script>";
}

// Variations Merge Ends

$export = $fwRequest->getParam('export', 0);

if ($export > 0) {
	require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";
	$objPHPExcel = new PHPExcel();

	$objPHPExcel->getProperties()->setCreator("Deckquotes")
		->setLastModifiedBy("Nick C")
		->setTitle("Office 2007 XLSX Test Document")
		->setSubject("Office 2007 XLSX Test Document")
		->setDescription("Xray overview report exported to Office 2007 XLSX.")
		->setKeywords("office 2007 openxml php")
		->setCategory("Xray overview report file");

	$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('J')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('L')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('M')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('N')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('O')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('P')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('Q')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('R')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('S')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('T')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('U')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('V')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('W')->setAutoSize(true);

	// Add some data
	$objPHPExcel->setActiveSheetIndex(0)
		->setCellValue('A1', 'SrNo')
		->setCellValue('B1', 'Project Address')
		->setCellValue('C1', 'Status')
		->setCellValue('D1', 'Special Conditions')
		->setCellValue('E1', 'Special Bank conditions')
		->setCellValue('F1', 'Total Variation')
		->setCellValue('G1', 'Hide')
		->setCellValue('H1', 'Deposit - Invoiced')
		->setCellValue('I1', 'Deposit - Paid')
		->setCellValue('J1', 'Planning Approvals Submitted- Invoiced')
		->setCellValue('K1', 'Planning Approvals Submitted - Paid')
		->setCellValue('L1', 'Floor Systems Complete - Invoiced')
		->setCellValue('M1', 'Floor Systems Complete - Paid')
		->setCellValue('N1', 'Wall and Roof Frames Complete - Invoiced')
		->setCellValue('O1', 'Wall and Roof Frames Complete - Paid')
		->setCellValue('P1', 'Close Up Complete - Invoiced')
		->setCellValue('Q1', 'Close Up Complete - Paid')
		->setCellValue('R1', 'Fixing Complete - Invoiced')
		->setCellValue('S1', 'Fixing Complete - Paid')
		->setCellValue('T1', 'Painting Complete - Invoice')
		->setCellValue('U1', 'Painting Complete - Paid')
		->setCellValue('V1', 'Project Completion - Invoice')
		->setCellValue('W1', 'Project Completion - Paid');

	$from = "A1"; // or any value
	$to = "W1"; // or any value
	$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold(true);

	foreach($setdata2 as $k => $v) {
		$link = $BASE_URL . "business.detail/bsn_id/" . $v['bsn_id'];

		$status_string = "'" . $v['bsn_status'] . "'";
		$status = '';

		if (strpos($status_string, '|1|') > 0) {
			$status .= "Convert, ";
		}
		if (strpos($status_string, '|2|') > 0) {
			$status .= "Planning Approvals, ";
		}
		if (strpos($status_string, '|5|') > 0) {
			$status .= "Inclusions, ";
		}
		if (strpos($status_string, '|6|') > 0) {
			$status .= "Pre Construction, ";
		}
		if (strpos($status_string, '|3|') > 0) {
			$status .= "Construction, ";
		}
		if (strpos($status_string, '|4|') > 0) {
			$status .= "Complete, ";
		}
		if (strpos($status_string, '|12|') > 0) {
			$status .= "Design Phase, ";
		}

		$setdata2[$k]['bsn_id'] = $v['bsn_id'];
		$setdata2[$k]['bs_customers_id'] = $v['bs_customers_id'];
		$setdata2[$k]['bcust_id'] = $v['bcust_id'];
		$setdata2[$k]['bsn_address'] = $v['bsn_address'];
		$setdata2[$k]['link'] = $link;
		$setdata2[$k]['status'] = $status;

		$data_1 = $data_2 = $data_3 = $data_4 = $data_5 = $data_6 = $data_7 = $data_8 = [];
		foreach ($paymentData[$v['bsn_id']] as $record) {
			if (strpos($record['ppd_stage'], 'Deposit') !== false) {
				$data_1 = $record;
				continue;
			}
			if (strpos($record['ppd_stage'], 'Planning Approvals Submitted') !== false) {
				$data_2 = $record;
				continue;
			}
			if (strpos($record['ppd_stage'], 'Floor Systems Complete') !== false) {
				$data_3 = $record;
				continue;
			}
			if (strpos($record['ppd_stage'], 'Wall and Roof Frames Complete') !== false) {
				$data_4 = $record;
				continue;
			}
			if (strpos($record['ppd_stage'], 'Close Up Complete') !== false) {
				$data_5 = $record;
				continue;
			}
			if (strpos($record['ppd_stage'], 'Fixing Complete') !== false) {
				$data_6 = $record;
				continue;
			}
			if (strpos($record['ppd_stage'], 'Painting Complete') !== false) {
				$data_7 = $record;
				continue;
			}
			if (strpos($record['ppd_stage'], 'Project Completion') !== false) {
				$data_8 = $record;
				continue;
			}
		}

		$setdata2[$k]['ppd_hia_value_1'] = $data_1['ppd_hia_value'];
		$setdata2[$k]['ppd_value_1'] = $data_1['ppd_value'];

		$setdata2[$k]['ppd_hia_value_2'] = $data_2['ppd_hia_value'];
		$setdata2[$k]['ppd_value_2'] = $data_2['ppd_value'];

		if (!empty($data_2['ppd_invoice_sent'])) {
			$setdata2[$k]['ppd_invoice_sent'] = $data_2['ppd_invoice_sent'];
		}

		if (!empty($data_3['ppd_invoice_sent'])) {
			$setdata2[$k]['ppd_invoice_sent_3'] = $data_3['ppd_invoice_sent'];
		}

		if (!empty($data_4['ppd_invoice_sent'])) {
			$setdata2[$k]['ppd_invoice_sent_4'] = $data_4['ppd_invoice_sent'];
		}

		if (!empty($data_5['ppd_invoice_sent'])) {
			$setdata2[$k]['ppd_invoice_sent_5'] = $data_5['ppd_invoice_sent'];
		}

		if (!empty($data_6['ppd_invoice_sent'])) {
			$setdata2[$k]['ppd_invoice_sent_6'] = $data_6['ppd_invoice_sent'];
		}

		if (!empty($data_7['ppd_invoice_sent'])) {
			$setdata2[$k]['ppd_invoice_sent_7'] = $data_7['ppd_invoice_sent'];
		}

		if (!empty($data_8['ppd_invoice_sent'])) {
			$setdata2[$k]['ppd_invoice_sent_8'] = $data_8['ppd_invoice_sent'];
		}

		$setdata2[$k]['ppd_hia_value_3'] = $data_3['ppd_hia_value'];
		$setdata2[$k]['ppd_value_3'] = $data_3['ppd_value'];

		$setdata2[$k]['ppd_hia_value_4'] = $data_4['ppd_hia_value'];
		$setdata2[$k]['ppd_value_4'] = $data_4['ppd_value'];

		$setdata2[$k]['ppd_hia_value_5'] = $data_5['ppd_hia_value'];
		$setdata2[$k]['ppd_value_5'] = $data_5['ppd_value'];

		$setdata2[$k]['ppd_hia_value_6'] = $data_6['ppd_hia_value'];
		$setdata2[$k]['ppd_value_6'] = $data_6['ppd_value'];

		$setdata2[$k]['ppd_hia_value_7'] = $data_7['ppd_hia_value'];
		$setdata2[$k]['ppd_value_7'] = $data_7['ppd_value'];

		$setdata2[$k]['ppd_hia_value_8'] = $data_8['ppd_hia_value'];
		$setdata2[$k]['ppd_value_8'] = $data_8['ppd_value'];

		$setdata2[$k]['total_sc'] = $sc_1_data[$v['bsn_id']]['total'] ?? 0;

		$setdata2[$k]['total_var'] = $var_data[$v['bsn_id']]['total_var'] ?? 0;
	}

	$row = 2;
	$sr = 1;
	foreach ($setdata2 as $k => $v) {
		$objPHPExcel->getActiveSheet()
			->setCellValue('A' . $row, $sr)
			->setCellValue('B' . $row, $v['bsn_name'])
			->setCellValue('C' . $row, $v['status'])
			->setCellValue('D' . $row, $v['total_sc'])
			->setCellValue('E' . $row, $v['bsn_xor_sbc'])
			->setCellValue('F' . $row, $v['total_var'])
			->setCellValue('G' . $row, $v['bs_xor_hide'])
			->setCellValue('H' . $row, $v['ppd_hia_value_1'])
			->setCellValue('I' . $row, $v['ppd_value_1'])
			->setCellValue('J' . $row, $v['ppd_hia_value_2'])
			->setCellValue('K' . $row, $v['ppd_value_2'])
			->setCellValue('L' . $row, $v['ppd_hia_value_3'])
			->setCellValue('M' . $row, $v['ppd_value_3'])
			->setCellValue('N' . $row, $v['ppd_hia_value_4'])
			->setCellValue('O' . $row, $v['ppd_value_4'])
			->setCellValue('P' . $row, $v['ppd_hia_value_5'])
			->setCellValue('Q' . $row, $v['ppd_value_5'])
			->setCellValue('R' . $row, $v['ppd_hia_value_6'])
			->setCellValue('S' . $row, $v['ppd_value_6'])
			->setCellValue('T' . $row, $v['ppd_hia_value_7'])
			->setCellValue('U' . $row, $v['ppd_value_7'])
			->setCellValue('V' . $row, $v['ppd_hia_value_8'])
			->setCellValue('W' . $row, $v['ppd_value_8'])
		;
		$row = $row + 1;
		$sr = $sr + 1;
	}

	$objPHPExcel->getActiveSheet()->setTitle('Xray Overview Report');
	$objPHPExcel->setActiveSheetIndex(0);

	// Redirect output to a client’s web browser (Excel5)
	header('Content-Type: application/vnd.ms-excel');
	header('Content-Disposition: attachment;filename="xray_overview_report.xls"');
	header('Cache-Control: max-age=0');
	// If you're serving to IE 9, then the following may be needed
	header('Cache-Control: max-age=1');

	// If you're serving to IE over SSL, then the following may be needed
	header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
	header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
	header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
	header('Pragma: public'); // HTTP/1.0

	$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
	$objWriter->save('php://output');
	exit;
}

$sqlsbc = "Select * from xray_overview_sbc";
$fwViewData['sbcdata'] = $fwDb->query($sqlsbc);


$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "XRay Overview Report";
