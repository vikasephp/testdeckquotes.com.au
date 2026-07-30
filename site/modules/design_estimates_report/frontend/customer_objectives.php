<?php
$fwMainView = 'file:' . getcwd() . '/customer_objectives.tpl';
$table = new Fw_Db_Table('document_proposal_name');
$dpn_unique_id = $fwRequest->getParam('dpn_unique_id', 0);
$dpn_customer_objectives = $fwRequest->getParam('dpn_customer_objectives', '');
$submitform = $fwRequest->getParam('submitform', '');
$fwViewData['dpn_unique_id'] = $dpn_customer_objectives;
if ($dpn_unique_id && $submitform) {
    $table->setWhere('dpn_unique_id = ' . $dpn_unique_id);
    if ($table->rowExists()) {
        $data['dpn_customer_objectives'] = $dpn_customer_objectives;
        $data['dpn_customer_objectives_date'] = date('Y-m-d H:i:s');
        $data['dpn_customer_objectives_user'] = $_SESSION['user']['user_name'];
        $detail = $table->updateRow($data);
    }
    $fwViewData['opr'] = "Close";
}

$sqlreason = "SELECT dpn_customer_objectives FROM document_proposal_name WHERE dpn_unique_id = " . $dpn_unique_id;
$data = $fwDb->queryOne($sqlreason);
$fwViewData['dpn_customer_objectives'] = $data['dpn_customer_objectives'];
