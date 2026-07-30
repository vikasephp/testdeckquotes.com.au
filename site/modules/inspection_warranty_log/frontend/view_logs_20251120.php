<?php
$fwMainView = 'file:' . getcwd() . '/view_logs.tpl';

$bsn_id = $fwRequest->getParam('bsn_id', 0);
$update_wa_inspection_acknowledgement_statement = $fwRequest->getParam('update_wa_inspection_acknowledgement_statement', '');

$error_wa_inspection_acknowledgement_statement = '';
if($update_wa_inspection_acknowledgement_statement != '' && ($wa_id = $fwRequest->getParam('wa_id', 0)) && !empty($_FILES['wa_inspection_acknowledgement_statement']['name'])) {
    try {
        $docfile_1 = $_FILES['wa_inspection_acknowledgement_statement']['name'];
        $docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
        $temp_name_1 = $_FILES['wa_inspection_acknowledgement_statement']['tmp_name'];
        $fileUploaded = upload($docfile_1, $temp_name_1, 'inspection_warranty_log.acknowledgement_statement');
        if($fileUploaded) {
            $record['wa_inspection_acknowledgement_statement'] = $docfile_1;
            $this_table = new Fw_Db_Table('warranty_log');
            $this_table->setWhere('wa_id = ' . $wa_id);
            $res = $this_table->updateRow($record);
        }
        else {
            $error_wa_inspection_acknowledgement_statement = 'Problem coming while uploading';
        }
    } catch (\Throwable $th) {
        $error_wa_inspection_acknowledgement_statement = $th->getMessage();
    }    
}
$fwViewData['error_wa_inspection_acknowledgement_statement'] = $error_wa_inspection_acknowledgement_statement;

$query = 'SELECT WL.wa_id, WL.wa_problem, WL.wa_wlis_id, WL.wa_inspection_proposed_fees, WL.wa_inspection_acknowledgement_statement, (SELECT wlis_option FROM warranty_log_inspection_status WHERE wlis_id = WL.wa_wlis_id) AS inspection_status FROM warranty_log AS WL INNER JOIN business AS B ON B.bsn_name = WL.wa_project WHERE B.bsn_id = ' . $bsn_id . ' AND WL.wa_inspection_required = "Yes" AND WL.wa_is_inspection_fee_required = 1 AND WL.wa_status = "Open" ORDER BY wa_id ASC;';
$result = $fwDb->query($query);
$fwViewData['list'] = $result;
