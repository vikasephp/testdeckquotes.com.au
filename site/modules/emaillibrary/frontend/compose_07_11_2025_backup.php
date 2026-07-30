<?php
//get the current limit
$memlimit = ini_get('memory_limit');
//set it to something else
ini_set("memory_limit", "4098M");
ini_set('max_execution_time', 0);

$tableEmailLibrary = new Fw_Db_Table('emaillibrary');
$fwViewData['emlibDetail'] =  $tableEmailLibrary->getRows();
$tableBusiness = new Fw_Db_Table('business');
$fwViewData['projdetail'] =  $tableBusiness->getRows();


$tableContact = new Fw_Db_Table('contacts');

$fwViewData['contactdetail'] =  $tableContact->getRows();

$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status_date from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id";


$fwViewData['projdetail2'] = $fwDb->query($sql);

$submit = $fwRequest->getParam('eml_id', '');

$submit2 = $fwRequest->getParam('send', '');
$submit3 = $fwRequest->getParam('draft', '');

if (!empty($submit)) {


	$prda = $fwRequest->getParam('projname1', 0);

	$s = explode('|', $prda);
	$su  = $s[1];
	//$su = str_replace('Customer Granny Flat -', '', $su);

	$fwViewData['p_c_name'] = $prda;
	if ($fwViewData['p_c_name'] == 0) {
		$fwViewData['p_c_name'] = '';
	}
	$prda = explode("|", $prda);
	$bsnid =  $prda[0];
	$fwViewData['bsnid'] = $bsnid;


	$id = $fwRequest->getParam('eml_id', '');


	$fwViewData['tid'] = $id;

	$tableEmailLibrary = new Fw_Db_Table('emaillibrary');
	$tableEmailLibrary->setWhere("eml_id = " . $id);
	$emldata =  $tableEmailLibrary->getRow();


	$fwViewData['subject'] = stripslashes($emldata['eml_subject']) . ' - ' . stripslashes($su) . ' (' . $emldata['eml_code'] . ')';

	$fwViewData['templ'] = explode("|", $emldata['eml_temp_docs']);

	$sql2  = "Select bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, 
	          bus_customers.bcust_misc_email1, bcust_misc_email2, bcust_misc_moble, business_sellers.bs_email_salutation from business_sellers 
			  Inner Join bus_customers on business_sellers.bs_customers_id  = bus_customers.bcust_id 
			  where bs_business_id  = " . $bsnid;
	$custdata = $fwDb->queryOne($sql2);

	$sql30 = "select bsn_cd_block, bsn_suburb, bsn_cd_section, bsn_address from business where bsn_id = " . $bsnid;
	$bsdata = $fwDb->queryOne($sql30);

	$sqldes = "SELECT prd_name FROM person_responsible_detail WHERE  prd_bsn_id =" . $bsnid . " AND prd_position = 'Designer'";
	$desdata = $fwDb->queryOne($sqldes);


	$emldata['eml_email_content'] = str_replace("[first name]", $custdata['bcust_fname'], $emldata['eml_email_content']);
	$emldata['eml_email_content'] = str_replace("[last name]", $custdata['bcust_lname'], $emldata['eml_email_content']);
	$emldata['eml_email_content'] = str_replace("[mobile]", $custdata['bcust_misc_moble'], $emldata['eml_email_content']);
	$emldata['eml_email_content'] = str_replace("[block]", $bsdata['bsn_cd_block'], $emldata['eml_email_content']);
	$emldata['eml_email_content'] = str_replace("[section]", $bsdata['bsn_cd_section'], $emldata['eml_email_content']);
	$emldata['eml_email_content'] = str_replace("[suburb]", $bsdata['bsn_suburb'], $emldata['eml_email_content']);
	$emldata['eml_email_content'] = str_replace("[address]", $bsdata['bsn_address'], $emldata['eml_email_content']);

	$emldata['eml_email_content'] = str_replace("[designer]", $desdata['prd_name'], $emldata['eml_email_content']);
	//$emldata['eml_email_content'] = str_replace("[Email Salutation]", $custdata['bs_email_salutation'], $emldata['eml_email_content']);


	$fwViewData['emldata'] =  $emldata;

	$sqlSign = "Select * from email_signature ";
	$fwViewData['signature'] = $fwDb->query($sqlSign);

	$fwViewData['msg'] = "submitted";


	if (!empty($bsnid)) {
		$sql = "SELECT admin_document_check_list.admin_doc_name, document_check_list.doc_file_name FROM admin_document_check_list
			Inner Join document_check_list on admin_document_check_list.admin_doc_id = doc_name_id 		
			WHERE document_check_list.doc_bsn_id = " . $bsnid . " And document_check_list.doc_file_name != '' ";

		$fwViewData['docdata'] = $fwDb->query($sql);
	}

	$sqltdocs = "Select template_docs.dh_title, template_hub_docs.dhd_name2 from template_docs
	             Inner Join template_hub_docs On template_docs.dh_uid = template_hub_docs.dhd_dh_id
				 Order By template_docs.dh_uid";

	$fwViewData['templatedocs'] = $fwDb->query($sqltdocs);
}

if (!empty($submit2)) {
	require_once(LIB_DIR . 'EmailClass.php');
	$emailObj = new EmailClass;

	$detail = $fwRequest->getParam('emailData', array());

	$bsn_id = $fwRequest->getParam('projname', 0);

	$sdata = $fwRequest->getParam('projname1', array());
	$sdata = explode("|", $sdata);
	$bsn_id =  $sdata[0];

	//$detail['bsn_emcontent'] = str_replace("[Email Salutation]", $detail['emailsalutation'], $detail['bsn_emcontent']);	

	$emldata['eml_email_content'] = $detail['bsn_emcontent'];
	$fwViewData['emldata'] =  $emldata;
	$fwViewData['sign'] = $detail['eml_signarure_block'];

	$sqlSign = "Select * from email_signature where es_id =" . $detail['eml_signarure_block'];
	$signature = $fwDb->query($sqlSign);


	$sqlB  = "Select business.bsn_name from business where business.bsn_id  = " . $bsn_id;
	$busdetail = $fwDb->queryOne($sqlB);

	$id = $fwRequest->getParam('eml_template', 0);
	$fwViewData['tid'] = $id;

	$sqlC  = "Select emaillibrary.eml_code, eml_temp_docs from emaillibrary where emaillibrary.eml_id  = " . $id;
	$emldetail = $fwDb->queryOne($sqlC);

	//$tempdocs = explode("|", $emldetail['eml_temp_docs']);
	$tempdocs = $detail['template_docs'];
	$tempdocs1 = $detail['template_docs1'];

	if (!empty($detail['bsn_document1'])) {
		foreach ($detail['bsn_document1'] as $k => $v) {
			if ($v) {
				$data = explode("|", $v);

				$source = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/" . $data[0];
				$destination = BASE_DIR . FILE_PATH . "files/manoj/" . $data[0];
				$source = get_file_data($data[0]);

				copy($source, $destination);
				$finalatta = BASE_URL . FILE_PATH . "files/manoj/" . $data[0];
				$file = BASE_DIR . FILE_PATH . "files/manoj/" . $data[0];

				//	exit('work under progress');

				if (file_exists($file)) {
					$fdata[] = $finalatta;
					$doclogattach[] = $data[0];
				}
			}
		}
	}



	if (!empty($tempdocs)) {
		foreach ($tempdocs as $k1 => $v1) {
			if ($v1) {
				$docsattach = BASE_URL . FILE_PATH . "files/template_documents_hub/" . $v1;
				$file = BASE_DIR . FILE_PATH . "files/template_documents_hub/" . $v1;
				if (file_exists($file)) {
					$fdata[] = $docsattach;
					$templogattach[] = $v1;
				}
			}
		}
	}

	if (!empty($tempdocs1)) {
		foreach ($tempdocs1 as $k1 => $v1) {
			if ($v1) {
				$docsattach = BASE_URL . FILE_PATH . "files/template_documents_hub/" . $v1;
				$file = BASE_DIR . FILE_PATH . "files/template_documents_hub/" . $v1;
				if (file_exists($file)) {
					$fdata[] = $docsattach;
					$templogattach1[] = $v1;
				}
			}
		}
	}


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
		move_uploaded_file($src2, $destination2);
		$attach2 =  BASE_URL . FILE_PATH . "files/email_attachment/" . $file_name2;
	}

	if ($_FILES['docs3']['name']) {
		$file_name3 = $_FILES['docs3']['name'];
		$src3 = $_FILES['docs3']['tmp_name'];
		$destination3 = BASE_DIR . 'files/email_attachment/' . $file_name3;
		move_uploaded_file($src3, $destination3);
		$attach3 =  BASE_URL . FILE_PATH . "files/email_attachment/" . $file_name3;
	}

	if ($_FILES['image1']['name']) {
		$file_name4 = $_FILES['image1']['name'];
		$src4 = $_FILES['image1']['tmp_name'];
		$destination4 = BASE_DIR . 'files/email_attachment/' . $file_name4;
		move_uploaded_file($src4, $destination4);
		$imagename1 =  BASE_URL . FILE_PATH . "files/email_attachment/" . $file_name4;
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
		// $attachmentsend = serialize($fdata);
		$attachmentsend = $fdata;
	}


	$sql2  = "Select bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1, 
		      bus_customers.bcust_misc_email2, bus_customers.bcust_misc_email3, bus_customers.bcust_misc_email4, 
			  bus_customers.bcust_misc_email5 from business_sellers 
		      Inner Join bus_customers on business_sellers.bs_customers_id  = bus_customers.bcust_id 
		      where bs_business_id  = " . $bsn_id;
	$custdata = $fwDb->query($sql2);

	$to = $custdata['bcust_misc_email1'];
	$to_2 = $custdata['bcust_misc_email2'];

	$toname = $custdata['bcust_fname'] . " " . $custdata['bcust_lname'];
	$fromname = $signature[0]['es_name'];
	$from = $signature[0]['es_reply_to'];
	//$subject = $busdetail['bsn_name']." - ". $emldetail['eml_code'];

	$subject =  stripslashes($detail['subject']);
	$email_body = $detail['bsn_emcontent'];

	if ($imagename1) {
		$email_body .= "<img src='" . $imagename1 . "'>";
	}

	$email_body .= $signature[0]['es_signature'];
	if ($signature[0]['es_logo']) {
		$email_body .= "<img src='" . BASE_URL . "files/email_library/" . $signature[0]['es_logo'] . "'>";
	}

	$emailObj->subject = $subject;
	$emailObj->message = $email_body;
	$emailObj->addFrom($from, $fromname);
	$emailObj->attachments = $attachmentsend;

	if ($detail['eml_ie_email'] == 'External') {
		//	
		foreach ($custdata as $ck => $cv) {
			$to_1 = $cv['bcust_misc_email1'];
			$to_2 = $cv['bcust_misc_email2'];
			$to_3 = $cv['bcust_misc_email3'];
			$to_4 = $cv['bcust_misc_email4'];
			$to_5 = $cv['bcust_misc_email5'];

			$toname = $cv['bcust_fname'] . " " . $cv['bcust_lname'];

			$emailObj->addTo($to_1, $toname);
			// if (send_email($toname, $to_1, $fromname, $from, $subject, $email_body, $attachmentsend)) {

			$fwViewData['email_sent_ok'] = "Email has been sent successfully ";

			$logDetail['elog_eml_code'] = $emldata['eml_code'];
			$logDetail['elog_from'] = $signature[0]['es_name'];

			if (!empty($bsn_id)) {
				$logDetail['elog_bsn_id'] = $bsn_id;
			}


			if (!empty($to_2)) {
				$emailObj->addTo($to_2, $toname);
				// send_email($toname, $to_2, $fromname, $from, $subject, $email_body, $attachmentsend);
				$fwViewData['email_sent_ok'] = "Email has been sent successfully ";
			}

			if (!empty($to_3)) {
				$emailObj->addTo($to_3, $toname);
				// send_email($toname, $to_3, $fromname, $from, $subject, $email_body, $attachmentsend);
				$fwViewData['email_sent_ok'] = "Email has been sent successfully ";
			}

			if (!empty($to_4)) {
				$emailObj->addTo($to_4, $toname);
				// send_email($toname, $to_4, $fromname, $from, $subject, $email_body, $attachmentsend);
				$fwViewData['email_sent_ok'] = "Email has been sent successfully ";
			}

			if (!empty($to_5)) {
				$emailObj->addTo($to_5, $toname);
				// send_email($toname, $to_5, $fromname, $from, $subject, $email_body, $attachmentsend);
				$fwViewData['email_sent_ok'] = "Email has been sent successfully ";
			}


			if (!empty($cv['bcust_misc_email1'])) {
				$logDetail['elog_to'] = $cv['bcust_misc_email1'];
			}

			if (!empty($cv['bcust_misc_email2'])) {
				// $logDetail['elog_to_secondary'] = $cv['bcust_misc_email2'];
			}

			if (!empty($cv['bcust_misc_email3'])) {
				// $logDetail['elog_to_email3'] = $cv['bcust_misc_email3'];
			}

			if (!empty($cv['bcust_misc_email4'])) {
				// $logDetail['elog_to_email4'] = $cv['bcust_misc_email4'];
			}

			if (!empty($cv['bcust_misc_email5'])) {
				// $logDetail['elog_to_email5'] = $cv['bcust_misc_email5'];
			}

			if (!empty($subject)) {
				$logDetail['elog_subject'] = stripslashes($subject);
			}

			if (!empty($busdetail['bsn_name'])) {
				$logDetail['elog_business'] = $busdetail['bsn_name'];
			}



			$tedoc = '';
			if (!empty($doclogattach)) {
				$logDetail['elog_doc_attached'] = implode(", ", $doclogattach);
			}


			if (!empty($templogattach)) {
				$tedoc .= implode(", ", $templogattach);
			}
			if (!empty($templogattach1)) {
				$tedoc .= ",";
				$tedoc .= implode(", ", $templogattach1);
			}

			if (!empty($tedoc)) {
				$logDetail['elog_temp_attached'] = $tedoc;
			}

			if (!empty($file_name4)) {
				$logDetail['elog_image'] = $file_name4;
			}


			if (!empty($file_name1)) {
				$logDetail['elog_attachment1'] = $file_name1;
			}
			if (!empty($file_name2)) {
				$logDetail['elog_attachment2'] = $file_name2;
			}
			if (!empty($file_name3)) {
				$logDetail['elog_attachment3'] = $file_name3;
			}




			$logDetail['elog_email_body'] = $email_body;

			// $email_log_Table = new Fw_Db_Table('email_log');
			// $email_log_Table->insertRow($logDetail);
			// }
		}
		//

		$arr1 = $detail['to'];
		$arr2 = explode(",", $detail['to2']);



		if (!empty($detail['to'])) {

			$todetail = $detail['to'];

			foreach ($todetail as $vto) {
				$to = trim($vto);
				$toname = "Deckquote Person";

				$toarr = explode("|", $vto);
				$to = trim($toarr[0]);
				$saluation = trim($toarr[1]);
				$email_body2 = str_replace("[Email Salutation]", $saluation, $email_body);
				$emailObj->addCC($to, $toname);
				// send_email($toname, $to, $fromname, $from, $subject, $email_body2, $attachmentsend);
			}
		}

		if (!empty($detail['to_contact_list'])) {

			$conarr = rtrim($detail['to_contact_list'], " , ");
			$conarr2 = explode(",", $conarr);

			foreach ($conarr2 as $vc) {
				$toc = trim($vc);
				$toname = "Deckquote Person";
				$email_body2 = str_replace("[Email Salutation]", 'Mate ', $email_body);

				$emailObj->addCC($toc, $toname);
				// if (send_email($toname, $toc, $fromname, $from, $subject, $email_body2, $attachmentsend)) {
				$fwViewData['email_sent_ok'] = "Email has been sent successfully ";

				$logDetail3['elog_eml_code'] = $emldata['eml_code'];
				$logDetail3['elog_from'] = $signature[0]['es_name'];

				if (!empty($bsn_id)) {
					$logDetail3['elog_bsn_id'] = $bsn_id;
				}

				$logDetail3['elog_to'] = $toc;

				if (!empty($subject)) {
					$logDetail3['elog_subject'] = stripslashes($subject);
				}

				if (!empty($busdetail['bsn_name'])) {
					$logDetail3['elog_business'] = $busdetail['bsn_name'];
				}

				if (!empty($doclogattach)) {
					$logDetail3['elog_doc_attached'] = implode(", ", $doclogattach);
				}


				$tedoc = '';
				if (!empty($templogattach)) {
					$tedoc .= implode(", ", $templogattach);
				}
				if (!empty($templogattach1)) {
					$tedoc .= ",";
					$tedoc .= implode(", ", $templogattach1);
				}

				if (!empty($tedoc)) {
					$logDetail3['elog_temp_attached'] = $tedoc;
				}

				if (!empty($file_name4)) {
					$logDetail['elog_image'] = $file_name4;
				}

				if (!empty($file_name1)) {
					$logDetail['elog_attachment1'] = $file_name1;
				}
				if (!empty($file_name2)) {
					$logDetail['elog_attachment2'] = $file_name2;
				}
				if (!empty($file_name3)) {
					$logDetail['elog_attachment3'] = $file_name3;
				}


				$logDetail3['elog_email_body'] = $email_body;

				// $email_log_Table = new Fw_Db_Table('email_log');
				// $email_log_Table->insertRow($logDetail3);
				// }
			}
		}



		if (!empty($detail['to2'])) {
			$todetail = explode(",", $detail['to2']);


			foreach ($todetail as $vto) {
				$to = trim($vto);
				$toname = "Deckquote Person";
				$saluation = "Mate ";
				$email_body2 = str_replace("[Email Salutation]", $saluation, $email_body);

				$emailObj->addCC($to, $toname);
				// if (send_email($toname, $to, $fromname, $from, $subject, $email_body2, $attachmentsend)) {
				$fwViewData['email_sent_ok'] = "Email has been sent successfully ";
				$logDetail2['elog_eml_code'] = $emldata['eml_code'];
				$logDetail2['elog_from'] = $signature[0]['es_name'];

				if (!empty($bsn_id)) {
					$logDetail2['elog_bsn_id'] = $bsn_id;
				}

				$logDetail2['elog_to'] = $to;

				if (!empty($subject)) {
					$logDetail2['elog_subject'] = stripslashes($subject);
				}

				if (!empty($busdetail['bsn_name'])) {
					$logDetail2['elog_business'] = $busdetail['bsn_name'];
				}

				if (!empty($doclogattach)) {
					$logDetail2['elog_doc_attached'] = implode(", ", $doclogattach);
				}



				$tedoc = '';
				if (!empty($templogattach)) {
					$tedoc .= implode(", ", $templogattach);
				}
				if (!empty($templogattach1)) {
					$tedoc .= ",";
					$tedoc .= implode(", ", $templogattach1);
				}

				if (!empty($tedoc)) {
					$logDetail2['elog_temp_attached'] = $tedoc;
				}

				if (!empty($file_name4)) {
					$logDetail['elog_image'] = $file_name4;
				}

				if (!empty($file_name1)) {
					$logDetail['elog_attachment1'] = $file_name1;
				}
				if (!empty($file_name2)) {
					$logDetail['elog_attachment2'] = $file_name2;
				}
				if (!empty($file_name3)) {
					$logDetail['elog_attachment3'] = $file_name3;
				}

				$logDetail2['elog_email_body'] = $email_body;

				// $email_log_Table = new Fw_Db_Table('email_log');
				// $email_log_Table->insertRow($logDetail2);
				// }
			}
		}
	} elseif ($detail['eml_ie_email'] == 'Internal') {
		if (!empty($detail['to'])) {
			//$todetail = explode(",",$detail['to']);
			$todetail = $detail['to'];

			foreach ($todetail as $vto) {
				$toname = "Deckquote Person";
				$toarr = explode("|", $vto);
				$to = trim($toarr[0]);
				$saluation = trim($toarr[1]);
				$email_body2 = str_replace("[Email Salutation]", $saluation, $email_body);

				$emailObj->addTo($to, $toname);
				// if (send_email($toname, $to, $fromname, $from, $subject, $email_body2, $attachmentsend)) {
				$logDetail['elog_eml_code'] = $emldata['eml_code'];
				$logDetail['elog_from'] = $signature[0]['es_name'];

				if (!empty($bsn_id)) {
					$logDetail['elog_bsn_id'] = $bsn_id;
				}

				$logDetail['elog_to'] = $to;

				if (!empty($subject)) {
					$logDetail['elog_subject'] = stripslashes($subject);
				}

				if (!empty($busdetail['bsn_name'])) {
					$logDetail['elog_business'] = $busdetail['bsn_name'];
				}

				if (!empty($doclogattach)) {
					$logDetail['elog_doc_attached'] = implode(", ", $doclogattach);
				}

				$tedoc = '';
				if (!empty($templogattach)) {
					$tedoc .= implode(", ", $templogattach);
				}
				if (!empty($templogattach1)) {
					$tedoc .= ",";
					$tedoc .= implode(", ", $templogattach1);
				}

				if (!empty($tedoc)) {
					$logDetail['elog_temp_attached'] = $tedoc;
				}

				if (!empty($file_name4)) {
					$logDetail['elog_image'] = $file_name4;
				}

				if (!empty($file_name1)) {
					$logDetail['elog_attachment1'] = $file_name1;
				}
				if (!empty($file_name2)) {
					$logDetail['elog_attachment2'] = $file_name2;
				}
				if (!empty($file_name3)) {
					$logDetail['elog_attachment3'] = $file_name3;
				}


				$logDetail['elog_email_body'] = $email_body;

				// $email_log_Table = new Fw_Db_Table('email_log');
				// $email_log_Table->insertRow($logDetail);
				// }
			}
		}

		//start

		if (!empty($detail['to_contact_list'])) {

			$conarr = rtrim($detail['to_contact_list'], " , ");
			$conarr2 = explode(",", $conarr);

			foreach ($conarr2 as $vc) {
				$toc = trim($vc);
				$toname = "Deckquote Person";
				$email_body2 = str_replace("[Email Salutation]", 'Mate ', $email_body);

				$emailObj->addTo($toc, $toname);
				// if (send_email($toname, $toc, $fromname, $from, $subject, $email_body2, $attachmentsend)) {
				$fwViewData['email_sent_ok'] = "Email has been sent successfully ";

				$logDetail['elog_eml_code'] = $emldata['eml_code'];
				$logDetail['elog_from'] = $signature[0]['es_name'];

				if (!empty($bsn_id)) {
					$logDetail['elog_bsn_id'] = $bsn_id;
				}

				$logDetail['elog_to'] = $toc;

				if (!empty($subject)) {
					$logDetail['elog_subject'] = stripslashes($subject);
				}

				if (!empty($busdetail['bsn_name'])) {
					$logDetail['elog_business'] = $busdetail['bsn_name'];
				}

				if (!empty($doclogattach)) {
					$logDetail['elog_doc_attached'] = implode(", ", $doclogattach);
				}


				$tedoc = '';
				if (!empty($templogattach)) {
					$tedoc .= implode(", ", $templogattach);
				}
				if (!empty($templogattach1)) {
					$tedoc .= ",";
					$tedoc .= implode(", ", $templogattach1);
				}

				if (!empty($tedoc)) {
					$logDetail['elog_temp_attached'] = $tedoc;
				}

				if (!empty($file_name4)) {
					$logDetail['elog_image'] = $file_name4;
				}

				if (!empty($file_name1)) {
					$logDetail['elog_attachment1'] = $file_name1;
				}
				if (!empty($file_name2)) {
					$logDetail['elog_attachment2'] = $file_name2;
				}
				if (!empty($file_name3)) {
					$logDetail['elog_attachment3'] = $file_name3;
				}


				$logDetail['elog_email_body'] = $email_body;

				// $email_log_Table = new Fw_Db_Table('email_log');
				// $email_log_Table->insertRow($logDetail);
				// }
			}
		}


		if (!empty($detail['to2'])) {
			$todetail = explode(",", $detail['to2']);
			//$todetail = $detail['to'];

			foreach ($todetail as $vto) {
				$toname = "Deckquote Person";
				$to = trim($vto);

				$saluation = 'Mate';
				$email_body2 = str_replace("[Email Salutation]", $saluation, $email_body);

				$emailObj->addTo($to, $toname);
				// if (send_email($toname, $to, $fromname, $from, $subject, $email_body2, $attachmentsend)) {
				$fwViewData['email_sent_ok'] = "Email has been sent successfully ";
				$logDetail2['elog_eml_code'] = $emldata['eml_code'];
				$logDetail2['elog_from'] = $signature[0]['es_name'];

				if (!empty($bsn_id)) {
					$logDetail2['elog_bsn_id'] = $bsn_id;
				}

				$logDetail2['elog_to'] = $to;

				if (!empty($subject)) {
					$logDetail2['elog_subject'] = stripslashes($subject);
				}

				if (!empty($busdetail['bsn_name'])) {
					$logDetail2['elog_business'] = $busdetail['bsn_name'];
				}

				if (!empty($doclogattach)) {
					$logDetail2['elog_doc_attached'] = implode(", ", $doclogattach);
				}

				$tedoc = '';
				if (!empty($templogattach)) {
					$tedoc .= implode(", ", $templogattach);
				}
				if (!empty($templogattach1)) {
					$tedoc .= ",";
					$tedoc .= implode(", ", $templogattach1);
				}

				if (!empty($tedoc)) {
					$logDetail2['elog_temp_attached'] = $tedoc;
				}

				if (!empty($file_name4)) {
					$logDetail['elog_image'] = $file_name4;
				}

				if (!empty($file_name1)) {
					$logDetail['elog_attachment1'] = $file_name1;
				}
				if (!empty($file_name2)) {
					$logDetail['elog_attachment2'] = $file_name2;
				}
				if (!empty($file_name3)) {
					$logDetail['elog_attachment3'] = $file_name3;
				}

				$logDetail2['elog_email_body'] = $email_body;

				// $email_log_Table = new Fw_Db_Table('email_log');
				// $email_log_Table->insertRow($logDetail2);
				// }
			}
		}

		// $response = $emailObj->sendEmail();

		// $email_log_Table = new Fw_Db_Table('email_log');
		// $email_log_Table->insertRow($logDetail);
		//end		
	}

	$logDetail['elog_from'] = implode('<br>', $emailObj->from);
	$logDetail['elog_to'] = json_encode($emailObj->to);
	$logDetail['elog_cc'] = json_encode($emailObj->cc);

	// db($emailObj->to);
	// db(implode(',', $emailObj->to));
	// db($logDetail);
	// db($emailObj);

	$response = $emailObj->sendEmail();
	if ($response['success']) {
		$fwViewData['email_sent_ok'] = "Email has been sent successfully ";
		$email_log_Table = new Fw_Db_Table('email_log');
		$email_log_Table->insertRow($logDetail);
		unset($fwViewData['email_sent_error']);
	} else {
		unset($fwViewData['email_sent_ok']);
		$fwViewData['email_sent_error'] = $response['message'];
	}
	// exit;
}


// ------ Draft Save -------------

if (!empty($submit3)) {
	$detail = $fwRequest->getParam('emailData', array());

	$bsn_id = $fwRequest->getParam('projname', 0);

	$emldata['eml_email_content'] = $detail['bsn_emcontent'];
	$fwViewData['emldata'] =  $emldata;
	$fwViewData['sign'] = $detail['eml_signarure_block'];

	$sqlSign = "Select * from email_signature where es_id =" . $detail['eml_signarure_block'];
	$signature = $fwDb->query($sqlSign);

	$sqlB  = "Select business.bsn_name from business where business.bsn_id  = " . $bsn_id;
	$busdetail = $fwDb->queryOne($sqlB);

	$id = $fwRequest->getParam('eml_template', 0);
	$fwViewData['tid'] = $id;

	$sqlC  = "Select emaillibrary.eml_code, eml_temp_docs from emaillibrary where emaillibrary.eml_id  = " . $id;
	$emldetail = $fwDb->queryOne($sqlC);

	//$tempdocs = explode("|", $emldetail['eml_temp_docs']);
	$tempdocs = $detail['template_docs'];

	if (!empty($detail['bsn_document1'])) {
		foreach ($detail['bsn_document1'] as $k => $v) {
			if ($v) {
				$data = explode("|", $v);

				//$finalatta = BASE_URL.FILE_PATH."files/document_check_list_files/".$data[0];
				//$file = BASE_DIR.FILE_PATH."files/document_check_list_files/".$data[0];

				$source = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/" . $data[0];
				$destination = BASE_DIR . FILE_PATH . "files/manoj/" . $data[0];
				copy($source, $destination);

				$finalatta = BASE_URL . FILE_PATH . "files/manoj/" . $data[0];
				$file = BASE_DIR . FILE_PATH . "files/manoj/" . $data[0];

				if (file_exists($file)) {
					$fdata[] = $finalatta;
					$doclogattach[] = $data[0];
				}
			}
		}
	}

	if (!empty($tempdocs)) {
		foreach ($tempdocs as $k1 => $v1) {
			if ($v1) {
				$docsattach = BASE_URL . FILE_PATH . "files/template_documents_hub/" . $v1;
				$file = BASE_DIR . FILE_PATH . "files/template_documents_hub/" . $v1;
				if (file_exists($file)) {
					$fdata[] = $docsattach;
					$templogattach[] = $v1;
				}
			}
		}
	}

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
		move_uploaded_file($src2, $destination2);
		$attach2 =  BASE_URL . FILE_PATH . "files/email_attachment/" . $file_name2;
	}

	if ($_FILES['docs3']['name']) {
		$file_name3 = $_FILES['docs3']['name'];
		$src3 = $_FILES['docs3']['tmp_name'];
		$destination3 = BASE_DIR . 'files/email_attachment/' . $file_name3;
		move_uploaded_file($src3, $destination3);
		$attach3 =  BASE_URL . FILE_PATH . "files/email_attachment/" . $file_name3;
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


	$sql2  = "Select bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1 from business_sellers 
			Inner Join bus_customers on business_sellers.bs_customers_id  = bus_customers.bcust_id 
			where bs_business_id  = " . $bsn_id;
	$custdata = $fwDb->queryOne($sql2);

	$to = $custdata['bcust_misc_email1'];

	//$to = "manojsoniephp@gmail.com";
	//$to = "yanadelvalle@wotlink.com.au";

	$toname = $custdata['bcust_fname'] . " " . $custdata['bcust_lname'];
	$fromname = $signature[0]['es_name'];
	$from = $signature['es_reply_to'];

	$subject =  stripslashes($detail['subject']) . ' [' . $emldetail['eml_code'] . ']';

	$email_body = $detail['bsn_emcontent'];
	$email_body .= "<br>" . $signature[0]['es_signature'];
	if ($signature[0]['es_logo']) {
		$email_body .= "<img src='" . BASE_URL . "files/email_library/" . $signature[0]['es_logo'] . "'>";
	}


	if (!empty($toname)) {
		$draftDetail['ed_toname'] = $toname;
	}
	if (!empty($to)) {
		$draftDetail['ed_to'] = $to;
	}
	if (!empty($fromname)) {
		$draftDetail['ed_fromname'] = $fromname;
	}
	if (!empty($from)) {
		$draftDetail['ed_from'] = $from;
	}
	if (!empty($subject)) {
		$draftDetail['ed_subject'] = stripslashes($subject);
	}
	if (!empty($email_body)) {
		$draftDetail['ed_email_body'] = $email_body;
	}
	if (!empty($attachmentsend)) {
		$draftDetail['ed_attachmentsend'] = $attachmentsend;
	}
	$draftDetail['ed_status'] = 'Draft';

	if (!empty($doclogattach)) {
		$draftDetail['ed_proj_docs'] = implode(", ", $doclogattach);
	}
	if (!empty($templogattach)) {
		$draftDetail['ed_template_docs'] = implode(", ", $templogattach);
	}

	$email_draft_Table = new Fw_Db_Table('email_draft');
	$email_draft_Table->insertRow($draftDetail);
	$fwViewData['email_sent_ok'] = "Email has been SAVED... Successfully";
}

$ecsql = "select * from email_contact where ec_status = 1";
$fwViewData['emailcontacts'] = $fwDb->query($ecsql);
