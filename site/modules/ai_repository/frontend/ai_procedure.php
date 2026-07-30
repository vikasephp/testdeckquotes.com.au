<?php
$fwMainView = 'file:' . getcwd() . '/ai_procedure.tpl';

$dh_id = $fwRequest->getParam($ID, '');
$fwViewData['dh_id'] = $dh_id;
$table = new Fw_Db_Table($TABLE);

$add_data = $fwRequest->getParam('add_data', '');

if ($add_data) {
    $dh_ai_procedure = $fwRequest->getParam('dh_ai_procedure', '');
    $table->setWhere($ID . ' = ' . $dh_id);
    if ($table->rowExists()) {
        $data['dh_ai_procedure'] = $dh_ai_procedure;
        $detail = $table->updateRow($data);
    }
    $fwViewData['opr'] = "Close";
}

$sql_aiprocedure = "SELECT dh_ai_procedure FROM $TABLE where $ID = ".$dh_id;
$aiprocedureData = $fwDb->queryOne($sql_aiprocedure);
$fwViewData['dh_ai_procedure'] = $aiprocedureData['dh_ai_procedure'];

$fwViewData['title'] = "AI Procedure Content";