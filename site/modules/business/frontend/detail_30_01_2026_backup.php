<?php


$bsn_id = (int)$fwRequest->getParam('bsn_id', '');
$params = $fwRequest->getParams();
if($bsn_id > 0 && isset($params['productpage'])) {
	include 'productpage.php';
}
else {
	$table = new Fw_Db_Table($TABLE);
	$tablestatus = new Fw_Db_Table('busness_status');
	$tableptypes = new Fw_Db_Table('project_type');
	$tablecust = new Fw_Db_Table('bus_customers');
	$tablecust_bus = new Fw_Db_Table('customer_business');

	$submit = $fwRequest->getParam('subAddDetail', '');
	$submit_print_notes = $fwRequest->getParam('print_notes', '');

	$mekesubmit = $fwRequest->getParam('makenew', '');
	if (!empty($mekesubmit)) {

		$bsnmake = $fwRequest->getParam('bsn_id', '');
		$makedetail['bsn_status_sys_date'] = date('Y-m-d');
		$table->setWhere($ID . " = " . $bsnmake);
		$mkid = $table->updateRow($makedetail);

		$cdl = new Fw_Db_Table('create_date_log');
		$cdlog['cd_bsn_id'] = $bsnmake;
		$cdlog['cd_user'] = $_SESSION['user']['user_name'];
		$cdlog['cd_date'] = date('d-m-Y');
		$cl = $cdl->insertRow($cdlog);
	}

	$doc_qr_code_upload = $fwRequest->getParam('doc_qr_code_upload', '');
	if($doc_qr_code_upload) {
		
	}
	$fwViewData['doc_qr_code_upload'] = $doc_qr_code_upload;


	if (!empty($submit)) {
		$detail = $fwRequest->getParam($TABLE, array());

		if (!$detail['bsn_addto_cpr']) {
			$detail['bsn_addto_cpr'] = 0;
		}
		if (!$detail['bsn_addto_complete']) {
			$detail['bsn_addto_complete'] = 0;
		}

		// SETTING planning approval website phases control
		$detail['bsn_pa_sales_flag'] = 0;
		$detail['bsn_pa_design_flag'] = 0;
		$detail['bsn_pa_planning_flag'] = 0;
		$detail['bsn_pa_inclusion_flag'] = 0;
		$detail['bsn_pa_construction_flag'] = 0;
		$detail['bsn_pa_completion_flag'] = 0;
		foreach ($detail['bsn_status'] as $id) {
			// Convert
			if ($id == 1) {
				$detail['bsn_pa_sales_flag'] = 1;
				$detail['bsn_pa_design_flag'] = 1;
				$detail['bsn_pa_planning_flag'] = 1;
				$detail['bsn_pa_inclusion_flag'] = 1;
				$detail['bsn_pa_construction_flag'] = 1;
				$detail['bsn_pa_completion_flag'] = 1;
			}
			// Planning Approvals	
			if ($id == 2) {
				$detail['bsn_pa_planning_flag'] = 1;
			}
			// Construction
			if ($id == 3) {
				$detail['bsn_pa_construction_flag'] = 1;
			}
			// Complete
			if ($id == 4) {
				$detail['bsn_pa_completion_flag'] = 1;
			}
			// Inclusions
			if ($id == 5) {
				$detail['bsn_pa_inclusion_flag'] = 1;
			}
			// Pre-construction
			if ($id == 6) {
				$detail['bsn_pa_inclusion_flag'] = 1;
			}
			// Lost
			// if ($id == 15) {
			// }
			// Design Phase
			if ($id == 12) {
				$detail['bsn_pa_design_flag'] = 1;
			}
		}

		$status = implode("|", $detail['bsn_status']);
		$detail['bsn_status'] = "|" . $status . "|";
		//db($status);
		//exit;

		$current_time = date('H:i');
		$curdate_y_m_d = date('Y-m-d');

		$detail['bsn_name'] = stripslashes($detail['bsn_name']);

		if ($detail['bsn_address_same']) {
			$detail['bsn_address_same'] = 1;
		} else {
			$detail['bsn_address_same'] = 0;
		}
		if ($detail['bsn_unsubscribe_email']) {
			$detail['bsn_unsubscribe_email'] = 1;
		} else {
			$detail['bsn_unsubscribe_email'] = 0;
		}

		if (empty($detail['bsn_interest'])) {
			$detail['bsn_interest'] = 0;
		}
		if (empty($detail['bsn_readyforsale'])) {
			$detail['bsn_readyforsale'] = 0;
		}
		if (empty($detail['bsn_send_marketing_emails'])) {
			$detail['bsn_send_marketing_emails'] = 0;
		}
		if (empty($detail['bsn_disclosed_marketing'])) {
			$detail['bsn_disclosed_marketing'] = 0;
		}
		if (empty($detail['bsn_franchise'])) {
			$detail['bsn_franchise'] = 0;
		}
		if (empty($detail['bsn_auto_edossier'])) {
			$detail['bsn_auto_edossier'] = 0;
		}

		/****Begin Change date format to be stored in database *****/
		if (!empty($detail['bsn_status_date'])) {
			$detail['bsn_status_date'] = changedate_y_m_d($detail['bsn_status_date']);
		};
		if (!empty($detail['bsn_status_sys_date'])) {
			$detail['bsn_status_sys_date'] = changedate_y_m_d($detail['bsn_status_sys_date']);
		};
		if (!empty($detail['bsn_date_listed_date'])) {
			$detail['bsn_date_listed_date'] = changedate_y_m_d($detail['bsn_date_listed_date']);
		};
		if (!empty($detail['bsn_cd_date_appraised_date'])) {
			$detail['bsn_cd_date_appraised_date'] = changedate_y_m_d($detail['bsn_cd_date_appraised_date']);
		};
		if (!empty($detail['bsn_cd_planing_sell_date'])) {
			$detail['bsn_cd_planing_sell_date'] = changedate_y_m_d($detail['bsn_cd_planing_sell_date']);
		};
		if (!empty($detail['bsn_marketing_date'])) {
			$detail['bsn_marketing_date'] = changedate_y_m_d($detail['bsn_marketing_date']);
		};
		if (!empty($detail['bsn_last_update_letter_date'])) {
			$detail['bsn_last_update_letter_date'] = changedate_y_m_d($detail['bsn_last_update_letter_date']);
		};
		/****End Change date format to be stored in database *****/

		$table_id = (int)$detail[$ID];
		$detail['bsn_user_id'] = $_SESSION['user']['user_id'];
		unset($detail[$ID]);
		if (!empty($table_id)) {


			$bs = "'%" . $detail['bsn_status'] . "%'";



			$table->setWhere("bsn_status Like " . $bs);

			if (!$table->rowExists()) {

				$detail['bsn_status_date'] = $curdate_y_m_d;
				$detail['bsn_status_time'] = $current_time;
			}


			if ($detail['bsn_sub_status'] == 'Open') {
				$detail['bsn_planning_moveto_old'] = 0;
			}
			if ($detail['bsn_sub_status'] == 'Hold') {
				$detail['bsn_planning_moveto_old'] = 1;
				$detail['bsn_pa_sales_flag'] = 0;
				$detail['bsn_pa_design_flag'] = 0;
				$detail['bsn_pa_planning_flag'] = 0;
				$detail['bsn_pa_inclusion_flag'] = 0;
				$detail['bsn_pa_construction_flag'] = 0;
				$detail['bsn_pa_completion_flag'] = 0;
			}
			if ($detail['bsn_sub_status'] == 'Lost') {
				$detail['bsn_planning_moveto_old'] = 1;
			}



			$table->setWhere($ID . " = " . $table_id);
			$bust_id = $table->updateRow($detail);



			$bsn_seller = $detail['bsn_seller'];

			if (!empty($bsn_seller)) {
				$data['cust_id'] = $bsn_seller;
				$data['bus_id'] = $table_id;

				$tablecust_bus->setWhere("cust_id = " . $bsn_seller . " AND bus_id = " . $table_id);

				if (!$tablecust_bus->rowExists()) {
					$tablecust_bus->insertRow($data);
				}
			}


			$table_pr_master = new Fw_Db_Table('person_responsible_master');
			$table_pr_detail = new Fw_Db_Table('person_responsible_detail');

			$prMaster =  $table_pr_master->getRows();

			$table_pr_detail->setWhere('prd_bsn_id = ' . $table_id);

			if (!$table_pr_detail->rowExists()) {
				foreach ($prMaster as $pk => $pv) {
					//db($pv);
					$table_pr_detail->insertRow($pv);
				}
			}
		} else {
			$detail['bsn_user_id'] = $_SESSION['user']['user_id'];
			$bust_id  = $table->insertRow($detail);
			$bsn_seller = $detail['bsn_seller'];
			if (!empty($bsn_seller)) {
				$data['cust_id'] = $bsn_seller;
				$data['bus_id'] = $bust_id;
				$tablecust_bus->setWhere("cust_id = " . $bsn_seller . " AND bus_id = " . $bust_id);
				if (!$tablecust_bus->rowExists()) {
					$temp = $tablecust_bus->insertRow($data);
				}
			}


			Location(BASE_URL . $XFA['detail'] . "/bsn_id/$bust_id");
		}
	}


	/***** Begin busness_status ****/
	$tablestatus->setWhere('st_status != 0');
	$tablestatus->setOrderBy('st_id' . ' ASC');
	$fwViewData['business_status'] = $tablestatus->getAllRows();
	/***** End busness_status ****/


	/******* Begin business_interest - Only Sub level ******/
	$tableptypes->setWhere('pt_status != 0');
	$tableptypes->setOrderBy('pt_name' . ' ASC');
	$fwViewData['project_types'] = $tableptypes->getAllRows();
	/******* End business_interest - Only Sub level ******/

	/******* Begin enquirysourceel ******/
	$tableEnquirysource = new Fw_Db_Table('enquirysource');
	$allenquirysource = $tableEnquirysource->getRows();
	$fwViewData['allenquirysource'] = $allenquirysource;
	/******* End enquirysource ******/



	$table_id = (int)$fwRequest->getParam($ID, 0);
	$fwViewData['buyer_enquiry'] = (int)$fwRequest->getParam('be_id', 0);
	//db($fwViewData['buyer_enquiry']);
	//exit;
	if ($table_id > 0) {
		$table->setWhere("$ID = $table_id");
		$sql = "SELECT " . $TABLE . ".*, users.user_name FROM " . $TABLE . " LEFT JOIN users ON users.user_id = " . $TABLE . ".bsn_user_id WHERE " . $TABLE . ".$ID = $table_id";
		$detail = $fwDb->queryOne($sql);

		/***Begin Change Date to D-M-Y ***/
		$detail['bsn_status_date'] = changedate_d_m_Y($detail['bsn_status_date']);
		$detail['bsn_status_time'] = changetime_h_m($detail['bsn_status_time']);

		$detail['bsn_status_sys_date'] = changedate_d_m_Y($detail['bsn_status_sys_date']);
		$detail['bsn_status_sys_time'] = changetime_h_m($detail['bsn_status_sys_time']);

		$detail['bsn_date_listed_date'] = changedate_d_m_Y($detail['bsn_date_listed_date']);
		$detail['bsn_date_listed_time'] = changetime_h_m($detail['bsn_date_listed_time']);

		$detail['bsn_cd_date_appraised_date'] = changedate_d_m_Y($detail['bsn_cd_date_appraised_date']);
		$detail['bsn_cd_date_appraised_time'] = changetime_h_m($detail['bsn_cd_date_appraised_time']);

		$detail['bsn_cd_planing_sell_date'] = changedate_d_m_Y($detail['bsn_cd_planing_sell_date']);
		$detail['bsn_cd_planing_sell_time'] = changetime_h_m($detail['bsn_cd_planing_sell_time']);

		$detail['bsn_marketing_date'] = changedate_d_m_Y($detail['bsn_marketing_date']);
		$detail['bsn_marketing_time'] = changetime_h_m($detail['bsn_marketing_time']);

		$detail['bsn_last_update_letter_date'] = changedate_d_m_Y($detail['bsn_marketing_date']);
		$detail['bsn_last_update_letter_time'] = changetime_h_m($detail['bsn_marketing_time']);
		/***End Change Date to D-M-Y ***/

		$detail['bsn_status'] = explode("|", $detail['bsn_status']);

		//db($detail);	

		$fwViewData['detail'] = stripslashes_deep($detail);

		$Statusdate = changedate_y_m_d($detail['bsn_status_date']);
		$sysdate = changedate_y_m_d($detail['bsn_status_sys_date']);
		$curdate = date('d-m-Y');
		$curdate_y_m_d = date('Y-m-d');

		$fwViewData['statusday'] = daysDifference($curdate_y_m_d, $Statusdate);
		$fwViewData['systemday'] = daysDifference($curdate_y_m_d, $sysdate);
		$fwViewData['title'] = 'Edit ' . $MODULE_SINGULAR;

		$sql = "SELECT business.bsn_id, customer_business.*, bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1 FROM customer_business LEFT JOIN business ON business.bsn_id = customer_business.bus_id LEFT JOIN bus_customers ON bus_customers.bcust_id = customer_business.cust_id WHERE  customer_business.bus_id = " . $table_id;

		$fwViewData['seller_data'] = $fwDb->query($sql);
		$fwViewData['bsn_id'] = $table_id;
		$_SESSION['bsn_id'] = (int)$fwViewData['bsn_id'];

		$table_pr_master = new Fw_Db_Table('person_responsible_master');
		$table_pr_detail = new Fw_Db_Table('person_responsible_detail');

		$prMaster =  $table_pr_master->getRows();

		$table_pr_detail->setWhere('prd_bsn_id = ' . $table_id);

		if (!$table_pr_detail->rowExists()) {
			foreach ($prMaster as $pk => $pv) {
				$perdet['prd_bsn_id'] = $table_id;
				$perdet['prd_prm_id'] = $pv['prm_id'];
				$perdet['prd_stream'] = $pv['prm_stream'];
				$perdet['prd_position'] = $pv['prm_position'];
				$table_pr_detail->insertRow($perdet);
			}
		}

		foreach ($prMaster as $pk2 => $pv2) {
			$table_pr_detail->setWhere('prd_bsn_id = ' . $table_id . ' and prd_prm_id = ' . $pv2['prm_id']);
			if (!$table_pr_detail->rowExists()) {
				$perdet2['prd_bsn_id'] = $table_id;
				$perdet2['prd_prm_id'] = $pv2['prm_id'];
				$perdet2['prd_stream'] = $pv2['prm_stream'];
				$perdet2['prd_position'] = $pv2['prm_position'];
				$table_pr_detail->insertRow($perdet2);
			}
		}

		//
		$table_payment_stage = new Fw_Db_Table('payment_statge');
		$table_ppd_detail = new Fw_Db_Table('progress_payment_detail');

		$payment_stage =  $table_payment_stage->getRows();


		$table_ppd_detail->setWhere('ppd_bsn_id = ' . $table_id);

		if (!$table_ppd_detail->rowExists()) {
			foreach ($payment_stage as $pk2 => $pv2) {
				$ppd['ppd_bsn_id'] = $table_id;
				$ppd['ppd_stage'] = $pv2['ps_stage'];
				$ppd['ppd_percent'] = $pv2['ps_percent'];
				$ppd['ppd_value'] = $pv2['ps_value'];

				$table_ppd_detail->insertRow($ppd);
			}
		}
	} else {
		$fwViewData['title'] = 'Add ' . $MODULE_SINGULAR;
		$current_date = date('d-m-Y');
		$current_time = date('H:i');

		$fwViewData['current_date'] = $current_date;
		$fwViewData['detail']['bsn_status_date'] = $current_date;
		$fwViewData['detail']['bsn_status_sys_date'] = $current_date;
		$fwViewData['detail']['bsn_date_listed_date'] = $current_date;
		$fwViewData['detail']['bsn_cd_date_appraised_date'] = $current_date;
		$fwViewData['detail']['bsn_marketing_date'] = $current_date;
		$fwViewData['detail']['bsn_cd_planing_sell_date'] = $current_date;
		$fwViewData['detail']['bsn_last_update_letter_date'] = $current_date;

		$fwViewData['detail']['bsn_status_time'] = $current_time;
		$fwViewData['detail']['bsn_status_sys_time'] = $current_time;
		$fwViewData['detail']['bsn_date_listed_time'] = $current_time;
		$fwViewData['detail']['bsn_cd_date_appraised_time'] = $current_time;
		$fwViewData['detail']['bsn_marketing_time'] = $current_time;
		$fwViewData['detail']['bsn_cd_planing_sell_time'] = $current_time;
		$fwViewData['detail']['bsn_last_update_letter_time'] = $current_time;
	}


	$sql = "SELECT u.user_id,u.user_name,ug.group_id, g.group_name
		FROM `users` u, `groups` g, users_groups ug
		WHERE u.user_id=ug.user_id AND ug.group_id=g.group_id AND g.group_id != 2 AND u.user_id != 1 
		ORDER BY g.group_id ASC, u.user_name ASC";
	$fwViewData['salesagents'] = $fwDb->query($sql);
	$delete_msg = $fwRequest->getParam('delete_msg');
	if (!empty($delete_msg) and $delete_msg > 0) {
		$fwViewData['delete_msg'] = 'Project has been Deleted Successfully';
	}
	unset($_SESSION['attach']);

	$tablepersonresponsible = new Fw_Db_Table('person_responsible_detail');
	$tablepersonresponsible->setWhere('prd_bsn_id = ' . $table_id);
	$fwViewData['person_responsible_detail'] =  $tablepersonresponsible->getRows();


	$table_progress_payment = new Fw_Db_Table('progress_payment_detail');
	$table_progress_payment->setWhere('ppd_bsn_id = ' . $table_id);
	$prog_val =  $table_progress_payment->getRows();

	foreach ($prog_val as $pk => $pv) {


		$d1 = date('Y-m-d');
		$d2 = changedate_y_m_d($pv['ppd_inv_due_date']);
		$d3 = changedate_y_m_d(trim($pv['ppd_when_payrec']));

		if (!empty($d2)) {
			$dayscount = daysDifference($d1, $d2);
			$prog_val[$pk]['days_late'] = $dayscount;
		}

		if (!empty($d2) && !empty($d3)) {
			$dayscount = daysDifference($d3, $d2);
			$prog_val[$pk]['days_late'] = $dayscount;
		}

		$ppd_hia_value = str_replace("$", '', $pv['ppd_hia_value']);
		$ppd_hia_value = str_replace(",", '', $ppd_hia_value);
		if (empty($ppd_hia_value)) {
			$ppd_hia_value = 0;
		}

		$ppd_value = str_replace("$", '', $pv['ppd_value']);
		$ppd_value = str_replace(",", '', $ppd_value);
		if (empty($ppd_value)) {
			$ppd_value = 0;
		}

		$prog_val[$pk]['amount_owed'] = number_format($ppd_hia_value - ($ppd_value), 2);


		// if (!empty($d2) && empty($d3)) {

		// 	$dayscount = daysDifference($d1, $d2);
		// 	$prog_val[$pk]['days_late'] = $dayscount;
		// } else if (!empty($d2) && !empty($d3)) {

		// 	$dayscount = daysDifference($d3, $d2);
		// 	$prog_val[$pk]['days_late'] = $dayscount;
		// }
	}


	$fwViewData['progress_payment_detail'] = $prog_val;

	$totaled = 0;
	$totaled_hia = 0;
	foreach ($prog_val as $ppk2 => $ppv2) {
		$v11 = str_replace("$", '', $ppv2['ppd_value']);
		$v22 = str_replace(",", '', $v11);

		if (empty($v22)) {
			$v22 = 0;
		}

		$totaled = $totaled + $v22;

		$v33 = str_replace("$", '', $ppv2['ppd_hia_value']);
		$v44 = str_replace(",", '', $v33);
		if (empty($v44)) {
			$v44 = 0;
		}

		$totaled_hia = $totaled_hia + $v44;
	}
	$fwViewData['total_value'] = $totaled;
	$fwViewData['total_value_hia'] = $totaled_hia;


	// add business subtask if task is already been added

	$bid = $fwRequest->getParam('bsn_id');


	$tableEmailLibrary = new Fw_Db_Table('emaillibrary');
	$fwViewData['emlibDetail'] =  $tableEmailLibrary->getRows();


	$submit2 = $fwRequest->getParam('ems', '');
	if (!empty($submit2)) {
		$bsn_id = $fwRequest->getParam('bsn_id');
		$detail = $fwRequest->getParam('emailData', array());
		$eml_id = $detail['eml_id'];

		if (!empty($_FILES['docs1']['name'])) {

			$file_name1 = $_FILES['docs1']['name'];
			$src1 = $_FILES['docs1']['tmp_name'];
			$destination1 = BASE_DIR . 'files/email_attachment/' . $file_name1;
			move_uploaded_file($src1, $destination1);
			$attach1 =  BASE_URL . FILE_PATH . "files/email_attachment/" . $file_name1;
		}


		if ($_FILES['docs2']['name']) {
			$file_name2 = $_FILES['docs2']['name'];
			$src2 = $_FILES['docs2']['tmp_name'];
			$destination2 = BASE_DIR . 'files/email_attachment/' . $file_name2;
			if (!is_dir(BASE_DIR . 'files/email_attachment/')) {
				mkdir(BASE_DIR . 'files/email_attachment/', 0777, TRUE);
			}
			move_uploaded_file($src2, $destination2);
			$attach2 =  BASE_URL . FILE_PATH . "files/email_attachment/" . $file_name2;
		}

		if ($_FILES['docs3']['name']) {
			$file_name3 = $_FILES['docs3']['name'];
			$src3 = $_FILES['docs3']['tmp_name'];
			$destination3 = BASE_DIR . 'files/email_attachment/' . $file_name3;
			if (!is_dir(BASE_DIR . 'files/email_attachment/')) {
				mkdir(BASE_DIR . 'files/email_attachment/', 0777, TRUE);
			}
			move_uploaded_file($src3, $destination3);
			$attach3 =  BASE_URL . FILE_PATH . "files/email_attachment/" . $file_name3;
		}


		$to = $detail['to_email'];
		$toname = $detail['to_name'];

		//$to = "manojsoniephp@gmail.com";
		//$to = "sunilt@ephpsolutions.com";
		//$to = "yanadelvalle@wotlink.com.au";


		$fromname = "CGFG";
		$from = "info@deckquote.com.au";
		$subject = $detail['subject'];
		$email_body = $detail['bsn_emcontent'];

		$attachmentsend = '';
		if (!empty($detail['bsn_document'])) {
			foreach ($detail['bsn_document'] as $k => $v) {
				if ($v) {
					$data = explode("|", $v);

					$finalatta = BASE_URL . FILE_PATH . "files/document_check_list_files/" . $data[0];

					$fdata[] = $finalatta;
					$doclogattach[] = $data[1];
				}
			}
		}


		if (!empty($detail['template_docs'])) {
			foreach ($detail['template_docs'] as $k1 => $v1) {
				if ($v1) {
					$docsattach = BASE_URL . FILE_PATH . "files/template_documents_hub/" . $v1;
					$fdata[] = $docsattach;
					$templogattach[] = $v1;
				}
			}
		}


		if (!empty($attach1)) {
			$fdata[] = $attach1;
		}

		if (!empty($attach2)) {
			$fdata[] = $attach2;
		}

		if (!empty($attach3)) {
			$fdata[] = $attach3;
		}

		if (!empty($fdata)) {
			$attachmentsend = serialize($fdata);
		}

		//db($attachmentsend);

		if (!empty($detail['user_email'])) {

			foreach ($detail['user_email'] as $k1 => $v1) {
				if (send_email($toname, $v1, $fromname, $from, $subject, $email_body, $attachmentsend)) {
					$fwViewData['email_sent_ok'] = "Email has been sent successfully ";
				}
			}
		}
		if ($detail['eml_ie_email'] == 'External') {
			if (send_email($toname, $to, $fromname, $from, $subject, $email_body, $attachmentsend)) {
				$fwViewData['email_sent_ok'] = "Email has been sent successfully ";
				$updateSql = "Update emaillibrary set eml_count = eml_count + 1 where eml_id =" . $eml_id;
				$id = $fwDb->queryOne($updateSql);

				$logDetail['elog_eml_code'] = $detail['eml_code'];
				$logDetail['elog_bsn_id'] = $bsn_id;
				if (!empty($doclogattach)) {
					$logDetail['elog_doc_attached'] = implode(", ", $doclogattach);
				}
				if (!empty($templogattach)) {
					$logDetail['elog_temp_attached'] = implode(", ", $templogattach);
				}
				$logDetail['elog_email_body'] = $email_body;

				$email_log_Table = new Fw_Db_Table('email_log');
				$email_log_Table->insertRow($logDetail);
				//db($logDetail);
				//exit;
			}
		}
	}
	$bsn_id = $fwRequest->getParam('bsn_id', '');
	$fwViewData['bsn_id_m'] = $bsn_id;

	if ($bsn_id) {
		$pagenum = $fwRequest->getParam('pagenum', 0);
		$sqlET = "Select email_log.* from email_log
				where email_log.elog_bsn_id  = " . $bsn_id . " ORDER By email_log.elog_id DESC";

		$emaildetail = $fwDb->query($sqlET);


		if ($sqlET) {
			$userData = $fwDb->query($sqlET);
		}

		$_SESSION['sqlET'] = $sqlET;

		if (!empty($userData)) {
			if (!(isset($pagenum))) {
				$pagenum = 1;
			}

			$rows = count($userData);
			$page_rows = 100;
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
			$sql2 =  $sqlET . " " . $max;

			if ($sql2) {
				$emailLogRecords = $fwDb->query($sql2);
				foreach ($emailLogRecords as $index => $record) {
					$elog_to = json_decode($record['elog_to'], true);
					if (is_array($elog_to)) {
						$total = count($elog_to);
						$emailLogRecords[$index]['elog_to'] = '';
						for ($i = 0; $i < $total; $i++) {
							$emailLogRecords[$index]['elog_to'] .= $elog_to[$i]['name'] . ' - ' . $elog_to[$i]['email'];
							if ($i < $total) {
								$emailLogRecords[$index]['elog_to'] .= '<br>';
							}
						}
					}
					$elog_cc = json_decode($record['elog_cc'], true);
					if (is_array($elog_cc)) {
						$total = count($elog_cc);
						$emailLogRecords[$index]['elog_cc'] = '';
						for ($i = 0; $i < $total; $i++) {
							$emailLogRecords[$index]['elog_cc'] .= $elog_cc[$i]['name'] . ' - ' . $elog_cc[$i]['email'];
							if ($i < $total) {
								$emailLogRecords[$index]['elog_cc'] .= '<br>';
							}
						}
					}
				}
				$fwViewData['list'] = $emailLogRecords;
			}
		}
	}

	//// Q/A Email Log Starts


	if ($bsn_id) {

		$sqlqalog = "Select qa_email_log.* from qa_email_log
				where qa_email_log.qal_bsn_id  = " . $bsn_id . " ORDER By qa_email_log.qal_id DESC";

		$emaildetail = $fwDb->query($sqlqalog);


		if ($sqlqalog) {
			$qalogData = $fwDb->query($sqlqalog);
		}

		$_SESSION['sqlqalog'] = $sqlqalog;

		if (!empty($qalogData)) {
			if (!(isset($pagenum))) {
				$pagenum = 1;
			}

			$rows = count($qalogData);
			$page_rows = 100;
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
			$sql22 =  $sqlqalog . " " . $max;

			if ($sql22) {
				$fwViewData['listqalog'] = $fwDb->query($sql22);
			}
		}
	}



	//// Q/A Email Log Ends



	// save person responsible

	$submitpr = $fwRequest->getParam('pr', '');

	if (!empty($submitpr)) {
		$detailpr = $fwRequest->getParam('person', array());
		//db($detailpr);

		$tableprd = new Fw_Db_Table('person_responsible_detail');

		foreach ($detailpr as $kpr => $vpr) {

			$tableprd->setWhere("prd_id = " . $kpr);

			$prdetail['prd_name'] = $vpr['name'];
			if ($tableprd->rowExists()) {
				$tableprd->updateRow($prdetail);
			}
		}
		$bsn_id = $fwRequest->getParam('bsn_id', '');
		$tablepersonresponsible = new Fw_Db_Table('person_responsible_detail');
		$tablepersonresponsible->setWhere('prd_bsn_id = ' . $bsn_id);
		$fwViewData['person_responsible_detail'] =  $tablepersonresponsible->getRows();
	}

	// save person responsibe Ends

	//Start get data for warranty outstanding payment 
	if ($bsn_id) {
		$sql_outstanding_payment = "SELECT bsn_id, bsn_wa_outstanding_payment FROM `business` where bsn_id = " . $bsn_id;
		$outstanding_payment_data = $fwDb->queryOne($sql_outstanding_payment);
		$fwViewData['outstanding_payment'] = $outstanding_payment_data['bsn_wa_outstanding_payment'];
	}
	//End get data for warranty outstanding payment 


	// Save Progress Payment

	$blank = $fwRequest->getParam('blank', '');
	if (!empty($blank)) {
		$tableppd = new Fw_Db_Table('progress_payment_detail');
		$bsn_id = $fwRequest->getParam('bsn_id', 0);
		$detailpp2['ppd_bsn_id'] = $bsn_id;
		//db($detailpp2);
		//exit;

		$tableppd->insertRow($detailpp2);
		$tableppd->setWhere('ppd_bsn_id = ' . $bsn_id);
		$fwViewData['progress_payment_detail'] =  $tableppd->getRows();
	}


	$submitpp = $fwRequest->getParam('ppsave', '');

	if (!empty($submitpp)) {
		$detailpp = $fwRequest->getParam('payment', array());


		$detailpp2 = $fwRequest->getParam('payment2', '');
		$bsn_id = $fwRequest->getParam('bsn_id', 0);

		$tableppd = new Fw_Db_Table('progress_payment_detail');

		foreach ($detailpp as $kprm => $vpr) {

			if ($_FILES['doc_' . $kprm]['name']) {
				$docfile_1 = $_FILES['doc_' . $kprm]['name'];


				$file_type = $_FILES['doc_' . $kprm]['type'];

				$datetime = trim(date('d_m_Y_H_i_'), '0');
				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$src = $_FILES['doc_' . $kprm]['tmp_name'];
				//$destination = BASE_DIR.'files/progress_payment_doc/'.$docfile_1;

				upload_pp_doc($docfile_1, $src);
				$prdetail['ppd_signoff_doc'] = $docfile_1;

				//if(!move_uploaded_file($src, $destination))
				//								{
				//									//echo "Possible file upload attack";
				//								}
				//						else
				//								{
				//									$prdetail['ppd_signoff_doc']= $docfile_1; 
				//									chmod($destination, 0664);
				//								}	

			}

			if ($_FILES['doc2_' . $kprm]['name']) {
				$docfile_2 = $_FILES['doc2_' . $kprm]['name'];
				$file_type = $_FILES['doc2_' . $kprm]['type'];

				$datetime = trim(date('d_m_Y_H_i_'), '0');
				$docfile_2 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
				$src = $_FILES['doc2_' . $kprm]['tmp_name'];

				upload_pp_doc($docfile_2, $src);
				$prdetail['ppd_invoice_sent'] = $docfile_2;
				$prdetail['ppd_invoice_sent_date'] = date('d-m-Y');
			}

			if ($_FILES['doc3_' . $kprm]['name']) {
				$docfile_3 = $_FILES['doc3_' . $kprm]['name'];
				$file_type = $_FILES['doc3_' . $kprm]['type'];

				$datetime = trim(date('d_m_Y_H_i_'), '0');
				$docfile_3 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
				$src = $_FILES['doc3_' . $kprm]['tmp_name'];

				upload_pp_doc($docfile_3, $src);
				$prdetail['ppd_letter_to_be'] = $docfile_3;
			}

			$tableppd->setWhere("ppd_id = " . $kprm);

			$prdetail['ppd_stage'] = $vpr['ppd_stage'];
			$prdetail['ppd_percent'] = $vpr['ppd_percent'];
			$prdetail['ppd_hia_value'] = $vpr['ppd_hia_value'];
			$prdetail['ppd_value'] = $vpr['ppd_value'];

			$prdetail['ppd_when_payrec'] = $vpr['ppd_when_payrec'];
			$prdetail['ppd_inv_due_date'] = $vpr['ppd_inv_due_date'];
			$prdetail['ppd_corf'] = $vpr['ppd_corf'];
			$prdetail['ppd_forcast_date'] = $vpr['ppd_forcast_date'];
			$prdetail['ppd_completed_date'] = $vpr['ppd_completed_date'];




			if (!empty($vpr['ppd_default_int'])) {
				$prdetail['ppd_default_int'] = 1;
			} else {
				$prdetail['ppd_default_int'] = 0;
			}

			if ($tableppd->rowExists()) {
				$tableppd->updateRow($prdetail);
			}



			unset($prdetail['ppd_signoff_doc']);
			unset($prdetail['ppd_invoice_sent']);
			unset($prdetail['ppd_corf']);
			unset($prdetail['ppd_forcast_date']);
			unset($prdetail['ppd_completed_date']);
			unset($prdetail['ppd_letter_to_be']);
			unset($prdetail['ppd_invoice_sent_date']);
		}

		//exit;

		$bsn_id = $fwRequest->getParam('bsn_id', '');
		$table_ppd = new Fw_Db_Table('progress_payment_detail');
		$table_ppd->setWhere('ppd_bsn_id = ' . $bsn_id);
		$prog_pay =  $table_ppd->getRows();

		foreach ($prog_pay as $pk => $pv) {


			$d1 = date('Y-m-d');
			$d2 = changedate_y_m_d($pv['ppd_inv_due_date']);
			$d3 = changedate_y_m_d(trim($pv['ppd_when_payrec']));

			if (!empty($d2)) {
				$dayscount = daysDifference($d1, $d2);
				$prog_pay[$pk]['days_late'] = $dayscount;
			}

			if (!empty($d2) && !empty($d3)) {
				$dayscount = daysDifference($d3, $d2);
				$prog_pay[$pk]['days_late'] = $dayscount;
			}


			// if (!empty($d2) && empty($d3)) {

			// 	$dayscount = daysDifference($d1, $d2);
			// 	$prog_pay[$pk]['days_late'] = $dayscount;
			// } else if (!empty($d2) && !empty($d3)) {

			// 	$dayscount = daysDifference($d3, $d2);
			// 	$prog_val[$pk]['days_late'] = $dayscount;
			// }
		}


		$fwViewData['progress_payment_detail'] =  $prog_pay;

		$totaled = 0;
		$totaled_hia = 0;
		foreach ($prog_pay as $ppk2 => $ppv2) {
			$v11 = str_replace("$", '', $ppv2['ppd_value']);
			$v22 = str_replace(",", '', $v11);

			if (empty($v22)) {
				$v22 = 0;
			}

			$totaled = $totaled + $v22;

			$v33 = str_replace("$", '', $ppv2['ppd_hia_value']);
			$v44 = str_replace(",", '', $v33);
			if (empty($v44)) {
				$v44 = 0;
			}

			$totaled_hia = $totaled_hia + $v44;
		}
		$fwViewData['total_value'] = $totaled;
		$fwViewData['total_value_hia'] = $totaled_hia;
	}



	// Save progress Payments Ends



	$tablePCT = new Fw_Db_Table('project_customer_type');
	$fwViewData['pct'] =  $tablePCT->getRows();

	$tableAutomatedReport = new Fw_Db_Table('automated_reports');
	$arDetail =  $tableAutomatedReport->getRows();
	$fwViewData['arDetail'] = $arDetail;

	$tableAR = new Fw_Db_Table('bus_automated_reports');

	foreach ($arDetail as $k => $v) {
		//db($v);
		$ard['bar_bsn_id'] = $bsn_id;
		$ard['bar_ar_id'] = $v['ar_id'];
		$ard['bar_report_name'] = $v['ar_report_name'];


		$tableAR->setWhere("bar_bsn_id=" . $bsn_id . " And bar_ar_id = " . $v['ar_id']);
		if ($tableAR->rowExists()) {
		} else {
			$tableAR->insertRow($ard);
		}
	}
	if ($bsn_id) {
		$tableAR->setWhere('bar_bsn_id = ' . $bsn_id);
		$arDetail =  $tableAR->getRows();
		$fwViewData['arDetail'] = $arDetail;
	}

	if ($bsn_id) {

		$btask = new Fw_Db_Table('business_tasks');
		$btask->setWhere('bt_bsn_id = ' . $bsn_id . ' And bt_task_id = 406');
		$taskdata  = $btask->getRow();

		if (!empty($taskdata)) {

			$btcom = $taskdata['bt_complete'];

			if ($btcom == 1) {

				$tablebar = new Fw_Db_Table('bus_automated_reports');
				$tablebar->setWhere("bar_bsn_id = " . $bsn_id . " And bar_ar_id = 1");
				$yesnoData['bar_report_yesno'] = '1';
				$tablebar->updateRow($yesnoData);
			}
		}
	}

	$submit_nr2 = $fwRequest->getParam('not_required_save_dc', '');


	//if(!empty($submit_nr2))
	//{
	$tabledcl = new Fw_Db_Table('document_check_list');
	$nrdata_dc = $fwRequest->getParam('not_required', array());

	//db($nrdata);
	//exit;

	if (!empty($nrdata_dc)) {
		foreach ($nrdata_dc as $nrd) {
			$doc_id = $nrd['doc_id'];
			if (!empty($nrd['doc_not_required'])) {
				$value1 =  1;
			} else {
				$value1 =  0;
			}
			//$tabledcl->setWhere("doc_id = ".$doc_id);
			$tabledcl->setWhere("doc_bsn_id = " . $bsn_id . " And doc_id = " . $doc_id);
			$nrdetail['doc_not_required'] =  $value1;
			$tabledcl->updateRow($nrdetail);
		}
	}

	//}


	$submit_nrt = $fwRequest->getParam('not_required_task_save', '');


	if (!empty($submit_nrt)) {
		$tablebt = new Fw_Db_Table('business_tasks');
		$nrdata_task = $fwRequest->getParam('not_required_task', array());

		foreach ($nrdata_task as $nrd_task) {
			$bt_id = $nrd_task['bt_id'];
			$nrdetail = [];
			if (!empty($nrd_task['bt_task_not_required'])) {
				$value1 =  1;
				$nrdetail['bt_completed_date'] = date('Y-m-d H:i:s');
			} else {
				$value1 =  0;
			}
			$tablebt->setWhere("bt_id = " . $bt_id);
			$nrdetail['bt_task_not_required'] =  $value1;
			$tablebt->updateRow($nrdetail);
		}
	}



	$submit_nr_mini = $fwRequest->getParam('not_required_save', '');

	if (!empty($submit_nr_mini)) {
		$tabledcl = new Fw_Db_Table('document_check_list_mini');
		$tabledc2 = new Fw_Db_Table('custom_document_check_list_mini');
		$nrdata = $fwRequest->getParam('not_required', array());
		$nrdatacustom = $fwRequest->getParam('not_required_custom', array());

		if (!empty($nrdata)) {

			foreach ($nrdata as $nrd) {
				$doc_id = $nrd['doc_id'];
				if (!empty($nrd['doc_not_required'])) {
					$value1 =  1;
				} else {
					$value1 =  0;
				}
				$tabledcl->setWhere("doc_bsn_id = " . $bsn_id . " And doc_id = " . $doc_id);
				$nrdetail['doc_not_required'] =  $value1;
				$nrdetail['doc_cust_www'] = $nrd['cwww'];
				$tabledcl->updateRow($nrdetail);
			}
		}

		if (!empty($nrdatacustom)) {
			// db($nrdatacustom, 'nrdatacustom');
			foreach ($nrdatacustom as $nrd2) {
				if (isset($nrd2['cdc_id'])) {
					$cdc_id = $nrd2['cdc_id'];
					if (!empty($nrd2['cdc_not_required'])) {
						$value1 =  1;
					} else {
						$value1 =  0;
					}
					$tabledc2->setWhere("cdc_bsn_id = " . $bsn_id . " And cdc_id = " . $cdc_id);
					$nrdetail2['cdc_not_required'] =  $value1;
					$nrdetail2['cdc_cust_www'] = $nrd2['cwww'] ?? 0;
					// echo "working 1001"; die();
					$tabledc2->updateRow($nrdetail2);
				}
			}
		}
	}


	$submit_nr_reno = $fwRequest->getParam('not_required_save_reno', '');

	if (!empty($submit_nr_reno)) {
		$tabledcl = new Fw_Db_Table('document_check_list_renovation');
		$tabledc2 = new Fw_Db_Table('custom_document_check_list_renovation');
		$nrdata = $fwRequest->getParam('not_required', array());
		$nrdatacustom = $fwRequest->getParam('not_required_custom', array());

		if (!empty($nrdata)) {

			foreach ($nrdata as $nrd) {
				$doc_id = $nrd['doc_id'];
				if (!empty($nrd['doc_not_required'])) {
					$value1 =  1;
				} else {
					$value1 =  0;
				}
				$tabledcl->setWhere("doc_bsn_id = " . $bsn_id . " And doc_id = " . $doc_id);
				$nrdetail['doc_not_required'] =  $value1;
				$nrdetail['doc_cust_www'] = $nrd['cwww'];
				$tabledcl->updateRow($nrdetail);
			}
		}

		if (!empty($nrdatacustom)) {

			foreach ($nrdatacustom as $nrd2) {
				$cdc_id = $nrd2['cdc_id'];
				if (!empty($nrd2['cdc_not_required'])) {
					$value1 =  1;
				} else {
					$value1 =  0;
				}
				$tabledc2->setWhere("cdc_bsn_id = " . $bsn_id . " And cdc_id = " . $cdc_id);
				$nrdetail2['cdc_not_required'] =  $value1;
				$nrdetail2['cdc_cust_www'] = $nrd2['cwww'];
				$tabledc2->updateRow($nrdetail2);
			}
		}
	}

	$submit_finance = $fwRequest->getParam('not_required_www_update', '');

	if (!empty($submit_finance)) {
		$tabledcl = new Fw_Db_Table('document_check_list_finance');
		$nrdata = $fwRequest->getParam('not_required', array());

		if (!empty($nrdata)) {

			foreach ($nrdata as $nrd) {
				$doc_id = $nrd['doc_id'];
				if (!empty($nrd['doc_not_required'])) {
					$value1 =  1;
				} else {
					$value1 =  0;
				}
				$tabledcl->setWhere("doc_bsn_id = " . $bsn_id . " And doc_id = " . $doc_id);
				$nrdetail['doc_not_required'] =  $value1;
				$nrdetail['doc_cust_www'] = $nrd['cwww'];

				$nrdetail['doc_cover_letter'] = $nrd['doc_cover_letter'];
				$nrdetail['doc_cover_letter_date'] = $nrd['doc_cover_letter_date'];

				$nrdetail['doc_emailed_client'] = $nrd['doc_emailed_client'];
				$nrdetail['doc_emailed_client_date'] = $nrd['doc_emailed_client_date'];

				$nrdetail['doc_posted_client'] = $nrd['doc_posted_client'];
				$nrdetail['doc_posted_client_date'] = $nrd['doc_posted_client_date'];

				$nrdetail['doc_qed'] = $nrd['doc_qed'];

				$tabledcl->updateRow($nrdetail);
			}
		}

		echo "<script> javascript:requestDocumentCheckListFinancial('add'); </script>";
	}

	//
	$submit_update_finance = $fwRequest->getParam('update_checklist', '');

	if (!empty($submit_update_finance)) {
		$tablebdf = new Fw_Db_Table('business_documents_finance');
		$bdf_data = $fwRequest->getParam('finance', array());

		//db($bdf_data);
		//exit;

		$user_name = $_SESSION['user']['user_name'];

		if (!empty($bdf_data)) {

			foreach ($bdf_data as $nrd) {
				$bd_id = $nrd['bd_id'];

				$tablebdf->setWhere("bd_bsi_id = " . $bsn_id . " And bd_id = " . $bd_id);
				$bdf_data  = $tablebdf->getRow();

				//db($bdf_data);

				$nrdetail['bd_cover_letter'] = $nrd['bd_cover_letter'];

				if ($nrd['bd_cover_letter'] == 1) {
					$nrdetail['bd_cover_letter_date'] = $nrd['bd_cover_letter_date'];
					if (empty($bdf_data['bd_cover_user'])) {
						$nrdetail['bd_cover_user'] = $user_name;
					}
				} else {
					$nrdetail['bd_cover_letter_date'] = '';
					$nrdetail['bd_cover_user'] = '';
				}

				$nrdetail['bd_emailed_client'] = $nrd['bd_emailed_client'];

				if ($nrd['bd_emailed_client'] == 1) {
					$nrdetail['bd_emailed_client_date'] = $nrd['bd_emailed_client_date'];
					if (empty($bdf_data['bd_emailed_user'])) {
						$nrdetail['bd_emailed_user'] = $user_name;
					}
				} else {
					$nrdetail['bd_emailed_client_date'] = '';
					$nrdetail['bd_emailed_user'] = '';
				}

				$nrdetail['bd_posted_client'] = $nrd['bd_posted_client'];

				if ($nrd['bd_posted_client'] == 1) {
					$nrdetail['bd_posted_client_date'] = $nrd['bd_posted_client_date'];
					if (empty($bdf_data['bd_posted_user'])) {
						$nrdetail['bd_posted_user'] = $user_name;
					}
				} else {
					$nrdetail['bd_posted_client_date'] = '';
					$nrdetail['bd_posted_user'] = '';
				}

				$nrdetail['bd_www'] = $nrd['bd_www'];
				$nrdetail['bd_qed'] = $nrd['bd_qed'];



				$tablebdf->updateRow($nrdetail);
			}
		}

		echo "<script> javascript:iframeRequest(6,''); </script>";
	}



	//




	$tablenmsubmit = $fwRequest->getParam('table_name', '');

	$fwViewData['bsnid'] = $fwRequest->getParam('bsn_id', '');

	if (!empty($tablenmsubmit)) {
		$prnametable = new Fw_Db_Table('document_proposal_name');
		$pro_name_data = $fwRequest->getParam('proposal', array());



		if ($pro_name_data['dpn_add_to_er'] == 1) {
			$prnametable->setWhere("dpn_add_to_er = 1  and dpn_bsn_id = " . $pro_name_data['dpn_bsn_id'] . " And dpn_proposal_number = " . $pro_name_data['dpn_proposal_number']);
			if (!$prnametable->rowExists()) {
				$pro_name_data['dpn_add_to_er_date'] = date('d-m-Y');
			}
		}


		$prnametable->setWhere('dpn_bsn_id = ' . $pro_name_data['dpn_bsn_id'] . " And dpn_proposal_number = " . $pro_name_data['dpn_proposal_number']);
		if ($prnametable->rowExists()) {
			$prnametable->updateRow($pro_name_data);
		} else {
			$prnametable->insertRow($pro_name_data);
		}


		echo "<script type='text/javascript'>requestDocumentCheckListMini();</script>";
	}

	// Project Planning checklist Data Save Start
	$pp_data_submit = $fwRequest->getParam('pp_data', '');

	$fwViewData['bsnid'] = $fwRequest->getParam('bsn_id', '');

	if (!empty($pp_data_submit)) {
		$pptable = new Fw_Db_Table('project_planning_checklist_data');
		$pp_data = $fwRequest->getParam('pp', array());

		$pp_data['pd_date'] = date('d-m-Y');
		$pp_data['pd_user'] = $_SESSION['user']['user_name'];

		$pptable->setWhere('pd_bsn_id = ' . $pp_data['pd_bsn_id']);
		if ($pptable->rowExists()) {
			$pptable->updateRow($pp_data);
		} else {
			$pptable->insertRow($pp_data);
		}


		echo "<script type='text/javascript'>requestPPCheckList();</script>";
	}

	// Project Planning checklist Data Save Ends

	$tablenmsubmitreno = $fwRequest->getParam('table_name_renovation', '');

	$fwViewData['bsnid'] = $fwRequest->getParam('bsn_id', '');

	if (!empty($tablenmsubmitreno)) {
		$prnametableReno = new Fw_Db_Table('document_renovation_name');
		$pro_name_data_reno = $fwRequest->getParam('renovation', array());


		$prnametableReno->setWhere('dpn_bsn_id = ' . $pro_name_data_reno['dpn_bsn_id'] . " And dpn_proposal_number = " . $pro_name_data_reno['dpn_proposal_number']);
		if ($prnametableReno->rowExists()) {
			$prnametableReno->updateRow($pro_name_data_reno);
		} else {
			$prnametableReno->insertRow($pro_name_data_reno);
		}


		echo "<script type='text/javascript'>requestDocumentCheckListRenovation();</script>";
	}




	$submitvideo = $fwRequest->getParam('subAddDetailVideo', '');


	if (!empty($submitvideo)) {
		$tablevideo = new Fw_Db_Table('video_links');
		$vdata['vl_video_link'] =  $fwRequest->getParam('vl_video_link', '');
		$vdata['vl_bsn_id'] =  $fwRequest->getParam('vl_bsn_id', '');

		$tablevideo->insertRow($vdata);
	}

	if ($bsn_id) {
		$fwViewData['bsn_id'] = $fwRequest->getParam('bsn_id', '');
		$tablevideo = new Fw_Db_Table('video_links');
		$tablevideo->setWhere("vl_bsn_id =" . $bsn_id);
		$fwViewData['video_detail'] = $tablevideo->getRows();
	}

	if ($bsn_id) {
		$counttable = new Fw_Db_Table('document_check_list_mini_count');
		$counttable->setWhere("dcnt_bsn_id =" . $bsn_id);
		$countdata = $counttable->getRow();

		if (!empty($countdata['dcnt_counter'])) {
			$fwViewData['pc_count'] = $countdata['dcnt_counter'];
		} else {
			$fwViewData['pc_count'] = 0;
		}
	}


	if ($bsn_id) {
		$counttable = new Fw_Db_Table('document_check_list_renovation_count');
		$counttable->setWhere("dcnt_bsn_id =" . $bsn_id);
		$countdata = $counttable->getRow();

		if (!empty($countdata['dcnt_counter'])) {
			$fwViewData['pc_count_reno'] = $countdata['dcnt_counter'];
		} else {
			$fwViewData['pc_count_reno'] = 0;
		}
	}









	if ($bsn_id > 0) {
		$fwViewData['bid'] = $bsn_id;
	} else {
		$fwViewData['bid'] = 0;
	}

	$fwViewData['name'] = "Testing";

	if ($bsn_id > 0) {
		$sql_alert = "select count(*) as total from business_alert where be_business_id = " . $bsn_id . " And be_alert_active = 'Yes' ";
		$alert_data = $fwDb->queryOne($sql_alert);
		$fwViewData['alert_data'] = $alert_data;
	}

	$submit_story = $fwRequest->getParam('sales_story', '');

	if (!empty($submit_story)) {

		$detail = $fwRequest->getParam($TABLE, array());

		$storyData['bsn_project_story'] = $detail['bsn_project_story'];

		$table->setWhere("bsn_id =" . $bsn_id);
		$table->updateRow($storyData);

		$sqlst = "SELECT " . $TABLE . ".* FROM " . $TABLE . " WHERE " . $TABLE . ".$ID = $bsn_id";
		$fwViewData['detail'] = $fwDb->queryOne($sqlst);
	}


	$sqlpsc = "select * from process_street_checklist";
	$fwViewData['pro_street_checklist'] = $fwDb->query($sqlpsc);

	$hide = $fwRequest->getParam('hide', '');

	if ($hide) {
		$potable = new Fw_Db_Table('purchase_order');
		foreach ($hide as $k => $v) {
			$id = $k;
		}

		$po_detail['po_relevant'] = $v;
		$potable->setWhere("po_id = " . $id);
		if ($potable->rowExists()) {
			$this_id = $potable->updateRow($po_detail);
		}
		$fwViewData['rele'] = 1;
	}

	$hide_custom = $fwRequest->getParam('hide_custom', '');

	if ($hide_custom) {
		$pocustomtable = new Fw_Db_Table('purchase_order_custom');
		foreach ($hide_custom as $k => $v) {
			$id = $k;
		}

		$po_detail['po_relevant'] = $v;
		$pocustomtable->setWhere("po_id = " . $id);
		if ($pocustomtable->rowExists()) {
			$this_id = $pocustomtable->updateRow($po_detail);
		}
		$fwViewData['rele'] = 1;
	}



	$accepted = $fwRequest->getParam('accepted', '');

	if ($accepted) {

		$uname = $_SESSION['user']['user_name'];

		$potable = new Fw_Db_Table('purchase_order');
		foreach ($accepted as $k => $v) {
			$id = $k;
		}

		$po_detail['po_quote_accepted'] = $v;
		$po_detail['po_acceptance_date'] = date('d-m-Y');
		$po_detail['po_user_name'] = $uname;
		$potable->setWhere("po_id = " . $id);
		if ($potable->rowExists()) {
			$this_id = $potable->updateRow($po_detail);
		}
	}


	$accepted_c = $fwRequest->getParam('accepted_c', '');

	if ($accepted_c) {
		$uname = $_SESSION['user']['user_name'];
		$potable_custom = new Fw_Db_Table('purchase_order_custom');
		foreach ($accepted_c as $k => $v) {
			$id = $k;
		}

		$po_detail['po_quote_accepted'] = $v;
		$po_detail['po_acceptance_date'] = date('d-m-Y');
		$po_detail['po_user_name'] = $uname;
		$potable_custom->setWhere("po_id = " . $id);
		if ($potable_custom->rowExists()) {
			$this_id = $potable_custom->updateRow($po_detail);
		}
	}


	//-------- For Project Purchase Order ------------ //
	if ($bsn_id > 0) {
		$pagenum = $fwRequest->getparam('pagenum', '');
		$keyword = $fwRequest->getParam('keyword', '');



		$where = " WHERE  purchase_order.po_bsn_id = " . $bsn_id . " AND ( purchase_order.po_quote_accepted > 0 OR length(purchase_order.po_component_name) > 0 )";
		$where2 = " WHERE purchase_order_custom.po_bsn_id = " . $bsn_id . " AND purchase_order_custom.po_quote_accepted > 0 ";
		$fwViewData['ran'] =  rand(100000, 999999);

		$TABLE = 'purchase_order';

		if ($keyword):
			$where .= " AND ( business.bsn_address LIKE '%" . $keyword . "%'
				OR purchase_order.po_accepted_supplier LIKE '%" . $keyword . "%' )";

			$_SESSION['keyword'] = $keyword;
			$fwViewData['keyword'] = $_SESSION['keyword'];

		elseif ($_SESSION['keyword'] && $pagenum > 0):

			$where .= " AND (business.bsn_address.bsn_address LIKE '%" . $_SESSION['keyword'] . "%' 
				OR purchase_order.po_accepted_supplier LIKE '%" . $_SESSION['keyword'] . "%') ";

			$fwViewData['keyword'] = $_SESSION['keyword'];
		endif;



		if ($keyword):
			$where2 .= " AND ( business.bsn_address LIKE '%" . $keyword . "%'
				OR purchase_order_custom.po_accepted_supplier LIKE '%" . $keyword . "%' )";

			$_SESSION['keyword'] = $keyword;
			$fwViewData['keyword'] = $_SESSION['keyword'];

		elseif ($_SESSION['keyword'] && $pagenum > 0):

			$where2 .= " AND (business.bsn_address.bsn_address LIKE '%" . $_SESSION['keyword'] . "%' 
				OR purchase_order_custom.po_accepted_supplier LIKE '%" . $_SESSION['keyword'] . "%') ";

			$fwViewData['keyword'] = $_SESSION['keyword'];
		endif;



		if (empty($pagenum)) {
			unset($_SESSION['last_tdsql']);
		}

		$sql = "SELECT  business.bsn_id, business.bsn_address, purchase_order.*   from purchase_order 		
		Inner Join business ON purchase_order.po_bsn_id =  business.bsn_id 
		" . $where;


		$userData = $fwDb->query($sql);


		$k2 = count($userData);

		$sql_custom = "SELECT  business.bsn_id, business.bsn_address, purchase_order_custom.*   from purchase_order_custom 		
			Inner Join business ON purchase_order_custom.po_bsn_id =  business.bsn_id 
			" . $where2;

		$customData = $fwDb->query($sql_custom);


		if (!empty($userData)) {
			if (!(isset($pagenum))) {
				$pagenum = 1;
			}

			$rows = count($userData);

			$page_rows = 3;
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



			$setdata = $fwDb->query($sql2);
		}

		if (!empty($setdata)) {
			foreach ($setdata as $k => $v) {
				$sqla = "Select poincc_component.pc_name from poincc_component
					where poincc_component.pc_id = " . $v['po_component_id'];
				$data = $fwDb->queryOne($sqla);

				$setdata2[$k]['po_id'] = $v['po_id'];
				$setdata2[$k]['bsn_id'] = $v['bsn_id'];
				$setdata2[$k]['bsn_address'] = $v['bsn_address'];
				$setdata2[$k]['pc_name'] = $data['pc_name'];
				$setdata2[$k]['po_supplier1'] = $v['po_supplier1'];
				$setdata2[$k]['po_quote1_accepted'] = $v['po_quote_accepted'];
				$setdata2[$k]['po_quote1'] = $v['po_quote1'];
				$setdata2[$k]['po_value1'] = $v['po_value1'];

				$setdata2[$k]['po_alert'] = $v['po_alert'];

				$setdata2[$k]['po_sent_date'] = changedate_d_m_y($v['po_sent_date']);
				$setdata2[$k]['po_upload_date'] = changedate_d_m_y($v['po_upload_date']);
				$setdata2[$k]['po_linked_quote'] = $v['po_linked_quote'];
				$setdata2[$k]['po_component_name'] = $v['po_component_name'];
				$setdata2[$k]['po_purchase_order'] = $v['po_purchase_order'];

				$setdata2[$k]['po'] = 1;
			}
		}
		if (!empty($setdata)) {
			$k = $k + 1;
		} else {
			$k = 0;
		}


		foreach ($customData as $kc => $vc) {
			$setdata2[$kc + $k]['po_id'] = $vc['po_id'];
			$setdata2[$kc + $k]['bsn_id'] = $vc['bsn_id'];
			$setdata2[$kc + $k]['bsn_address'] = $vc['bsn_address'];
			$setdata2[$kc + $k]['pc_name'] = $vc['po_component_name'];
			$setdata2[$kc + $k]['po_supplier1'] = $vc['po_supplier1'];
			$setdata2[$kc + $k]['po_quote_accepted'] = $vc['po_quote_accepted'];
			$setdata2[$kc + $k]['po_quote1'] = $vc['po_quote1'];

			$setdata2[$kc + $k]['po_value1'] = $vc['po_value1'];
			$setdata2[$kc + $k]['po'] = 2;
		}
	}

	$fwViewData['proj_po_list'] =  $setdata2;

	$fwViewData['current_date'] = date('Y-m-d');
	$fwViewData['titlepo'] = "Purchase Order";


	if ($bsn_id > 0) {

		$sql_atocpr = "Select bsn_id, bsn_showin_cpr from business where bsn_id = " . $bsn_id;
		$data_addtocpr = $fwDb->queryOne($sql_atocpr);
		$fwViewData['bsn_showin_cpr'] = $data_addtocpr['bsn_showin_cpr'];
		$fwViewData['businessid'] = $data_addtocpr['bsn_id'];

		$report1 = new Fw_Db_Table('report_proposal_checklist');
		$report1->setWhere("re_bsn_id = " . $bsn_id);
		$rpc = $report1->getRow();
		if (!empty($rpc)) {
			$fwViewData['rpc'] = 1;
		}

		$report2 = new Fw_Db_Table('report_planning_assessment_quick');
		$report2->setWhere("re_bsn_id = " . $bsn_id);
		$rpaq = $report2->getRow();
		if (!empty($rpaq)) {
			$fwViewData['rpaq'] = 1;
		}

		$report3 = new Fw_Db_Table('report_design');
		$report3->setWhere("re_bsn_id = " . $bsn_id);
		$rd = $report3->getRow();
		if (!empty($rd)) {
			$fwViewData['rd'] = 1;
		}

		$report4 = new Fw_Db_Table('report_construction_pipeline');
		$report4->setWhere("re_bsn_id = " . $bsn_id);
		$rcp = $report4->getRow();
		if (!empty($rcp)) {
			$fwViewData['rcp'] = 1;
		}

		$report5 = new Fw_Db_Table('report_complete');
		$report5->setWhere("re_bsn_id = " . $bsn_id);
		$rc = $report5->getRow();
		if (!empty($rc)) {
			$fwViewData['rc'] = 1;
		}

		$report6 = new Fw_Db_Table('report_inclusion');
		$report6->setWhere("re_bsn_id = " . $bsn_id);
		$ri = $report6->getRow();
		if (!empty($ri)) {
			$fwViewData['ri'] = 1;
		}

		$report7 = new Fw_Db_Table('report_inclusion_task_tracker');
		$report7->setWhere("re_bsn_id = " . $bsn_id);
		$ritt = $report7->getRow();
		if (!empty($ritt)) {
			$fwViewData['ritt'] = 1;
		}

		$report8 = new Fw_Db_Table('report_planning_progress');
		$report8->setWhere("re_bsn_id = " . $bsn_id);
		$rpp = $report8->getRow();
		if (!empty($rpp)) {
			$fwViewData['rpp'] = 1;
		}

		$report9 = new Fw_Db_Table('report_planning_task_tracker');
		$report9->setWhere("re_bsn_id = " . $bsn_id);
		$rptt = $report9->getRow();
		if (!empty($rptt)) {
			$fwViewData['rptt'] = 1;
		}

		$report10 = new Fw_Db_Table('report_proposal_control_panel');
		$report10->setWhere("re_bsn_id = " . $bsn_id);
		$rpcp = $report10->getRow();
		if (!empty($rpcp)) {
			$fwViewData['rpcp'] = 1;
		}

		$report11 = new Fw_Db_Table('report_construction_task_tracker');
		$report11->setWhere("re_bsn_id = " . $bsn_id);
		$rctt = $report11->getRow();
		if (!empty($rctt)) {
			$fwViewData['rctt'] = 1;
		}

		$report12 = new Fw_Db_Table('report_construction');
		$report12->setWhere("re_bsn_id = " . $bsn_id);
		$rcons = $report12->getRow();
		if (!empty($rcons)) {
			$fwViewData['rcons'] = 1;
		}

		$report13 = new Fw_Db_Table('report_post_par');
		$report13->setWhere("re_bsn_id = " . $bsn_id);
		$rpopar = $report13->getRow();
		if (!empty($rpopar)) {
			$fwViewData['rpopar'] = 1;
		}

		$report14 = new Fw_Db_Table('report_design_take_off');
		$report14->setWhere("re_bsn_id = " . $bsn_id);
		$rdto = $report14->getRow();
		if (!empty($rdto)) {
			$fwViewData['rdto'] = 1;
		}

		$report15 = new Fw_Db_Table('report_project_plans');
		$report15->setWhere("re_bsn_id = " . $bsn_id);
		$rplans = $report15->getRow();
		if (!empty($rplans)) {
			$fwViewData['rplans'] = 1;
		}
	}



	$close = $fwRequest->getParam('close', '');
	if ($close) {
		$tableTT = new Fw_Db_Table('time_tracker');

		$key = array_keys($close);
		$ky = $key[0];

		$ttDetail['tt_hide'] = $close[$ky];

		$tableTT->setWhere('tt_id = ' . $ky);
		$detail = $tableTT->updateRow($ttDetail);
	}

	//echo "<pre>"; print_r($detail); exit('checking');

	$pro_name_data2 = $fwRequest->getParam('proposal', array());
	if (!empty($pro_name_data2)) {

		$prnametable = new Fw_Db_Table('document_proposal_name');
		$pro_name_data = $fwRequest->getParam('proposal', array());

		$prnametable->setWhere('dpn_bsn_id = ' . $pro_name_data2['dpn_bsn_id'] . " And dpn_proposal_number = " . $pro_name_data2['dpn_proposal_number']);
		if ($prnametable->rowExists()) {
			$prnametable->updateRow($pro_name_data);
		} else {
			$prnametable->insertRow($pro_name_data);
		}


		echo "<script type='text/javascript'>requestDocumentCheckListMini();</script>";
	}
}


