<?php

$fwMainView = 'file:' . getcwd() . '/upload_pdf_cover_image.tpl';
$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);

$fwViewData['title'] = 'Upload Cover Image';
$fwViewData['bsn_id'] = $bsn_id;
$error = '';
$opr = '';
$bsn_buyer_report_cover_image = '';
$fileUploadModule = 'properties_sale_reports.buyer_report_cover_image';

$submit = $fwRequest->getParam('subAddDetail', '');
if (!empty($submit)) {
    if ($_FILES['bsn_buyer_report_cover_image']['name']) {
        // db($_FILES['bsn_buyer_report_cover_image']);
		$docfile_1 = $_FILES['bsn_buyer_report_cover_image']['name'];
		$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
		$temp_name_1 = $_FILES['bsn_buyer_report_cover_image']['tmp_name'];
        $isUploadSuccess = false;
        try {
            $isUploadSuccess = upload_public_doc($docfile_1, $temp_name_1, $fileUploadModule);
        } catch (\Throwable $th) {
            $error = $th->getMessage();
        }
        if($isUploadSuccess && $bsn_id > 0) {
            $businessTable = new Fw_Db_Table('business');
            $businessTable->setWhere("bsn_id = $bsn_id");
            $opr = $businessTable->updateRow(['bsn_buyer_report_cover_image' => $docfile_1]);
        }
        // else {
        //     $error = 'Problem coming in uploading image. Please try again.';
        // }
	}
    
}

$query = "SELECT bsn_buyer_report_cover_image FROM business WHERE bsn_id = $bsn_id";
$result = $fwDb->queryOne($query);
if(!empty($result) && !empty($result['bsn_buyer_report_cover_image'])) {
    $bsn_buyer_report_cover_image = getUploadUrl($result['bsn_buyer_report_cover_image'], $fileUploadModule);
}

$fwViewData['bsn_buyer_report_cover_image'] = $bsn_buyer_report_cover_image;
$fwViewData['error'] = $error;
$fwViewData['opr'] = $opr;