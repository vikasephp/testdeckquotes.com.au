<?php
$fwMainView = 'file:' . getcwd() . '/view_logs.tpl';
$serviceObj = new ServiceClass;

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

$query = $serviceObj->getLogsByBsnIdQuery($bsn_id);
$result = $fwDb->query($query);
$fwViewData['list'] = $result;
