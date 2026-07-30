<?php
//get the current limit
$memlimit = ini_get('memory_limit');
//set it to something else
ini_set("memory_limit", "2048M");
ini_set('max_execution_time', 0);
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);
$fwViewData['wa_id'] = (int)$fwRequest->getParam('wa_id', 0);
$submit = $fwRequest->getParam('subAddDetail', '');
$table = new Fw_Db_Table('warranty_log_detail_task');
$yesno = $fwRequest->getParam('yesno', '');
$user_name = $_SESSION['user']['user_name'];
if ($yesno) {
	foreach ($yesno as $k => $v) {
		$id = $k;
	}
	$detailTask['wd_yes_no'] = $v;
	$detailTask['wd_date'] = date('d-m-Y');
	$table->setWhere('wt_id = ' . $id);
	if ($table->rowExists()) {
		$this_id = $table->updateRow($detailTask);
	}
}
if (!empty($submit)) {
	$detail = $fwRequest->getParam($TABLE, array());
	$detail['wa_project'] = 	preg_replace('/\\\\/', '', $detail['wa_project']);
	$this_id = (int)$detail[$ID];
	if ($detail['wa_qicc'] == 'on') {
		$detail['wa_qicc'] = 1;
	} else {
		$detail['wa_qicc'] = 0;
	}
	$detail['wa_user'] = $user_name;
	$detail['wa_status_user'] = $user_name;
	$detail['wa_status_date'] = date('d-m-Y');
	unset($detail[$ID]);
	if ($_FILES['image1']['name']) {
		$docfile_1 = $_FILES['image1']['name'];
		$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
		$temp_name_1 = $_FILES['image1']['tmp_name'];
		$detail['wa_image_1'] = $docfile_1;
		upload($docfile_1, $temp_name_1);
		$docfile_1 = $_FILES['image1']['name'];
		$file_type = $_FILES['image1']['type'];
		$datetime = trim(date('d_m_Y_H_i_'), '0');
		$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
		$src = $_FILES['image1']['tmp_name'];
		$destination = BASE_DIR . 'files/warranty_log/' . $docfile_1;
		if (!move_uploaded_file($src, $destination)) {
			//echo "Possible file upload attack";
		} else {
			$detail['wa_image_1'] = $docfile_1;
			chmod($destination, 0664);
		}
	}
	if ($_FILES['image2']['name']) {
		$docfile_2 = $_FILES['image2']['name'];
		$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
		$temp_name_2 = $_FILES['image2']['tmp_name'];
		$detail['wa_image_2'] = $docfile_2;
		upload($docfile_2, $temp_name_2);
	}
	if ($_FILES['image3']['name']) {
		$docfile_3 = $_FILES['image3']['name'];
		$docfile_3 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
		$temp_name_3 = $_FILES['image3']['tmp_name'];
		$detail['wa_image_3'] = $docfile_3;
		upload($docfile_3, $temp_name_3);
	}
	if ($_FILES['image4']['name']) {
		$docfile_4 = $_FILES['image4']['name'];
		$docfile_4 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_4);
		$temp_name_4 = $_FILES['image4']['tmp_name'];
		$detail['wa_image_4'] = $docfile_4;
		upload($docfile_4, $temp_name_4);
	}
	if ($_FILES['image5']['name']) {
		$docfile_5 = $_FILES['image5']['name'];
		$docfile_5 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_5);
		$temp_name_5 = $_FILES['image5']['tmp_name'];
		$detail['wa_image_5'] = $docfile_5;
		upload($docfile_5, $temp_name_5);
	}
	if ($_FILES['video_file']['name']) {
		$docfile_6 = $_FILES['video_file']['name'];
		$docfile_6 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_6);
		$temp_name_6 = $_FILES['video_file']['tmp_name'];
		$detail['wa_video'] = $docfile_6;
		upload($docfile_6, $temp_name_6);
	}
	if ($this_id > 0) {
		$tableqa->setWhere("$ID = $this_id");
		$opr = $tableqa->updateRow($detail);

		$onesql = "SELECT * FROM warranty_log  where wa_id = " . $this_id;
		$oneData = $fwDb->queryOne($onesql);
		if($oneData['wa_status'] == 'Closed'){
			$message = '<html><body>';
			$message .= '<p>Hi Warranty Manager</p><br>';
			$message .= '<p>A warranty log has been recently closed.</p><br>';
			$message .= '<p><strong>Warranty ID:</strong> ' . $this_id . '</p>';
			$message .= '<p><strong>Project Address:</strong> ' . $oneData['wa_project'] . '</p>';
			$message .= '<p><strong>Problem:</strong> ' . $oneData['wa_problem'] . '</p><br>';
			$message .= '<p>If this warranty issue persist, please return here to reopen the log</p><br>';
			$message .= '<p>Regards,</p>';
			$message .= '<p>CGFB Warranty Team</p>';

			$to1 = 'warranty@cgfb.com.au';
			$to2 = 'info@cgfb.com.au';
			// $to1 = 'amans@ephpsolutions.com';
			// $to2 = 'rahul@ephpsolutions.com';
			$toname = 'Warranty Team';
			$subject = 'Warranty Issue Closed';

			//$to = 'manojsoniephp@gmail.com';

			$attachment = [];
			/** GENERATE PDF START */
				$heading = "Warranty Log Report";

				$html .= '<table border="1" width="100%" cellpadding="7">';


				$sql_p = "Select pr_priority from warranty_log_priority where pr_id = " . $oneData["wa_priority"];
				$prData = $fwDb->queryOne($sql_p);

				$sq12 = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
							bus_customers.bcust_misc_moble from business_sellers 		
							Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
							Inner Join business ON business_sellers.bs_business_id = business.bsn_id where business.bsn_name = '" . $oneData['wa_project'] . "'";

				$data = $fwDb->queryOne($sq12);

				if ($oneData["wa_qicc"] == 1) {
					$qicc = 'Yes';
				} else {
					$qicc = 'No';
				}

				if (!empty($oneData["wa_image_1"])) {

					$folder_path = "files/warranty_log/";
					$object_name = $oneData["wa_image_1"];
					$file = get_file_raw_data($folder_path, $object_name);
					$img1 = '<img src="' . $file . '" height="150">';
				} else {
					$img1 = '';
				}

				if (!empty($oneData["wa_image_2"])) {
					$folder_path = "files/warranty_log/";
					$object_name = $oneData["wa_image_2"];
					$file = get_file_raw_data($folder_path, $object_name);
					$img2 = '<img src="' . $file . '" height="150">';
				} else {
					$img2 = '';
				}

				if (!empty($oneData["wa_image_3"])) {
					$folder_path = "files/warranty_log/";
					$object_name = $oneData["wa_image_3"];
					$file = get_file_raw_data($folder_path, $object_name);
					$img3 = '<img src="' . $file . '" height="150">';
				} else {
					$img3 = '';
				}

				if (!empty($oneData["wa_image_4"])) {
					$folder_path = "files/warranty_log/";
					$object_name = $oneData["wa_image_4"];
					$file = get_file_raw_data($folder_path, $object_name);
					$img4 = '<img src="' . $file . '" height="150">';
				} else {
					$img4 = '';
				}


				if (!empty($oneData["wa_image_5"])) {
					$folder_path = "files/warranty_log/";
					$object_name = $oneData["wa_image_5"];
					$file = get_file_raw_data($folder_path, $object_name);
					$img5 = '<img src="' . $file . '" height="150">';
				} else {
					$img5 = '';
				}
				$oneData["wa_problem"] = str_replace("’", "'", $oneData["wa_problem"]);


				$sql_cg = "select wc_cgfb_option from warranty_log_cgfb where wc_id = " . $oneData['wa_cgfb_resp'];
				$cgfbdata = $fwDb->queryOne($sql_cg);

				$sql_why = "select ww_option from warranty_log_why_not where ww_id = " . $oneData['wa_why_not'];
				$whybdata = $fwDb->queryOne($sql_why);

				$sql_la = "select wl_liability_option  from warranty_log_liability where wl_id = " . $oneData['wa_lia_acc'];
				$labdata = $fwDb->queryOne($sql_la);

				if ($oneData['wa_tl'] == 1) {
					$backcol = 'style="background-color:#00CC33"';
				} elseif ($oneData['wa_tl'] == 2) {
					$backcol = 'style="background-color:#ff7f27"';
				} elseif ($oneData['wa_tl'] == 3) {
					$backcol = 'style="background-color:#F00"';
				} else {
					$backcol = '';
				}
				if ($oneData['wa_variation'] == 1) {
					$variation = 'Yes';
				} else {
					$variation = 'No';
				}


				$sqlnotes = "select * from warranty_log_notes where wn_wa_id = " . $oneData['wa_id'];
				$notesData = $fwDb->query($sqlnotes);

				$sql_2 = "Select ws_supplier_name, ws_update_text, ws_attachment, ws_date,ws_wr from warranty_supplier_update where  ws_wa_id = " . $oneData['wa_id'];
				$suData = $fwDb->query($sql_2);

				$notes = '<table border = "1" cellpadding="5" cellspacing="0" >';
				$notes .= '<tr><td >Notes</td><td>Added By</td><td>Date Added</td><td>Due Date</td><td>Attachment</td></tr>';

				if (!empty($notesData)) {

					foreach ($notesData as $kn => $vn) {
						$rowHighlighted = '';
						if(!empty($vn['wn_due_date']) && strtotime($vn['wn_due_date']) > 0 && strtotime($vn['wn_due_date']) >= strtotime(date('Y-m-d 00:00:00'))){
							$rowHighlighted = ' style="background-color:#F00"';
						}
						$notes .= '<tr' . $rowHighlighted . '>';
						$notes .= '<td>' . stripslashes($vn['wn_notes']) . '</td>';
						$notes .= '<td>' . $vn['wn_added_by'] . '</td>';
						$notes .= '<td>' . $vn['wn_date'] . '</td>';
						$notes .= '<td>' . $vn['wn_due_date'] . '</td>';
						$notes .= '<td>';
						if (!empty($vn['wn_attachment'])) {
							$notes .= '<a href="' . BASE_URL . "files/uploads/" . $vn['wn_attachment'] . '">Link</a>';
						}
						$notes .= '</td>';
						$notes .= '</tr>';
					}
				}


				if (!empty($suData)) {

					foreach ($suData as $kn2 => $vn2) {

						$notes .= '<tr>';
						$notes .= '<td>' . stripslashes($vn2['ws_update_text']) . '</td>';
						$notes .= '<td>' . $vn2['ws_supplier_name'] . '</td>';
						$notes .= '<td>' . changedate_d_m_y($vn2['ws_date']) . '</td>';
						$notes .= '<td>';
						if (!empty($vn2['ws_attachment'])) {
							$notes .= '<a href="https://www.warrantyreport.com.au/files/uploads/' . $vn2['ws_attachment'] . '">Link</a>';
						}
						$notes .= '</td>';
						$notes .= '</tr>';
					}
				}


				$notes .= '</table>';

				if (empty($notesData) && empty($suData)) {
					$notes = "";
				}


				$sql5678 = "Select business_tasks.bt_completed_date from business_tasks
							where business_tasks.bt_bsn_id = " . $data['bs_business_id'] . " And business_tasks.bt_task_id = 254 ";

				$data2 = $fwDb->queryOne($sql5678);

				$oneData["wa_problem"] = str_replace("’", "'", $oneData["wa_problem"]);
				//$oneData["wa_notes"] = str_replace("’","'",$oneData["wa_notes"]);

				$dayscount = '';
				$ccdate = $oneData['wa_date'];
				if (!empty($ccdate)) {
					$Statusdate = changedate_y_m_d($ccdate);
					$curdate_y_m_d = date('Y-m-d');
					$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
				}


				$html .= '<tr style="background-color:#FF0; text-align:center">';
				$html .= '<th  colspan="2">Rec. No. ' . $oneData["wa_id"] . ' </th>';
				$html .= '</tr>';

				$html .= '<tr>';
				$html .= '<td width="15%">Project</td>';
				$html .= '<td width="85%">' . $oneData["wa_project"] . '</td>';
				$html .= '</tr>';

				$html .= '<tr>';
				$html .= '<td width="15%">Contact Info</td>';
				$html .= '<td width="85%">' . $data['bcust_fname'] . ' ' . $data['bcust_lname'] . ' - Mobile No :' . $data['bcust_misc_moble'] . '</td>';
				$html .= '</tr>';

				$html .= '<tr>';
				$html .= '<td width="15%">CGFB Responsible</td>';
				$html .= '<td width="85%">' . $cgfbdata["wc_cgfb_option"] . '</td>';
				$html .= '</tr>';

				$html .= '<tr>';
				$html .= '<td width="15%">Why Not Responsible</td>';
				$html .= '<td width="85%">' . $whybdata["ww_option"] . '</td>';
				$html .= '</tr>';

				$html .= '<tr>';
				$html .= '<td width="15%">Liability Accepted</td>';
				$html .= '<td width="85%">' . $labdata["wl_liability_option"] . '</td>';
				$html .= '</tr>';

				$html .= '<tr>';
				$html .= '<td width="15%">Status</td>';
				$html .= '<td width="85%">' . $oneData["wa_status"] . '</td>';
				$html .= '</tr>';

				$html .= '<tr>';
				$html .= '<td width="15%">Traffic Light</td>';
				$html .= '<td width="85%"' . $backcol . '></td>';
				$html .= '</tr>';


				$html .= '<tr>';
				$html .= '<td width="15%">Variation Required</td>';
				$html .= '<td width="85%">' . $variation . '</td>';
				$html .= '</tr>';


				$html .= '<tr>';
				$html .= '<td width="15%">Priority</td>';
				$html .= '<td width="85%">' . $prData['pr_priority'] . '</td>';
				$html .= '</tr>';

				$html .= '<tr>';
				$html .= '<td width="15%">Problem</td>';
				$html .= '<td width="85%">' . $oneData["wa_problem"] . '</td>';
				$html .= '</tr>';

				$html .= '<tr>';
				$html .= '<td width="15%">Notes</td>';
				$html .= '<td width="85%">' . $notes . '</td>';
				$html .= '</tr>';

				$html .= '<tr>';
				$html .= '<td width="15%">Date</td>';
				$html .= '<td width="85%">' . trim($oneData["wa_date"]) . '</td>';
				$html .= '</tr>';

				$html .= '<tr>';
				$html .= '<td width="15%">Walkthrough Date</td>';
				$html .= '<td width="85%">' . changedate_d_m_y($data2['bt_completed_date']) . '</td>';
				$html .= '</tr>';

				$html .= '<tr>';
				$html .= '<td width="15%">Days Count</td>';
				$html .= '<td width="85%">' . $dayscount . '</td>';
				$html .= '</tr>';

				$html .= '<tr>';
				$html .= '<td width="15%">Type</td>';
				$html .= '<td width="85%">' . $oneData["wa_type"] . '</td>';
				$html .= '</tr>';

				$html .= '<tr>';
				$html .= '<td width="15%">Tenated</td>';
				$html .= '<td width="85%">' . $oneData["wa_tenanted"] . '</td>';
				$html .= '</tr>';

				$html .= '<tr>';
				$html .= '<td width="15%">Q. Inspector Contaced Client</td>';
				$html .= '<td width="85%">' . trim($qicc) . '</td>';
				$html .= '</tr>';

				$html .= '<tr>';
				$html .= '<td width="15%">Date Inspected</td>';
				$html .= '<td width="85%">' . trim($oneData["wa_date_inspected"]) . '</td>';
				$html .= '</tr>';

				$html .= '<tr>';
				$html .= '<td width="15%">CGFB Person</td>';
				$html .= '<td width="85%">' . $oneData["wa_cgfb_person"] . '</td>';
				$html .= '</tr>';

				$x = explode("<br>", $oneData['wa_include_supplier']);
				$incsup = [];
				foreach ($x as $k3 => $v3) {
					preg_match('~>\K[^<>]*(?=<)~',  $v3, $str);
					$incsup[] = $str[0];
				}

				$html .= '<tr>';
				$html .= '<td width="15%">Supplier or Contact</td>';
				$html .= '<td width="85%">' . implode("<br>", $incsup) . '</td>';
				$html .= '</tr>';

				$html .= '<tr>';
				$html .= '<td colspan="2">' . $img1 . '&nbsp;' . $img2 . '&nbsp;' . $img3 . '&nbsp;' . $img4 . '&nbsp;' . $img5 . '</td>';
				$html .= '</tr>';

				$html .= '</table>';

				$attachment[] = create_warranty_PDF($heading, $html, $fname, false);
			/** GENERATE PDF END */
			
			// $nameoffile = 'warranty_log';
			// $filename = $nameoffile."_".date('d_m_Y').".pdf";
			// $filepath = 'reports/'.$filename;
			// $filepath_url = BASE_URL.$filepath;
			
			// $attachment[] = $filepath_url;
			$serializeAttc = serialize($attachment);
			send_email($toname, $to1, 'CGFB Warranty Team', 'warranty@cgfb.com.au', $subject, $message, $serializeAttc);
			send_email($toname, $to2, 'CGFB Warranty Team', 'warranty@cgfb.com.au', $subject, $message, $serializeAttc);
		}
	} else {
		$opr = $tableqa->insertRow($detail);
	}
	$fwViewData['opr'] = $opr;
	//Location(BASE_URL . $XFA['home']);
}
$submittrade = $fwRequest->getParam('trade_resp', '');
if (!empty($submittrade)) {
	$table_ts = new Fw_Db_Table('trade_responsibility');
	$detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];
	unset($detail[$ID]);
	if ($_FILES['image1']['name']) {
		$docfile_1 = $_FILES['image1']['name'];
		$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
		$temp_name_1 = $_FILES['image1']['tmp_name'];
		$detail['wa_image_1'] = $docfile_1;
		upload($docfile_1, $temp_name_1);
	}
	if ($_FILES['image2']['name']) {
		$docfile_2 = $_FILES['image2']['name'];
		$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
		$temp_name_2 = $_FILES['image2']['tmp_name'];
		$detail['wa_image_2'] = $docfile_2;
		upload($docfile_2, $temp_name_2);
	}
	if ($_FILES['image3']['name']) {
		$docfile_3 = $_FILES['image3']['name'];
		$docfile_3 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
		$temp_name_3 = $_FILES['image3']['tmp_name'];
		$detail['wa_image_3'] = $docfile_3;
		upload($docfile_3, $temp_name_3);
	}
	if ($_FILES['image4']['name']) {
		$docfile_4 = $_FILES['image4']['name'];
		$docfile_4 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_4);
		$temp_name_4 = $_FILES['image4']['tmp_name'];
		$detail['wa_image_4'] = $docfile_4;
		upload($docfile_4, $temp_name_4);
	}
	if ($_FILES['image5']['name']) {
		$docfile_5 = $_FILES['image5']['name'];
		$docfile_5 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_5);
		$temp_name_5 = $_FILES['image5']['tmp_name'];
		$detail['wa_image_5'] = $docfile_5;
		upload($docfile_5, $temp_name_5);
	}
	if ($_FILES['video_file']['name']) {
		$docfile_6 = $_FILES['video_file']['name'];
		$docfile_6 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_6);
		$temp_name_6 = $_FILES['video_file']['tmp_name'];
		$detail['wa_video'] = $docfile_6;
		upload($docfile_6, $temp_name_6);
	}
	if ($detail['wa_qicc'] == 'on') {
		$detail['wa_qicc'] = 1;
	} else {
		$detail['wa_qicc'] = 0;
	}
	$detail['wa_user'] = $user_name;
	$detail['wa_status_date'] = date('d-m-Y');
	$detail['wa_log_number'] = $this_id;
	$table_ts->setWhere("wa_id = $this_id");
	if ($table_ts->rowExists()) {
		$opr = $table_ts->updateRow($detail);
	} else {
		$opr = $table_ts->insertRow($detail);
	}
	$fwViewData['opr'] = $opr;
}
$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0) {
	$tableqa = new Fw_Db_Table($TABLE);
	$tableqa->setWhere("$ID = $this_id");
	$detail = $tableqa->getRow();
	$fwViewData['detail'] = $detail;
	$fwViewData['title'] = 'Edit ' . $MODULE_SINGULAR;
	$table_1 = new Fw_Db_Table('warranty_log_detail_task');
	$sql_1 = "select warranty_log_task.* from warranty_log_task";
	$masterdata = $fwDb->query($sql_1);
	foreach ($masterdata as $k => $v) {
		$table_1->setWhere("wd_task_id = " . $v['wt_id'] . " And wd_wl_id = " . $this_id);
		$taskdetail['wd_wl_id'] = $this_id;
		$taskdetail['wd_task_id'] = $v['wt_id'];
		if (!$table_1->rowExists()) {
			$opr1 = $table_1->insertRow($taskdetail);
		}
	}
} else {
	$fwViewData['title'] = 'Add ' . $MODULE_SINGULAR;
}
$sql = "SELECT  business.* from business";
$fwViewData['projdetail'] = $fwDb->query($sql);
$sql = "select warranty_log_detail_task.* , warranty_log_task.wt_task_name from warranty_log_detail_task
    	        Inner join warranty_log_task ON warranty_log_detail_task.wd_task_id = warranty_log_task.wt_id
	        where warranty_log_detail_task.wd_wl_id = " . $this_id;
$fwViewData['taskData'] = $fwDb->query($sql);
$sqlpr = "Select * from warranty_log_priority";
$fwViewData['prdetail'] = $fwDb->query($sqlpr);
$sql_c = "Select * from companies";
$fwViewData['compdetail'] = $fwDb->query($sql_c);
$thisTable = new Fw_Db_Table("warranty_log_type");
$fwViewData['typedetail'] = $thisTable->getAllRows();
