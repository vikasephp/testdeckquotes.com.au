<?php

$fwMainView = 'file:' . getcwd() . '/upload_doc_qr_code.tpl';

$doc_id = $fwRequest->getparam('doc_id', 0);
$submit = $fwRequest->getParam('save', '');
$delete = $fwRequest->getParam('delete', '');
$msg = '';
if($doc_id > 0) {
    if ($submit) {
        if ($_FILES['doc_qr_code']['error'] == 0) {
            $docfile = $_FILES['doc_qr_code']['name'];
            $file_type = $_FILES['doc_qr_code']['type'];

            $datetime = trim(date('d_m_Y_H_i_'), '0');
            $docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
            $src = $_FILES['doc_qr_code']['tmp_name'];
            $destination = BASE_DIR . FILE_PATH . 'files/document_check_list_files/' . $docfile;

            if (!move_uploaded_file($src, $destination)) {
                $msg = "Possible file upload attack";
            } else {
                $msg = 'File is successfully uploaded';
                chmod($destination, 0664);
                $update_data['doc_qr_code'] = $docfile;
                $update_data['doc_qr_code_by'] = $_SESSION['user']['user_id'];
                $update_data['doc_qr_code_at'] = date('Y-m-d');

                $this_table = new Fw_Db_Table('document_check_list');
                $this_table->setWhere("doc_id = " . $doc_id);
                $result = $this_table->updateRow($update_data);
            }
        }
        else {
            $msg = 'Please upload a file';
        }
    }
    if($delete) {
        $this_table = new Fw_Db_Table('document_check_list');
        $this_table->setWhere("doc_id = " . $doc_id);
        $update_data['doc_qr_code'] = '';
        $result = $this_table->updateRow($update_data);
    }
    $this_table = new Fw_Db_Table('document_check_list');
    $this_table->setWhere("doc_id = " . $doc_id);
    $detail = $this_table->getRow();
    $fwViewData['detail'] = $detail;
    // db($result);
}

$fwViewData['msg'] = $msg;
