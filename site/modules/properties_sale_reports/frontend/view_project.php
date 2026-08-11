<?php

$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);
$bsn_name = '';

if ($bsn_id > 0) {
    $sql = 'SELECT bsn_name FROM business WHERE bsn_id = ' . $bsn_id;
    $result = $fwDb->queryOne($sql);
    $bsn_name = $result['bsn_name'];
}

$fwViewData['bsn_id'] = $bsn_id;
$fwViewData['title'] = 'Project Details ' . $bsn_name;

//Invoice Tab Code
$fwViewData['invoice_template'] =  $_SERVER['DOCUMENT_ROOT'] . '/site/modules/properties_sale_reports/frontend/invoices.tpl';
$invTable = new Fw_Db_Table("properties_sale_reports_invoices");

$sql_psri_inv = "SELECT * FROM properties_sale_reports_invoices WHERE psri_bsn_id = $bsn_id ORDER BY psri_id DESC";
$data_psri_inv = $fwDb->query($sql_psri_inv);
//$fwViewData['invData'] = $fwDb->query($sql);

// Save Invoice Sent Record
$inv_sent = $fwRequest->getParam('inv_sent', '');
if (!empty($inv_sent)) {
	$dt = date('d-m-Y h:i:sa');
	$user = $_SESSION['user']['user_name'];
	$key = array_keys($inv_sent);
	$ky = $key[0];

	$invDetail['psri_sent'] = $inv_sent[$ky];
	$invDetail['psri_sent_user'] = $user;
	$invDetail['psri_sent_date'] = $dt;

	$invTable->setWhere('psri_id = ' . $ky);
	$detail = $invTable->updateRow($invDetail);
	$redirectUrl = $_SERVER['REQUEST_URI'];
	header("Location: $redirectUrl");
	exit;
}
//End Invoice Sent Record

// Save Invoice Paid Record
$inv_paid = $fwRequest->getParam('inv_paid', '');
if (!empty($inv_paid)) {
	$dt = date('d-m-Y h:i:sa');
	$user = $_SESSION['user']['user_name'];
	$key = array_keys($inv_paid);
	$ky = $key[0];

	$invDetail['psri_paid'] = $inv_paid[$ky];
	$invDetail['psri_paid_user'] = $user;
	$invDetail['psri_paid_date'] = $dt;

	$invTable->setWhere('psri_id = ' . $ky);
	$detail = $invTable->updateRow($invDetail);
	$redirectUrl = $_SERVER['REQUEST_URI'];
	header("Location: $redirectUrl");
	exit;
}
//End Invoice Paid Record

if (!empty($data_psri_inv)) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}
	$rows = count($data_psri_inv);
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
	$fwViewData['start_sn'] = ($pagenum - 1) * $page_rows + 1;

	$max = 'limit ' . ($pagenum - 1) * $page_rows . ',' . $page_rows;

	$sql_psri_inv2 =  $sql_psri_inv . " " . $max;
	if ($sql_psri_inv2) {
		$fwViewData['list'] = $fwDb->query($sql_psri_inv2);
	}
}

$psr_complete = $fwRequest->getParam('psr_complete', []);
if (!empty($psr_complete) && is_array($psr_complete)) {

    $bsn_id = (int) ($psr_complete['bsn_id'] ?? 0);
    $psr_key = $psr_complete['psrtc_key'] ?? '';

    unset($psr_complete['bsn_id'], $psr_complete['psrtc_key']);

    $dt   = date('d-m-Y');
    $user = $_SESSION['user']['user_name'];

    foreach ($psr_complete as $psrlctl_uid => $completed_value) {

        $psrlctl_uid = (int)$psrlctl_uid;
        $completed_val = ((int)$completed_value === 1) ? 1 : 0;

        $psrtcDetail = [
            'psrtc_completed' => $completed_val,
            'psrtc_completed_by' => $user,
            'psrtc_completed_date' => $dt,
            'psrtc_bsn_id' => $bsn_id,
            'psrtc_uid_id' => $psrlctl_uid,
            'psrtc_key' => $psr_key
        ];

        $psrtcTable = new Fw_Db_Table("properties_sale_reports_tab_completed");
        $psrtcTable->setWhere(
            'psrtc_bsn_id = ' . $bsn_id .
            ' AND psrtc_uid_id = ' . $psrlctl_uid
        );

        if ($psrtcTable->rowExists()) {
            $psrtcTable->updateRow($psrtcDetail);
        } else {
            $psrtcTable->insertRow($psrtcDetail);
        }
    }

    $redirectUrl = $_SERVER['REQUEST_URI'];
    header("Location: $redirectUrl");
    exit;
}

$psruo_offer_sent = $fwRequest->getParam('psruo_offer_sent', '');
if (!empty($psruo_offer_sent)) {

	$psruo_id = (int)$psruo_offer_sent['psruo_id'];
    $val_os   = $psruo_offer_sent['psruo_offer_sent'];

    $detail = array();
    $detail['psruo_offer_sent'] = $val_os;
	
    $detail['psruo_offer_sent_user'] = $_SESSION['user']['user_name'];
	$detail['psruo_offer_sent_date'] = date('d-m-Y');

    $tablepsruo = new Fw_Db_Table('properties_sale_reports_under_offer');
    $tablepsruo->setWhere("psruo_id = $psruo_id");

    if ($tablepsruo->rowExists()) {
        $tablepsruo->updateRow($detail);
    }

    $redirectUrl = $_SERVER['REQUEST_URI'];
    header("Location: $redirectUrl");
    exit; 	
}


//properties_sale_reports_invoice_type
//$sql_psri_invType = "SELECT * FROM properties_sale_reports_invoice_type";
//$data_psri_invType = $fwDb->query($sql_psri_invType);
$psri_invTypeTable = new Fw_Db_Table('properties_sale_reports_invoice_type');
$fwViewData['data_psri_invType'] = $data_psri_invType = $psri_invTypeTable->getAllRows();

//Lead Conversion Tab Code
$fwViewData['lead_conversion'] =  $_SERVER['DOCUMENT_ROOT'] . '/site/modules/properties_sale_reports/frontend/lead_conversion.tpl';
$psri_lcTable = new Fw_Db_Table($ATTRIBUTES['lead_conversion_task_list']['table']);
$psri_lcTable->setWhere(" psrlctl_key = 'T' or (psrlctl_key = 'UT' AND psrlctl_bsn_id = $bsn_id) ");
$psri_lcTable->setOrderBy("psrlctl_sequence ASC");
$fwViewData['data_psri_lcTable'] = $psri_lcTable->getAllRows();

$psr_lead_completeTable = new Fw_Db_Table('properties_sale_reports_tab_completed');
$psr_lead_completeTable->setWhere(" psrtc_key = 'lead_conv' AND psrtc_bsn_id = $bsn_id ");
$fwViewData['lead_psr_complete'] = $psr_lead_completeTable->getAllRows();

//Preparing for Market Tab Code
$fwViewData['preparing_for_market'] =  $_SERVER['DOCUMENT_ROOT'] . '/site/modules/properties_sale_reports/frontend/preparing_for_market.tpl';
$psri_pmTable = new Fw_Db_Table($ATTRIBUTES['prep_market_task_list']['table']);
$psri_pmTable->setWhere(" psrpmtl_key = 'T' or (psrpmtl_key = 'UT' AND psrpmtl_bsn_id = $bsn_id) ");
$psri_pmTable->setOrderBy("psrpmtl_sequence ASC");
$fwViewData['data_psri_pmTable'] = $psri_pmTable->getAllRows();

$psr_prmar_completeTable = new Fw_Db_Table('properties_sale_reports_tab_completed');
$psr_prmar_completeTable->setWhere(" psrtc_key = 'prep_mark' AND psrtc_bsn_id = $bsn_id ");
$fwViewData['prmar_psr_complete'] = $psr_prmar_completeTable->getAllRows();

//Property for Sale (Campaign) Tab Code
$fwViewData['property_for_sale'] =  $_SERVER['DOCUMENT_ROOT'] . '/site/modules/properties_sale_reports/frontend/property_for_sale.tpl';
$psri_psTable = new Fw_Db_Table($ATTRIBUTES['prop_sale_task_list']['table']);
$psri_psTable->setWhere(" psrpstl_key = 'T' or (psrpstl_key = 'UT' AND psrpstl_bsn_id = $bsn_id) ");
$psri_psTable->setOrderBy("psrpstl_sequence ASC");
$fwViewData['data_psri_psTable'] = $psri_psTable->getAllRows();

$psr_prs_completeTable = new Fw_Db_Table('properties_sale_reports_tab_completed');
$psr_prs_completeTable->setWhere(" psrtc_key = 'prop_sale' AND psrtc_bsn_id = $bsn_id ");
$fwViewData['prsa_psr_complete'] = $psr_prs_completeTable->getAllRows();

//Exchange Tab Code
$fwViewData['exchange'] =  $_SERVER['DOCUMENT_ROOT'] . '/site/modules/properties_sale_reports/frontend/exchange.tpl';
$psri_eTable = new Fw_Db_Table($ATTRIBUTES['exchange_task_list']['table']);
$psri_eTable->setWhere(" psretl_key = 'T' or (psretl_key = 'UT' AND psretl_bsn_id = $bsn_id) ");
$psri_eTable->setOrderBy("psretl_sequence ASC");
$fwViewData['data_psri_eTable'] = $psri_eTable->getAllRows();

$psr_exc_completeTable = new Fw_Db_Table('properties_sale_reports_tab_completed');
$psr_exc_completeTable->setWhere(" psrtc_key = 'exchange' AND psrtc_bsn_id = $bsn_id ");
$fwViewData['exc_psr_complete'] = $psr_exc_completeTable->getAllRows();

//Post Settlement Tab Code
$fwViewData['post_settlement'] =  $_SERVER['DOCUMENT_ROOT'] . '/site/modules/properties_sale_reports/frontend/post_settlement.tpl';
$psri_postsTable = new Fw_Db_Table($ATTRIBUTES['post_settlement_task_list']['table']);
$psri_postsTable->setWhere(" psrpstl_key = 'T' or (psrpstl_key = 'UT' AND psrpstl_bsn_id = $bsn_id) ");
$psri_postsTable->setOrderBy("psrpstl_sequence ASC");
$fwViewData['data_psri_postsTable'] = $psri_postsTable->getAllRows();

$psr_prst_completeTable = new Fw_Db_Table('properties_sale_reports_tab_completed');
$psr_prst_completeTable->setWhere(" psrtc_key = 'post_setl' AND psrtc_bsn_id = $bsn_id ");
$fwViewData['prst_psr_complete'] = $psr_prst_completeTable->getAllRows();

//Documents Tab Code
$sql_1 = "SELECT doc_id, doc_name_id, doc_live_link, doc_live_link_username, doc_live_link_date FROM document_check_list WHERE doc_bsn_id = $bsn_id and doc_name_id = 44 ";
$data_sql_1 = $fwDb->queryOne($sql_1);
$fwViewData['par_live_link'] = $data_sql_1['doc_live_link'];
$fwViewData['par_live_link_username'] = $data_sql_1['doc_live_link_username'];
$fwViewData['par_live_link_date'] = $data_sql_1['doc_live_link_date'];

$sql_2 = "SELECT doc_id, doc_name_id, doc_live_link, doc_live_link_username, doc_live_link_date FROM document_check_list WHERE doc_bsn_id = $bsn_id and doc_name_id = 771 ";
$data_sql_2 = $fwDb->queryOne($sql_2);
$fwViewData['faq_link'] = $data_sql_2['doc_live_link'];
$fwViewData['faq_link_username'] = $data_sql_2['doc_live_link_username'];
$fwViewData['faq_link_date'] = $data_sql_2['doc_live_link_date'];

$sql_3 = "SELECT doc_id, doc_name_id, doc_live_link, doc_live_link_username, doc_live_link_date FROM document_check_list WHERE doc_bsn_id = $bsn_id and doc_name_id = 765 ";
$data_sql_3 = $fwDb->queryOne($sql_3);
$fwViewData['agency_agreement_link'] = $data_sql_3['doc_live_link'];
$fwViewData['agency_agreement_link_username'] = $data_sql_3['doc_live_link_username'];
$fwViewData['agency_agreement_link_date'] = $data_sql_3['doc_live_link_date'];;

$sql_4 = "SELECT doc_id, doc_name_id, doc_live_link, doc_live_link_username, doc_live_link_date FROM document_check_list WHERE doc_bsn_id = $bsn_id and doc_name_id = 471 ";
$data_sql_4 = $fwDb->queryOne($sql_4);
$fwViewData['contract_for_sale_link'] = $data_sql_4['doc_live_link'];
$fwViewData['contract_for_sale_link_username'] = $data_sql_4['doc_live_link_username'];
$fwViewData['contract_for_sale_link_date'] = $data_sql_4['doc_live_link_date'];

$sql_4_file = "SELECT doc_file_name, doc_user_name, doc_date_uploaded, users.user_name FROM `document_check_list` LEFT JOIN users on users.user_id = document_check_list.doc_user_name where doc_bsn_id = $bsn_id and doc_name_id = 471";
$data_4_file = $fwDb->queryOne($sql_4_file);
$fwViewData['data_4_file'] = $data_4_file;

$sql_5 = "SELECT doc_id, doc_name_id, doc_live_link, doc_live_link_username, doc_live_link_date FROM document_check_list WHERE doc_bsn_id = $bsn_id and doc_name_id = 766 ";
$data_sql_5 = $fwDb->queryOne($sql_5);
$fwViewData['building_comp_link'] = $data_sql_5['doc_live_link'];
$fwViewData['building_comp_link_username'] = $data_sql_5['doc_live_link_username'];
$fwViewData['building_comp_link_date'] = $data_sql_5['doc_live_link_date'];

$sql_5_file = "SELECT doc_file_name, doc_user_name, doc_date_uploaded, users.user_name FROM `document_check_list` LEFT JOIN users on users.user_id = document_check_list.doc_user_name where doc_bsn_id = $bsn_id and doc_name_id = 766";
$data_5_file = $fwDb->queryOne($sql_5_file);
$fwViewData['data_5_file'] = $data_5_file;

$sql_6 = "SELECT doc_id, doc_name_id, doc_live_link, doc_live_link_username, doc_live_link_date FROM document_check_list WHERE doc_bsn_id = $bsn_id and doc_name_id = 773 ";
$data_sql_6 = $fwDb->queryOne($sql_6);
$fwViewData['floor_plan_link'] = $data_sql_6['doc_live_link'];
$fwViewData['floor_plan_link_username'] = $data_sql_6['doc_live_link_username'];
$fwViewData['floor_plan_link_date'] = $data_sql_6['doc_live_link_date'];

$sql_6_file = "SELECT doc_file_name, doc_user_name, doc_date_uploaded, users.user_name FROM `document_check_list` LEFT JOIN users on users.user_id = document_check_list.doc_user_name where doc_bsn_id = $bsn_id and doc_name_id = 773";
$data_6_file = $fwDb->queryOne($sql_6_file);
$fwViewData['data_6_file'] = $data_6_file;

$sql_7 = "SELECT doc_id, doc_name_id, doc_live_link, doc_live_link_username, doc_live_link_date FROM document_check_list WHERE doc_bsn_id = $bsn_id and doc_name_id = 770 ";
$data_sql_7 = $fwDb->queryOne($sql_7);
$fwViewData['rental_valuation_link'] = $data_sql_7['doc_live_link'];
$fwViewData['rental_valuation_link_username'] = $data_sql_7['doc_live_link_username'];
$fwViewData['rental_valuation_link_date'] = $data_sql_7['doc_live_link_date'];

$sql_7_file = "SELECT doc_file_name, doc_user_name, doc_date_uploaded, users.user_name FROM `document_check_list` LEFT JOIN users on users.user_id = document_check_list.doc_user_name where doc_bsn_id = $bsn_id and doc_name_id = 770";
$data_7_file = $fwDb->queryOne($sql_7_file);
$fwViewData['data_7_file'] = $data_7_file;

$sql_8 = "SELECT doc_id, doc_name_id, doc_live_link, doc_live_link_username, doc_live_link_date FROM document_check_list WHERE doc_bsn_id = $bsn_id and doc_name_id = 769 ";
$data_sql_8 = $fwDb->queryOne($sql_8);
$fwViewData['sales_valuation_link'] = $data_sql_8['doc_live_link'];
$fwViewData['sales_valuation_link_username'] = $data_sql_8['doc_live_link_username'];
$fwViewData['sales_valuation_link_date'] = $data_sql_8['doc_live_link_date'];

$sql_8_file = "SELECT doc_file_name, doc_user_name, doc_date_uploaded, users.user_name FROM `document_check_list` LEFT JOIN users on users.user_id = document_check_list.doc_user_name where doc_bsn_id = $bsn_id and doc_name_id = 769";
$data_8_file = $fwDb->queryOne($sql_8_file);
$fwViewData['data_8_file'] = $data_8_file;

$sql_9 = "SELECT doc_id, doc_name_id, doc_live_link, doc_live_link_username, doc_live_link_date FROM document_check_list WHERE doc_bsn_id = $bsn_id and doc_name_id = 768 ";
$data_sql_9 = $fwDb->queryOne($sql_9);
$fwViewData['suburb_flyover_link'] = $data_sql_9['doc_live_link'];
$fwViewData['suburb_flyover_link_username'] = $data_sql_9['doc_live_link_username'];
$fwViewData['suburb_flyover_link_date'] = $data_sql_9['doc_live_link_date'];

$sql_9_file = "SELECT doc_file_name, doc_user_name, doc_date_uploaded, users.user_name FROM `document_check_list` LEFT JOIN users on users.user_id = document_check_list.doc_user_name where doc_bsn_id = $bsn_id and doc_name_id = 768";
$data_9_file = $fwDb->queryOne($sql_9_file);
$fwViewData['data_9_file'] = $data_9_file;

$sql_10 = "SELECT doc_id, doc_name_id, doc_live_link, doc_live_link_username, doc_live_link_date FROM document_check_list WHERE doc_bsn_id = $bsn_id and doc_name_id = 774 ";
$data_sql_10 = $fwDb->queryOne($sql_10);
$fwViewData['air_dna_link'] = $data_sql_10['doc_live_link'];
$fwViewData['air_dna_link_username'] = $data_sql_10['doc_live_link_username'];
$fwViewData['air_dna_link_date'] = $data_sql_10['doc_live_link_date'];

$sql_10_file = "SELECT doc_file_name, doc_user_name, doc_date_uploaded, users.user_name FROM `document_check_list` LEFT JOIN users on users.user_id = document_check_list.doc_user_name where doc_bsn_id = $bsn_id and doc_name_id = 774";
$data_10_file = $fwDb->queryOne($sql_10_file);
$fwViewData['data_10_file'] = $data_10_file;

$fwViewData['document'] =  $_SERVER['DOCUMENT_ROOT'] . '/site/modules/properties_sale_reports/frontend/document.tpl';

$pdTable = new Fw_Db_Table('psr_public_documents');
$pdTable->setWhere("psr_bsn_id = $bsn_id");
$fwViewData['pd_data'] = $pdTable->getAllRows();

require_once(MODULES_DIR . 'PDFMerger.php');

use PDFMerger\PDFMerger;

$merge = $fwRequest->getParam('merge_public_doc', '');

if (!empty($merge)) {

    $sql_public_document = "SELECT file_name FROM ( SELECT doc_file_name AS file_name, doc_name_id FROM document_check_list WHERE doc_bsn_id = 3486 AND doc_name_id IN (471, 766, 773, 770, 769, 768, 774) UNION ALL SELECT psrpd_file AS file_name, 0 AS doc_name_id FROM psr_public_documents WHERE psr_bsn_id = 3486 ) AS files ORDER BY FIELD(doc_name_id, 471, 766, 773, 770, 769, 768, 774, 0)";
    $data = $fwDb->query($sql_public_document);

    if (empty($data)) {
        exit('No documents found to merge.');
    }

    $pdf = new PDFMerger;

    /*Temp local folder*/
    $publicDocumentPath = BASE_DIR . FILE_PATH . 'files/public_document/';

    if (!is_dir($publicDocumentPath)) {
        mkdir($publicDocumentPath, 0777, true);
    }

    deleteFiles($publicDocumentPath);
    $fn = 'public_document_' . time() . '.pdf';

    /*S3 folder*/
    $folder_path = 'files/document_check_list_files/';

    /*Download each PDF and add it to merger*/
    foreach ($data as $document) {

        if (empty($document['file_name'])) {
            continue;
        }

        $fileName = basename($document['file_name']);
        $source = get_file_raw_data($folder_path, $fileName);

        if (!$source || !file_exists($source)) {
            continue;
        }

        $localFile = $publicDocumentPath . $fileName;

        if (!copy($source, $localFile)) {
            continue;
        }

        $pdf->addPDF($localFile);
    }

    /* Path for merged PDF */
    $mergedFile = $publicDocumentPath . $fn;

    $pdf->merge('file', $mergedFile);

    if (!file_exists($mergedFile)) {
        deleteFiles($publicDocumentPath);
        exit('Unable to create merged PDF.');
    }

    /*Download merged PDF*/
    header('Content-Type: application/pdf');
    header('Content-Disposition: attachment; filename="' . $fn . '"');
    header('Content-Length: ' . filesize($mergedFile));
    header('Cache-Control: private, max-age=0, must-revalidate');
    header('Pragma: public');

    readfile($mergedFile);

    /*delete temporary files after download*/
    deleteFiles($publicDocumentPath);
    exit;
}

function deleteFiles($dir)
{
    if (!is_dir($dir)) {
        return;
    }
    foreach (glob($dir . '/*') as $file) {
        if (is_file($file)) {
            unlink($file);
        }
    }
}

//Under Offer Tab Code
$fwViewData['under_offer'] =  $_SERVER['DOCUMENT_ROOT'] . '/site/modules/properties_sale_reports/frontend/under_offer.tpl';
$psruo_Table = new Fw_Db_Table("properties_sale_reports_under_offer");
$psruo_Table->setWhere("psruo_bsn_id = $bsn_id ");
$psruo_Table->setOrderBy("psruo_id ASC");
$fwViewData['data_underoffer_table'] = $psruo_Table->getAllRows();


//Enquiries Tab Code
$fwViewData['enquiries'] =  $_SERVER['DOCUMENT_ROOT'] . '/site/modules/properties_sale_reports/frontend/enquiries.tpl';
$psren_Table = new Fw_Db_Table("properties_sale_reports_enquiries");
/* $psren_Table->setWhere("psre_bsn_id = $bsn_id ");
$psren_Table->setOrderBy("str_to_date(Nullif(psre_date_of_enqury, ''), '%d-%m-%Y') desc");
$fwViewData['data_enquiries_table'] = $psren_Table->getAllRows(); */

$clear_enquiry_filter = $fwRequest->getParam('clear_enquiry_filter', '');
if($clear_enquiry_filter){
	$en_where .= ' and 1 = 1';
	unset($_SESSION['enquiry_active_status']);
	$fwViewData['enquiry_active_status'] = '';
}

$enquiry_active_status = $fwRequest->getParam('search_enquiry_active_status', '');
if($enquiry_active_status):
	$en_where .= " and psre.psre_status = 'Active' ";
	$_SESSION['enquiry_active_status'] = $enquiry_active_status;
	$fwViewData['enquiry_active_status']=$_SESSION['enquiry_active_status'];
elseif($_SESSION['enquiry_active_status'] && $pagenum > 0):
	$en_where .= " and psre.psre_status = 'Active' ";
	$fwViewData['enquiry_active_status']=$_SESSION['enquiry_active_status'];
endif;

$sql_enquiries = "Select psre.*, psr_enquiry_notes.latest_note_date from properties_sale_reports_enquiries psre left join (SELECT psren_psre_id, MAX(psren_created_at) AS latest_note_date FROM psr_enquiry_notes GROUP BY psren_psre_id) psr_enquiry_notes ON psr_enquiry_notes.psren_psre_id = psre.psre_id where psre_bsn_id = ".$bsn_id." " .$en_where. " order by str_to_date(Nullif(psre_date_of_enqury, ''), '%d-%m-%Y') desc";
$fwViewData['data_enquiries_table'] = $fwDb->query($sql_enquiries);

$psre_document_sent = $fwRequest->getParam('psre_document_sent', '');
if (!empty($psre_document_sent)) {

	$psre_id = (int)$psre_document_sent['psre_id'];
    $val_os  = $psre_document_sent['psre_document_sent'];

    $detail_en = array();
    $detail_en['psre_document_sent'] = $val_os;
	
    $detail_en['psre_document_sent_user'] = $_SESSION['user']['user_name'];
	$detail_en['psre_document_sent_date'] = date('d-m-Y');

    $psren_Table->setWhere("psre_id = $psre_id");

    if ($psren_Table->rowExists()) {
        $psren_Table->updateRow($detail_en);
    }

    $redirectUrl = $_SERVER['REQUEST_URI'];
    header("Location: $redirectUrl");
    exit; 	
}

//SMS Tab Code
$fwViewData['sms_history'] =  $_SERVER['DOCUMENT_ROOT'] . '/site/modules/properties_sale_reports/frontend/sms_history.tpl';
$smsHistory_Table = new Fw_Db_Table("psr_enquiry_sms_history");
$smsHistory_Table->setWhere("psresh_bsn_id = $bsn_id");
$smsHistory_Table->setOrderBy("psresh_id desc");
$fwViewData['data_sms_history'] = $smsHistory_Table->getAllRows();;

$sql_sms_temp = "SELECT * from psr_enquiry_sms_templates";
$data_sms_temp = $fwDb->query($sql_sms_temp);
$smsTemp = [];
foreach ($data_sms_temp as $template) {
	$smsTemp[$template['psrest_id']] = $template['psrest_name'];
}
$fwViewData['smsTemp'] = $smsTemp;
