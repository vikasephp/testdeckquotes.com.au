<?php

$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);
$bsn_name = '';
$bsn_buyer_report_cover_image = '';

if ($bsn_id > 0) {
    $sql = 'SELECT bsn_name, bsn_buyer_report_cover_image FROM business WHERE bsn_id = ' . $bsn_id;
    $result = $fwDb->queryOne($sql);
    if(!empty($result)) {
        $bsn_name = $result['bsn_name'];
        $bsn_buyer_report_cover_image = $result['bsn_buyer_report_cover_image'];
    }
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

    $sql_public_document = "SELECT file_name FROM ( SELECT doc_file_name AS file_name, doc_name_id FROM document_check_list WHERE doc_bsn_id = {$bsn_id} AND doc_name_id IN (471, 766, 773, 770, 769, 768, 774) UNION ALL SELECT psrpd_file AS file_name, 0 AS doc_name_id FROM psr_public_documents WHERE psr_bsn_id = {$bsn_id} ) AS files ORDER BY FIELD( doc_name_id, 471, 766, 773, 770, 769, 768, 774, 0 )";
    $data = $fwDb->query($sql_public_document);

    if (empty($data)) {
        exit('No documents found to merge.');
    }

    $pdfMerger = new PDFMerger;

    /*Temporary folder*/
    $publicDocumentPath = BASE_DIR . FILE_PATH . 'files/public_document/';

    if (!is_dir($publicDocumentPath)) {
        mkdir($publicDocumentPath, 0777, true);
    }

    /*Remove previous temporary files*/
    deleteFiles($publicDocumentPath);

    /*Final merged PDF filename*/
    $fn = 'public_document_' . time() . '.pdf';

    /*S3 folder*/
    $folder_path = 'files/document_check_list_files/';

    foreach ($data as $document) {

        if (empty($document['file_name'])) {
            continue;
        }

        $fileName = basename($document['file_name']);
        $source = get_file_raw_data($folder_path, $fileName);

        if (!$source || !file_exists($source)) {
            continue;
        }

        $extension = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));

        if ($extension === 'pdf') {
            $localPdf = $publicDocumentPath . uniqid('pdf_', true) . '.pdf';
            if (copy($source, $localPdf)) {
                $pdfMerger->addPDF($localPdf);
            }
        }

        /*Convert JPG / JPEG / PNG / WEBP to PDF*/ elseif (in_array($extension, ['jpg', 'jpeg', 'png', 'webp'])) {
            $imagePdf = convertImageToPdf($source, $publicDocumentPath);
            if ($imagePdf && file_exists($imagePdf)) {
                $pdfMerger->addPDF($imagePdf);
            }
        } else {
            // Ignore DOC, DOCX, etc.
            continue;
        }

        /*Remove the temporary S3 download*/
        if (file_exists($source)) {
            unlink($source);
        }
    }

    /*Final merged PDF*/
    $mergedFile = $publicDocumentPath . $fn;

    /*Merge all PDFs*/
    try {
        $pdfMerger->merge('file', $mergedFile);
    } catch (Exception $e) {
        deleteFiles($publicDocumentPath);
        exit('Unable to merge PDF: ' . $e->getMessage());
    }

    /*Check merged file*/
    if (!file_exists($mergedFile) || filesize($mergedFile) == 0) {
        deleteFiles($publicDocumentPath);
        exit('Unable to create merged PDF.');
    }

    /*Send PDF directly to browser*/
    if (ob_get_length()) {
        ob_end_clean();
    }

    header('Content-Type: application/pdf');
    header('Content-Disposition: attachment; filename="' . $fn . '"');
    header('Content-Length: ' . filesize($mergedFile));
    header('Cache-Control: private, max-age=0, must-revalidate');
    header('Pragma: public');
    readfile($mergedFile);

    /*Remove temporary files*/
    deleteFiles($publicDocumentPath);
    exit;
}

/*Function to Convert Image to PDF*/
function convertImageToPdf($imagePath, $outputFolder)
{
    if (!file_exists($imagePath)) {
        return false;
    }

    if (!class_exists('TCPDF')) {
        require_once(BASE_DIR . 'tcpdf/tcpdf.php');
    }

    /*Create unique PDF filename*/
    $pdfFile = $outputFolder . uniqid('image_', true) . '.pdf';

    /*Create TCPDF document*/
    $imagePdf = new TCPDF(
        'P',
        PDF_UNIT,
        PDF_PAGE_FORMAT,
        true,
        'UTF-8',
        false
    );

    /*Remove header/footer*/
    $imagePdf->setPrintHeader(false);
    $imagePdf->setPrintFooter(false);

    /*Set margins*/
    $imagePdf->SetMargins(0, 0, 0);
    $imagePdf->SetAutoPageBreak(false, 0);

    /*Get image dimensions*/
    $imageInfo = getimagesize($imagePath);
    if ($imageInfo === false) {
        return false;
    }

    $imageWidth = $imageInfo[0];
    $imageHeight = $imageInfo[1];

    /*A4 dimensions in mm*/
    $a4Width = 210;
    $a4Height = 297;

    /*Determine orientation*/
    if ($imageWidth > $imageHeight) {
        $orientation = 'L';
        $pageWidth = 297;
        $pageHeight = 210;
    } else {
        $orientation = 'P';
        $pageWidth = 210;
        $pageHeight = 297;
    }

    /*Re-create PDF with correct orientation*/
    unset($imagePdf);

    $imagePdf = new TCPDF($orientation, PDF_UNIT, 'A4', true, 'UTF-8', false);

    $imagePdf->setPrintHeader(false);
    $imagePdf->setPrintFooter(false);
    $imagePdf->SetMargins(0, 0, 0);
    $imagePdf->SetAutoPageBreak(false, 0);

    /* Add page */
    $imagePdf->AddPage();


    /*
     * Calculate image size to fit A4
     * while maintaining aspect ratio.
     */
    $scaleX = $pageWidth / $imageWidth;
    $scaleY = $pageHeight / $imageHeight;

    $scale = min($scaleX, $scaleY);

    $displayWidth = $imageWidth * $scale;
    $displayHeight = $imageHeight * $scale;

    /*
     * Center image on page
     */
    $x = ($pageWidth - $displayWidth) / 2;
    $y = ($pageHeight - $displayHeight) / 2;

    /*Add image*/
    $imagePdf->Image($imagePath, $x, $y, $displayWidth, $displayHeight, '', '', '', false, 300, '', false, false, 0, false, false, false);

    /* Save PDF to temporary folder */
    $imagePdf->Output($pdfFile, 'F');

    /*Verify PDF*/
    if (!file_exists($pdfFile) || filesize($pdfFile) == 0) {
        return false;
    }

    return $pdfFile;
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
if ($clear_enquiry_filter) {
    $en_where .= ' and 1 = 1';
    unset($_SESSION['enquiry_active_status']);
    $fwViewData['enquiry_active_status'] = '';
}

$enquiry_active_status = $fwRequest->getParam('search_enquiry_active_status', '');
if ($enquiry_active_status):
    $en_where .= " and psre.psre_status = 'Active' ";
    $_SESSION['enquiry_active_status'] = $enquiry_active_status;
    $fwViewData['enquiry_active_status'] = $_SESSION['enquiry_active_status'];
elseif ($_SESSION['enquiry_active_status'] && $pagenum > 0):
    $en_where .= " and psre.psre_status = 'Active' ";
    $fwViewData['enquiry_active_status'] = $_SESSION['enquiry_active_status'];
endif;

$sql_enquiries = "Select psre.*, psr_enquiry_notes.latest_note_date from properties_sale_reports_enquiries psre left join (SELECT psren_psre_id, MAX(psren_created_at) AS latest_note_date FROM psr_enquiry_notes GROUP BY psren_psre_id) psr_enquiry_notes ON psr_enquiry_notes.psren_psre_id = psre.psre_id where psre_bsn_id = " . $bsn_id . " " . $en_where . " order by str_to_date(Nullif(psre_date_of_enqury, ''), '%d-%m-%Y') desc";
$data_enquiries_table = $fwDb->query($sql_enquiries);
$fwViewData['data_enquiries_table'] = $data_enquiries_table;

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

require_once(BASE_DIR.'tcpdf/config/lang/eng.php');
require_once(BASE_DIR.'tcpdf/tcpdf.php');
$PDF_PAGE_ORIENTATION = "R";
//$PDF_PAGE_ORIENTATION = "L";

class MYPDF extends TCPDF {
   
    // Page footer
    public function Footer() {

        $this->SetY(-15);
    
        $this->SetFont('helvetica', 'I', 8);
      
		$this->Cell(0, 10, "Buyer Feedback Report", 'T', 0, 'L');
		if ($this->getRTL()) {
			$this->SetX($this->original_rMargin);
			$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'L');
		} else {
			$this->SetX($this->original_lMargin);
			$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'R');
		}
		
        $this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
		
    }
}

$sql = "SELECT psre_id, psre_enquiry_name, psre_enquiry_name_last, psre_email_address, psre_status, psre_date_of_enqury, psr_enquiry_notes.latest_note_date FROM properties_sale_reports_enquiries psre LEFT JOIN (SELECT psren_psre_id, MAX(psren_created_at) AS latest_note_date FROM psr_enquiry_notes GROUP BY psren_psre_id) psr_enquiry_notes ON psr_enquiry_notes.psren_psre_id = psre.psre_id WHERE psre_bsn_id = $bsn_id ORDER BY psre_status ASC, str_to_date(NULLIF(psre_date_of_enqury, ''), '%d-%m-%Y') DESC;";
$data_enquiries_table = $fwDb->query($sql);
$buyer_feedback_report = $fwRequest->getParam('buyer_feedback_report', '');
$navyColor = '#161750';
if (!empty($buyer_feedback_report) && !empty($data_enquiries_table)) {
    $psreIds = [];
    $totalBuyers = count($data_enquiries_table);
    $activeBuyers = 0;
    $inactiveBuyers = 0;
    foreach($data_enquiries_table as $row) {
        $psreIds[] = $row['psre_id'];
        if($row['psre_status'] === 'Active') {
            $activeBuyers++;
        } elseif($row['psre_status'] === 'Inactive') {
            $inactiveBuyers++;
        }
    }
    $sql = "SELECT psr_enquiry_notes.*, users.user_name FROM `psr_enquiry_notes` LEFT JOIN users ON psr_enquiry_notes.psren_created_by = users.user_id WHERE psr_enquiry_notes.psren_psre_id IN (".implode(',', $psreIds). ") ORDER BY psr_enquiry_notes.psren_created_at DESC";
    $rows = $fwDb->query($sql);
    $notesData = [];
    foreach($rows as $row) {
        if(!isset($notesData[$row['psren_psre_id']])) {
            $notesData[$row['psren_psre_id']] = [];
        }
        $notesData[$row['psren_psre_id']][] = $row;
    }

    $query = "SELECT BS.bs_business_id, BS.bs_customers_id, BC.bcust_fname, BC.bcust_lname FROM business_sellers AS BS INNER JOIN bus_customers AS BC ON BC.bcust_id = BS.bs_customers_id WHERE BS.bs_business_id = {$bsn_id}";
    $result = $fwDb->query($query);
    $customersData = '';
    foreach ($result as $row) {
        $customersData .= ('<span style="display: block;">' . $row['bcust_fname'] . ' ' . $row['bcust_lname'] . '</span>');
    }

    if (!is_dir(BASE_DIR . 'buyer_feedback_report/')) {
		mkdir(BASE_DIR . 'buyer_feedback_report/', 0777, TRUE);
	}

    $html = '';
	$last_key = end(array_keys($data_enquiries_table));

    // $html .= '<hr />';
    $html .= '<table cellpadding="2" cellspacing="0" style="vertical-align: middle;">';
		$html .= '<tr>';
            $html .= '<th><h2>Buyer Feedback Report</h2></th>';
		$html .= '</tr>';
		$html .= '<tr>';
            $html .= ('<td>' . $bsn_name . '</td>');
		$html .= '</tr>';
		$html .= '<tr>';
            $html .= ('<td>' . date('d-M-Y') . '</td>');
		$html .= '</tr>';
	$html .= '</table>';
    // $html .= '<hr />';
    // $html .= '<br />';
    // $html .= '<br />';
    $html .= '<br />';

    // https://static.zdassets.com/agent/assets/react/js/standalone.b9ec7570..html#key=4f2981d9-ccf3-4cde-831a-431b39ac9a2f&botId=6a8405bdfcf782d218722f3a&dir=ltr&locale=en-us&origin=https%3A%2F%2Ftesting-69206.zendesk.com
    // support@testing-69206.zendesk.com

    if(!empty($bsn_buyer_report_cover_image)) {
        $html .= '<table width="100%" cellpadding="0" cellspacing="0">';
            $bsn_buyer_report_cover_image = getUploadUrl($bsn_buyer_report_cover_image, 'properties_sale_reports.buyer_report_cover_image');
            $html .= ('<tr><td colspan="3">' . '<img src="' . $bsn_buyer_report_cover_image . '">' . '</td></tr>');
        $html .= '</table>';
        $html .= '<br />';
    }

    $html .= '<table width="100%" cellpadding="5" cellspacing="0">';
        $html .= ('<tr style="background-color: ' . $navyColor . '; color: #fff;">');
            // $html .= '<td width="1%"></td>';
            $html .= ('<td width="90" style="border: 1pt solid ' . $navyColor . ';"><img src="' . BASE_URL . 'images/buyer_feedback_report/frank_mini.png" width="80" /></td>');
            $html .= ('<td width="330" style="border: 1pt solid ' . $navyColor . ';">');
                $html .= '<br /><br /><br />';
                $html .= ('<b>Presented by:</b>');
                $html .= '<br />';
                $html .= 'Frank Walmsley';
                $html .= '<br />';
                $html .= '0400 446 605';
                $html .= '<br />';
                $html .= 'clientservices@cgfb.com.au';
            $html .= '</td>';
            $html .= ('<td width="auto" style="text-align: right; border: 1pt solid ' . $navyColor . ';">');
                $html .= '<br /><br /><br />';
                $html .= ('<b>Presented to:</b>');
                $html .= '<br />';
                $html .= $customersData;
            $html .= '</td>';
            // $html .= '<td width="8%"></td>';
        $html .= '</tr>';
    $html .= '</table>';
    $html .= '<br />';
    $html .= '<br />';

    $html .= '<table style="width: 100%;" cellpadding="5" cellspacing="0" align="center">';
        $html .= '<tr>';
            $html .= ('<td><img src="' . BASE_URL . 'images/buyer_feedback_report/total_buyers.jpg" height="80" /><br><span style="font-size: 10pt;">Total Buyers</span><br><span style="font-weight: bold; font-size: 12pt;">' . $totalBuyers . '</span></td>');
            $html .= ('<td><img src="' . BASE_URL . 'images/buyer_feedback_report/active_buyers.jpg" height="80" /><br><span style="font-size: 10pt;">Active Buyers</span><br><span style="font-weight: bold; font-size: 12pt;">' . $activeBuyers . '</span></td>');
            $html .= ('<td><img src="' . BASE_URL . 'images/buyer_feedback_report/inactive_buyers.jpg" height="80" /><br><span style="font-size: 10pt;">Inactive Buyers</span><br><span style="font-weight: bold; font-size: 12pt;">' . $inactiveBuyers . '</span></td>');
        $html .= '</tr>';
    $html .= '</table>';


    $html .= '<br pagebreak="true" />';
    // $html .= '<br />';
    // $html .= '<br />';

    foreach($data_enquiries_table as $index => $row) {
        $enquiries = $notesData[$row['psre_id']] ?? [];

        $html .= '<table style="width: 100%;" cellpadding="7" cellspacing="0">';
            // $html .= ('<tr><th>' . "{$row['psre_enquiry_name']} {$row['psre_enquiry_name_last']} - {$row['psre_email_address']}" . '</th></tr>');
            // $html .= ('<tr><th>' . "{$row['psre_enquiry_name']} {$row['psre_enquiry_name_last']}" . '</th></tr>');
            $bgColor = $row['psre_status'] === 'Active' ? $navyColor : 'red';
            $html .= ('<tr><td style="color: #fff; background-color: ' . $bgColor . ';">' . $row['psre_enquiry_name'] . ' ' . $row['psre_enquiry_name_last'] . ' - ' . $row['psre_status'] . '</td></tr>');
            // $html .= ('<tr><td style="color: #fff; background-color: #484c4f;">' . $row['psre_enquiry_name'] . ' ' . $row['psre_enquiry_name_last'] . ': <strong>' . count($enquiries) . '</strong> - ' . $row['psre_status'] . '</td></tr>');
        $html .= '</table>';
        if(count($enquiries)) {
            $html .= '<br />';
            $html .= '<table style="width: 100%;" cellpadding="0" cellspacing="7" border="0">';
            foreach($enquiries as $key => $value) {
                // $html .= '<tr>';
                //     $html .= '<table cellpadding="0" cellspacing="0" border="0">';
                //     $html .= '</table>';
                // $html .= '</tr>';
                $html .= '<tr>';
                    $html .= '<table cellpadding="10" cellspacing="0" border="0" width="100%">';
                        $html .= ('<tr><td width="130">' . date('D j M Y', strtotime($value['psren_created_at'])) . '</td><td width="auto" style="border: 0pt solid #446; border-left-width: 2pt;">' .  "{$value['psren_notes']}" . '</td></tr>');
                    $html .= '</table>';
                $html .= '</tr>';
                // $html .= ('<tr style="border: 0pt solid #446;"><td style="border: 0pt solid #446; border-left-width: 2pt;">' . date('D j M Y', strtotime($value['psren_created_at'])) . ' ' .  "{$value['psren_notes']}" . '</td></tr>');
            }
            $html .= '</table>';
        }
        if ($index <> $last_key) {
            $html .= '<br pagebreak="true" />';
        }
        // $html .= '<br />';
        // $html .= '<br />';
        // $html .= '<br />';

        /* $html .= '<div style="margin-bottom: 30px;">';
            $html .= ('<h4 style="margin: 0px !important; padding: 0px !important;">' . "{$row['psre_enquiry_name']} {$row['psre_enquiry_name_last']} - {$row['psre_email_address']}" . '</h4>');
            $html .= ('<div style="color: #fff; background-color: #484c4f; width: 100%;">Enquiries: <strong>' . count($enquiries) . '</strong></div>');
            foreach($enquiries as $key => $value) {
                $html .= '<div style="padding: 10px; border-radius: 12px; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); overflow: hidden; background-color: #fff; border: 1px solid #ddd;">';
                    $html .= ('<span style="margin: 0px !important; padding: 0px !important;">' . "{$value['psren_notes']}" . '</span>');
                $html .= '</div>';
            }
        $html .= '</div>'; */
        // if ($index <> $last_key) {
        //     $html .= '<br pagebreak="true" />';
        // }
    }

    $nameoffile = 'buyer_feedback_report';
    $heading = 'Buyer Feedback Report';
    // $filename = $nameoffile . "_" . $fname . "_" . date('d_m_Y') . "_" . rand(0, 1000) . ".pdf";
    $filename = 'buyer_feedback_report_' . time() . '.pdf';
    $headtext = $heading . " - " . date("d/m/Y");
    // create new PDF document
    $pdf = new MYPDF($PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
    // set document information
    $pdf->SetCreator(PDF_CREATOR);
    $pdf->SetAuthor('Auction Advantage');
    //$pdf->SetTitle('Answer - ".date("d/m/Y")."<br>TurnKeyStudios Project Sales');
    $pdf->SetTitle("Auction Advantage");
    $pdf->SetSubject($heading);
    $pdf->SetKeywords('Auction Advantage, PDF');

    /*
    Auction Advantage
    Unit 11/160 Lysaght Street, Mitchell ACT 2911, Australia
    Phone:  1300 145 561 | Fax: 1300 979 657
    */
    // set default header data
    $pdf->SetHeaderData('auction_advantage_main_logo.png', 40, 'Auction Advantage', "Unit 11/160 Lysaght Street, Mitchell ACT 2911, Australia\nPhone:  1300 145 561 | Fax: 1300 979 657");
    // $pdf->SetHeaderData('auction_advantage_logo.png', PDF_HEADER_LOGO_WIDTH, $headtext, "Auction Advantage");

    // set header and footer fonts
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
    $pdf->SetFont('helvetica', '23', 10);

    // add a page
    $pdf->AddPage();

    //set some language-dependent strings
    $pdf->setLanguageArray($l);

    // -------------------------------------------------------------------

    // add a page
    //$pdf->AddPage();

    // set JPEG quality
    // $pdf->setJPEGQuality(105);
    // output the HTML content
    $pdf->writeHTML($html, true, false, true, false, '');

//     $vbody = <<<EOF
//     $html
// EOF;

//     $pdf->writeHTML($vbody, true, false, true, false, '');

    //Close and output PDF document
    $filepath = ('buyer_feedback_report/' . $filename);
    $filepath_save = BASE_DIR . $filepath;
    $filepath_url = BASE_URL . $filepath;

    ob_end_clean();
    $pdf->Output($filepath_save, 'F');
    echo "<script>window.open('$filepath_url', '_blank','toolbar=yes, width=800, height=550'); window.focus();</script>";
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
