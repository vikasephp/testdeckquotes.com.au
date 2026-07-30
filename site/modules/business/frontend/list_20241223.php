<?php
$pagenum = $fwRequest->getparam('pagenum', '');
$tablePages = new Fw_Db_Table($TABLE);
$tablestatus = new Fw_Db_Table('busness_status');
$tableintrest = new Fw_Db_Table('business_interest');
$tablestate = new Fw_Db_Table('states');

$fwViewData['list'] = 0;
$submit = $fwRequest->getParam('search', '');
$export = $fwRequest->getParam('export', 0);
$print = $fwRequest->getParam('print', '');

$logged_username = $_SESSION['user']['user_username'];

if (($export || $print) && empty($_SESSION['last_sql'])) {
	Location(BASE_URL . $XFA['list']);
}


if (!empty($print)) {
	/////////////////////////////////////////////
	if ($_SESSION['last_sql']) {
		$exportdata = $fwDb->query($_SESSION['last_sql']);

		foreach ($exportdata as $k => $v) {
			$bid = $v['bsn_id'];

			///////////////////// Task List ///////////////////////////////
			$taskcount_query = "SELECT  count(bt_id) as t_task FROM business_tasks WHERE bt_bsn_id = " . $bid;
			$tdata = $fwDb->queryOne($taskcount_query);
			$totaltasks = $tdata['t_task'];

			$comptaskcount_query = "SELECT  count(bt_id) as compt_task FROM business_tasks WHERE bt_bsn_id = " . $bid . " AND bt_complete = 1";
			$comptdata = $fwDb->queryOne($comptaskcount_query);
			$comptotaltasks = $comptdata['compt_task'];
			$v['task_cnt'] = $comptotaltasks . "/" . $totaltasks;
			///////////////////// Task List ///////////////////////////////


			///////////////////// Task List ///////////////////////////////
			$doccount_query = "SELECT  count(doc_id) as doc_task FROM document_check_list WHERE doc_bsn_id = " . $bid;
			$docdata = $fwDb->queryOne($doccount_query);
			$totaldocs = $docdata['doc_task'];

			$compdoccount_query = "SELECT  count(doc_id) as compdoc_task FROM document_check_list WHERE doc_bsn_id = " . $bid . " AND doc_file_name != ' '";
			$compdocdata = $fwDb->queryOne($compdoccount_query);
			$comptotaldocs = $compdocdata['compdoc_task'];
			$v['doc_cnt'] = $comptotaldocs . "/" . $totaldocs;
			///////////////////// Task List ///////////////////////////////

			$bsnquery = "SELECT business_sellers.*, bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_lname FROM business_sellers LEFT JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id WHERE business_sellers.bs_business_id = " . $bid;
			$bcs_data = $fwDb->query($bsnquery);
			$sellers = "";
			foreach ($bcs_data as $k1 => $v1) {

				if ($v1 == end($bcs_data)) {
					$sellers .= $v1['bcust_fname'] . " " . $v1['bcust_lname'];
				} else {
					$sellers .= $v1['bcust_fname'] . " " . $v1['bcust_lname'] . ", ";
				}
			}
			$v['sellers'] = $sellers;

			$v['statusdays'] = daysDifference(date('Y-m-d'), $v['bsn_status_date']);
			$v['systemdays'] = daysDifference(date('Y-m-d'), $v['bsn_status_sys_date']);
			$data_wsexport[] = $v;
		}
	}

	if ($print == "basic") {
		$filename = "business_for_sale_search_" . date('m_d_Y') . ".pdf";
		$reportname = "Business For Sale Search";
		$fwViewData['data_wsexport'] = $data_wsexport;

		foreach ($data_wsexport as $k => $v) {
			$listdata[] = '<table class="first" cellpadding="4" cellspacing="2" style="font-size:30px;">
			<tr><td><strong>Business Name:</strong></td><td width="200">' . $v[bsn_name] . '</td>
			<td width="100"><strong>Status:</strong></td><td width="200">' . $v[st_name] . '</td></tr>
			<tr><td><strong>Owner(s):</strong></td><td >' . $v[sellers] . '</td>	<td ><strong>Website:</strong></td><td>' . $v[bsn_cd_website] . '</td></tr>
			<tr><td ><strong>Address:</strong></td><td colspan="3">' . $v[bsn_address] . '</td></tr>
			<tr><td ><strong>Description:</strong></td><td >' . $v[bsn_description] . '</td><td></td><td></td></tr>
			<tr><td width="100%" colspan="4">&nbsp;</td></tr></table>';
		}
	} else {
		//require_once(BASE_DIR."dompdf/dompdf_config.inc.php");

		$filename = "Businesses_with_outstanding_tasks_or_documents_grouped_by_status_" . date('m_d_Y') . ".pdf";
		$reportname = "Businesses with outstanding tasks or documents grouped by Status";
		$fwViewData['data_wsexport'] = $data_wsexport;


		foreach ($data_wsexport as $key => $val) {
			$st_idsd['id'] = $val['st_id'];
			$st_idsd['name'] = $val['st_name'];
			$ids[] = $st_idsd;
		}




		$st_ids = multi_unique($ids);
		foreach ($st_ids as $k => $v) {
			foreach ($data_wsexport as $key1 => $val1) {
				if ($v == $val1['st_id']) {

					$status_main[] = $val1;
					unset($stat_data);
				}
			}
		}


		function inner_data($id, $name, $data_wsexport)
		{
			$inner_data .= '<tr><th width="362">Business Name</th><th width="60">Task Count</th><th width="80">Doc Check List Count</th><th width="80">Days at Status</th><th width="80">Days in System</th></tr>';
			$list_count = 0;
			foreach ($data_wsexport as $key1 => $val1) {
				if ($id == $val1['st_id']) {
					if ($val1['task_cnt'] !== '0/0') {
						$task_cnt = $val1['task_cnt'];
					}
					if ($val1['doc_cnt'] !== '0/0') {
						$doc_cnt = $val1['doc_cnt'];
					}
					$inner_data .= '<tr><td>' . $val1['bsn_name'] . '</td><td >' . $task_cnt . '</td><td >' . $doc_cnt . '</td><td >' . $val1['statusdays'] . '</td><td >' . $val1['systemdays'] . '</td></tr>';
					$list_count++;
					unset($task_cnt);
					unset($doc_cnt);
				}
			}
			$indata['data'] = $inner_data;
			$indata['listcount'] = $list_count;

			return $indata;
		}

		foreach ($st_ids as $k => $v) {
			if ($v['name']) {
				$data = inner_data($v['id'], $v['name'], $data_wsexport);
				$listdata[] = '<table class="first" cellpadding="0" cellspacing="0" border="0">
				<tr><td colspan="5" class="second" width="662" style="font-size:30px;">&nbsp;</td></tr>
				<tr>
				<td  height="30" class="second" align="right">Status: &nbsp;</td>
				<td class="second" colspan="3">' . $v['name'] . '</td></tr></table>
				<table class="second" cellpadding="4" cellspacing="0">
				' . $data['data'] . '<tr><td colspan="1"><b>Count at ' . $v['name'] . '</b></td><td colspan="4"><b>' . $data['listcount'] . '</b></td></tr></table>';
			}
		}
	}

	require_once(BASE_DIR . 'tcpdf/config/lang/eng.php');
	require_once(BASE_DIR . 'tcpdf/tcpdf.php');

	// Extend the TCPDF class to create custom Header && Footer
	class MYPDF extends TCPDF
	{

		// Page footer
		public function Footer()
		{
			// Position at 15 mm from bottom
			$this->SetY(-15);
			// Set font
			$this->SetFont('helvetica', 'I', 8);
			// Page number
			$this->Cell(0, 10, 'BES', 'T', 0, 'L');
			if ($this->getRTL()) {
				$this->SetX($this->original_rMargin);
				$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'L');
			} else {
				$this->SetX($this->original_lMargin);
				$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'R');
			}

			$this->Cell(0, 10, 'Page ' . $this->getAliasNumPage() . '/' . $this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
		}
	}

	// create new PDF document
	$pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
	// set document information
	$pdf->SetCreator(PDF_CREATOR);
	$pdf->SetAuthor('Business For Sale Search');
	$pdf->SetTitle('Business For Sale Search <br> ' . $detail['bsn_name'] . ' Print Date<br>' . date("d/m/Y"));
	$pdf->SetSubject('Business For Sale Search');
	$pdf->SetKeywords('BES, PDF');

	// set default header data
	$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, $reportname, "Print Date: " . date("d/m/Y"));

	// set header && footer fonts
	$pdf->setHeaderFont(array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
	$pdf->setFooterFont(array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

	// set default monospaced font
	$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

	//set margins
	$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
	$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
	$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

	//set auto page breaks
	$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

	//set image scale factor
	$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

	//set some language-dependent strings
	$pdf->setLanguageArray($l);

	// ---------------------------------------------------------

	// set font
	$pdf->SetFont('helvetica', '13', 1);

	// add a page
	$pdf->AddPage();

	//set some language-dependent strings
	$pdf->setLanguageArray($l);

	// -------------------------------------------------------------------

	if ($listdata) {
		foreach ($listdata as $k => $v) {
			$combtr .= $v;
			if ($counter == 1) {
				$trcmb[] = stripslashes($combtr);
				$counter = 0;
				unset($combtr);
			}
			$counter++;
		}
		$trcmb[] = stripslashes($combtr);
	}

	$header = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>
    table.first {
        color: #003300;
        font-family: helvetica;
        font-size: 10pt;
        border: 0px solid #fff;
        background-color: #FFF;
    }
    td {
        border: 0px solid #fff;
        background-color: #ffffee;
    }
	 th {
        border: 0px solid #fff;
        background-color: #ffffee;
    }
  
</style>

EOF;

	if ($trcmb) {


		foreach ($trcmb as $ke => $vl) {
			$listdata_tr[] = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>
     b {
        color: #333;
        font-family: helvetica;
		font-weight:bold;
        font-size: 10pt;
		padding:0;
    }
	span {
        color: #333;
        font-family: helvetica;
		font-weight:bold;
        font-size: 10pt;
		padding:0;
    }
    table.first {
        color: #003300;
        font-family: helvetica;
        font-size: 9pt;
        border: 0px solid #E9E9E9;
        background-color: #E9E9E9;
    }
	table.second {
        color: #003300;
        font-family: helvetica;
        font-size: 9pt;
        border: 0px solid #FFFFFF;
        background-color: #FFFFFF;
    }
    td {
        border: 0px solid #fff;
        background-color: #ffffff;
    }
	
	td.second {
        border: 0px solid #E9E9E9;
        background-color: #E9E9E9;
		font-weight:bold;
		font-size:12pt;
    }
	 th {
        border: 0px solid #E9E9E9;
        background-color: #E9E9E9;
		font-weight:bold;
		 font-size: 10pt;
    }
   
</style>

	$vl
			
EOF;
		}
	}

	// output the HTML content
	//$pdf->writeHTML($header, true, false, true, false, '');

	if ($listdata_tr) {
		foreach ($listdata_tr as $key => $vbody) {
			$pdf->writeHTML($vbody, true, false, true, false, '');
		}
	} else {
		$errorbody = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>

       table.first {
        color: #003300;
        font-family: helvetica;
        font-size: 10pt;
        border: 0px solid #fff;
        background-color: #FFF;
    }
    td {
        border: 0px solid #fff;
        background-color: #ffffee;
    }
	 th {
        border: 0px solid #fff;
        background-color: #ffffee;
    }
    td.second {
        border: 2px dashed green;
    }
    div.test {
        color: #CC0000;
        background-color: yellow;
        font-family: helvetica;
        font-size: 13pt;
        border: 0px solid #fff;
        text-align: center;
	
    }
</style>
<div class="test">No record found.!!!</div>
				
EOF;
		$pdf->writeHTML($errorbody, true, false, true, false, '');
	}

	$pdf->Output($filename, 'I');
	exit;
}


if ($export > 0) {
	$csv_output = "";
	if ($_SESSION['last_sql']) {
		$exportdata = $fwDb->query($_SESSION['last_sql']);
		foreach ($exportdata as $k => $v) {
			$bid = $v['bsn_id'];

			///////////////////// Task List ///////////////////////////////
			$taskcount_query = "SELECT  count(bt_id) as t_task FROM business_tasks WHERE bt_bsn_id = " . $bid;
			$tdata = $fwDb->queryOne($taskcount_query);
			$totaltasks = $tdata['t_task'];

			$comptaskcount_query = "SELECT  count(bt_id) as compt_task FROM business_tasks WHERE bt_bsn_id = " . $bid . " AND bt_complete = 1";
			$comptdata = $fwDb->queryOne($comptaskcount_query);
			$comptotaltasks = $comptdata['compt_task'];
			$v['task_cnt'] = $comptotaltasks . "/" . $totaltasks;
			///////////////////// Task List ///////////////////////////////


			///////////////////// Task List ///////////////////////////////
			$doccount_query = "SELECT  count(doc_id) as doc_task FROM document_check_list WHERE doc_bsn_id = " . $bid;
			$docdata = $fwDb->queryOne($doccount_query);
			$totaldocs = $docdata['doc_task'];

			$compdoccount_query = "SELECT  count(doc_id) as compdoc_task FROM document_check_list WHERE doc_bsn_id = " . $bid . " AND doc_file_name != ' '";
			$compdocdata = $fwDb->queryOne($compdoccount_query);
			$comptotaldocs = $compdocdata['compdoc_task'];
			$v['doc_cnt'] = $comptotaldocs . "/" . $totaldocs;
			///////////////////// Task List ///////////////////////////////

			$bsnquery = "SELECT business_sellers.*, bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_lname FROM business_sellers LEFT JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id WHERE business_sellers.bs_business_id = " . $bid;
			$bcs_data = $fwDb->query($bsnquery);
			$sellerscount = array();
			foreach ($bcs_data as $k1 => $v1) {
				$sellerscount[] = $v1['bcust_fname'] . " " . $v1['bcust_lname'];
			}
			$sellers = implode(",", $sellerscount);
			$v['sellers'] = $sellers;

			$v['statusdays'] = daysDifference(date('Y-m-d'), $v['bsn_status_date']);
			$v['systemdays'] = daysDifference(date('Y-m-d'), $v['bsn_status_sys_date']);
			$data_wsexport[] = $v;
		}

		$fields = array("bsn_name", "bsn_description", "bsn_suburb", "bsn_cd_ask_price_from", "bsn_cd_ask_price_to", "st_name", "task_cnt", "doc_cnt", "sellers", "systemdays", "statusdays");
		$csv_output .= strtoupper(implode("\t", $fields));
		$csv_output .= "\n";
		foreach ($data_wsexport as $k => $v) {
			foreach ($v as $k2 => $v2) {
				if (in_array($k2, $fields)) {
					$csv_output .= trim($v2) . "\t";
				}
			}
			$csv_output .= "\n";
		}
		$filename = "export" . "_" . date("YmdHi", time()) . ".xls";
		$contents = "testdata1 \t testdata2 \t testdata3 \t \n";
		header('Content-type: application/ms-excel');
		header('Content-Disposition: attachment; filename=' . $filename);
		echo $csv_output;
		exit;
	}
	//Location(BASE_URL . $XFA['list']);
}

if (empty($pagenum)) {
	unset($_SESSION['last_sql']);
}



if (!empty($submit)) {
	$detail = $fwRequest->getParam($TABLE, array());

	$fwViewData['ord_id'] = $detail['orderBy'];

	switch ($fwViewData['ord_id']) {
		case 1:
			$order = "ORDER BY business.bsn_name ASC";
			break;

		case 2:
			$order = "ORDER BY business.bsn_interest ASC, business.bsn_name ASC";
			break;

		case 3:
			$order = "ORDER BY business.bsn_suburb ASC, business.bsn_name ASC";
			break;

		case 4:
			$order = "ORDER BY business.bsn_status_date DESC, business.bsn_name ASC";
			break;

		case 5:
			$order = "ORDER BY business.bsn_name ASC";
			break;
		default:
			$order = " ORDER BY business.bsn_status_date DESC ";
	}

	if ($detail['bsn_status']) {
		$status_ids = implode(", ", $detail['bsn_status']);
		//$st_que = "business.bsn_status IN (".$status_ids.")";
		$fwViewData['bsn_status'] = $detail['bsn_status'];

		$sd = "business.bsn_status Like '|0|%'";

		foreach ($detail['bsn_status'] as $bs) {
			$sd .= " OR business.bsn_status Like  '|" . $bs . "|%'";
		}
		$st_que = $sd;
	}

	if ($detail['bsn_types']) {
		$types_ids = implode(", ", $detail['bsn_types']);
		$pt_que = "business.bsn_type IN (" . $types_ids . ")";
		$fwViewData['bsn_types'] = $detail['bsn_types'];
	}

	if ($detail['ind_codes']) {
		$intr_ids = implode(", ", $detail['ind_codes']);
		$intr_que = "business.bsn_interest IN (" . $intr_ids . ")  ";
	}
	if ($detail['bsn_states']) {
		foreach ($detail['bsn_states'] as $ke => $ve) {
			$state_ids .= "business.bsn_state LIKE '" . $ve . "%' OR ";
		}
		$status_que = "(" . substr($state_ids, 0, -3) . ") OR  ";
	}
	$string = "";


	//$string2 ="";
	//if($detail['seller_name']){$string.= "bus_customers.bcust_fname LIKE '%".trim($detail['seller_name'])."%' OR bus_customers.bcust_lname LIKE '%".trim($detail['seller_name'])."%'";}

	if ($detail['seller_name']) {
		$seller_name = addslashes($detail['seller_name']);
		$string .= "bus_customers.bcust_fname LIKE '" . trim($seller_name) . "%' AND ";
	}
	if ($detail['bsn_name']) {
		$bsn_name = addslashes($detail['bsn_name']);
		$string .= "business.bsn_name LIKE '%" . trim($bsn_name) . "%' AND ";
	}
	if ($detail['bsn_states']) {
		$string .= $status_que;
	}
	if ($detail['ind_codes']) {
		$string .= $intr_que . " AND ";
	}
	if ($detail['bsn_readyforsale']) {
		$string .= "business.bsn_readyforsale = " . trim($detail['bsn_readyforsale']) . " AND ";
		$fwViewData['bsn_readyforsale'] = $detail['bsn_readyforsale'];
	}
	if ($detail['bsn_status']) {
		$string .= $st_que . " AND ";
	}
	if ($detail['bsn_types']) {
		$string .= $pt_que . " AND ";
	}
	if ($detail['bsn_cd_ask_price_from'] && empty($detail['bsn_cd_ask_price_to'])) {
		$string .= "business.bsn_cd_ask_price_from >= '" . trim($detail['bsn_cd_ask_price_from']) . "' AND ";
	}

	if ($detail['bsn_sub_status3']) {
		$sdata[] = "'Open'";
	}
	if ($detail['bsn_sub_status1']) {
		$sdata[] = "'Lost'";
	}
	if ($detail['bsn_sub_status2']) {
		$sdata[] = "'Hold'";
	}

	$sin = ($sdata) ? implode(",", $sdata) : '';
	if ($sin) : $string .= " business.bsn_sub_status IN ($sin) AND ";
	endif;

	if (empty($detail['bsn_cd_ask_price_from']) && $detail['bsn_cd_ask_price_to']) {
		$string .= "business.bsn_cd_ask_price_to <= '" . trim($detail['bsn_cd_ask_price_to']) . "' AND ";
	}

	if ($detail['bsn_cd_ask_price_from'] && $detail['bsn_cd_ask_price_to']) {
		$string .= "business.bsn_cd_ask_price_from >= '" . trim($detail['bsn_cd_ask_price_from']) . "' AND business.bsn_cd_ask_price_to <= '" . trim($detail['bsn_cd_ask_price_to']) . "' AND ";
	}

	if ($detail['dpn_unique_id']) {
		$string = " document_proposal_name.dpn_unique_id = " . $detail['dpn_unique_id'] . " AND ";
	}

	$strings = substr($string, 0, -5);

	




	//db($string);	
	//db($strings);
	//exit;


	//unset($_SESSION['last_sql']);
	$fwViewData['detail'] = $detail;
	if (empty($_SESSION['last_sql'])) {
		if ($strings) {
			//	if($string2)
			//		{$string3 = " AND ".$string2;}else{$string3 = "";}


			$sql = "SELECT SQL_CALC_FOUND_ROWS null as row_name, business.*, busness_status.*, project_type.*, business_sellers.*, bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_lname FROM business 
			LEFT JOIN busness_status ON business.bsn_status = busness_status.st_id 
			LEFT JOIN project_type ON business.bsn_type = project_type.pt_id 
			LEFT JOIN business_sellers ON business.bsn_id = business_sellers.bs_business_id
			LEFT JOIN document_proposal_name on business.bsn_id = document_proposal_name.dpn_bsn_id
			LEFT JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id where " . $strings .  " " . $order;
			//db($sql);			
		} else {
			$sql = "SELECT SQL_CALC_FOUND_ROWS null as row_name,  business.*, busness_status.*, project_type.*, business_sellers.* FROM business 
			LEFT JOIN busness_status ON business.bsn_status = busness_status.st_id 
			LEFT JOIN project_type ON business.bsn_type = project_type.pt_id 
			LEFT JOIN business_sellers ON business.bsn_id = business_sellers.bs_business_id
			" . " " . $order;
		}
		// echo $sql; exit;
		if ($sql) {
			//$userData = $fwDb->query($sql);
		}
	}
	//db($userData);
	//exit;

	if (empty($userData)) {
	}
} else {
	$sql = $_SESSION['last_sql'];
}
//DB($sql);	
if ($sql) {

	$total_rows = 0;
	$total_rows_data = $fwDb->query($sql);
	if (!empty($total_rows_data)) {
		$total_rows = count($total_rows_data);
	}
	if ($total_rows == 0) {
		$fwViewData['search_msg'] = "No projects were found.";
	}
	if (!(isset($pagenum))) {
		$pagenum = 1;
	} elseif ($pagenum <= 1) {
		$pagenum = 1;
	}
	$page_rows = 20;
	$max = 'limit ' . ($pagenum - 1) * $page_rows . ',' . $page_rows;

	$sql2 =  $sql . " " . $max;

	//DB($sql2);

	if ($sql2) {
		$data = $fwDb->query($sql2);
	}
	/*	$userData = $data;
	$total_rows = $fwDb->query('SELECT FOUND_ROWS() as rows');
	$total_rows = $total_rows[0]['rows'];
	//$rows = count($userData);
	$rows = $total_rows;*/
}

if (!empty($data)) {
	$last = ceil($total_rows / $page_rows);

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


	if ($data) {

		foreach ($data as $k => $v) {
			$bid = $v['bsn_id'];

			///////////////////// Task List ///////////////////////////////
			$taskcount_query = "SELECT  count(bt_id) as t_task FROM business_tasks WHERE bt_bsn_id = " . $bid;
			$tdata = $fwDb->queryOne($taskcount_query);
			$totaltasks = $tdata['t_task'];

			$comptaskcount_query = "SELECT  count(bt_id) as compt_task FROM business_tasks WHERE bt_bsn_id = " . $bid . " AND bt_complete = 1";
			$comptdata = $fwDb->queryOne($comptaskcount_query);
			$comptotaltasks = $comptdata['compt_task'];
			$v['task_cnt'] = $comptotaltasks . "/" . $totaltasks;
			///////////////////// Task List ///////////////////////////////


			///////////////////// Task List ///////////////////////////////
			$doccount_query = "SELECT  count(doc_id) as doc_task FROM document_check_list WHERE doc_bsn_id = " . $bid;
			$docdata = $fwDb->queryOne($doccount_query);
			$totaldocs = $docdata['doc_task'];

			$compdoccount_query = "SELECT  count(doc_id) as compdoc_task FROM document_check_list WHERE doc_bsn_id = " . $bid . " AND doc_file_name != ' '";
			$compdocdata = $fwDb->queryOne($compdoccount_query);
			$comptotaldocs = $compdocdata['compdoc_task'];
			$v['doc_cnt'] = $comptotaldocs . "/" . $totaldocs;
			///////////////////// Task List ///////////////////////////////

			$bsnquery = "SELECT business_sellers.*, bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_lname FROM business_sellers LEFT JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id WHERE business_sellers.bs_business_id = " . $bid;
			$bcs_data = $fwDb->query($bsnquery);
			foreach ($bcs_data as $k1 => $v1) {
				$sellers .= $v1['bcust_fname'] . " " . $v1['bcust_lname'] . "<br>";
			}
			$v['sellers'] = $sellers;
			unset($sellers);
			$v['statusdays'] = daysDifference(date('Y-m-d'), $v['bsn_status_date']);
			$v['systemdays'] = daysDifference(date('Y-m-d'), $v['bsn_status_sys_date']);
			$data_ws[] = $v;
		}
		$fwViewData['list'] = $data_ws;
	}
}
$fwViewData['title'] = $MODULE_PLURAL;


if ($userData) {
	foreach ($userData as $key => $value) {
		$bsn_id = $value['bsn_id'];
		$pare .= "'" . $bsn_id . "', ";
	}
	$pare = substr($pare, 0, -2);
	$sql22 = "SELECT customer_business.*, bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_lname FROM customer_business 
			  LEFT JOIN bus_customers ON customer_business.cust_id = bus_customers.bcust_id 
			  WHERE customer_business.bus_id IN($pare)";
	if ($sql22) {
		$sellerData = $fwDb->query($sql22);
	}
	$fwViewData['sellerData'] = $sellerData;
}
$tablestatus->setOrderBy('st_id' . ' ASC');
$fwViewData['business_status'] = $tablestatus->getAllRows();

$tablestate->setWhere("s_shortcodes != ' '");
$tablestate->setOrderBy('s_id' . ' ASC');
$fwViewData['states'] = $tablestate->getAllRows();

/********** Begin business_interest **********/
$business_interest_Table = new Fw_Db_Table('business_interest');
$business_interest_Table->setWhere("bi_parent = 0");
$interest = $business_interest_Table->getAllRows();
$fwViewData['interest'] = $interest;

/********** Begin project types **********/
$project_type_Table = new Fw_Db_Table('project_type');
$project_type_Table->setWhere("pt_status = 1");
$fwViewData['projecttypes'] = $project_type_Table->getAllRows();


$business_interest_Table->setWhere("bi_parent != 0");
$sub_interest = $business_interest_Table->getAllRows();
$fwViewData['sub_interest'] = $sub_interest;
/********** End business_interest **********/

$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
