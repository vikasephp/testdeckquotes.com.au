<?php

$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);
$bsn_name = '';

if ($bsn_id > 0) {
    $sql = 'SELECT pl_address FROM prospect_list WHERE pl_id = ' . $bsn_id;
    $result = $fwDb->queryOne($sql);
    $pl_address = $result['pl_address'];
}

$fwViewData['bsn_id'] = $bsn_id;
$fwViewData['title'] = 'Project Details - ' . $pl_address;

//For Complete Column
$pl_complete = $fwRequest->getParam('pl_complete', []);
if (!empty($pl_complete) && is_array($pl_complete)) {

    $bsn_id = (int) ($pl_complete['bsn_id'] ?? 0);
    $pl_key = $pl_complete['pltc_key'] ?? '';

    unset($pl_complete['bsn_id'], $pl_complete['pltc_key']);

    $dt   = date('d-m-Y');
    $user = $_SESSION['user']['user_name'];

    foreach ($pl_complete as $pltc_id => $completed_value) {

        $pltc_id = (int)$pltc_id;
        $completed_val = ((int)$completed_value === 1) ? 1 : 0;

        $pltcDetail = [
            'pltc_completed' => $completed_val,
            'pltc_completed_by' => $user,
            'pltc_completed_date' => $dt,
            'pltc_bsn_id' => $bsn_id,
            'pltc_sp_id' => $pltc_id,
            'pltc_key' => $pl_key
        ];

        $pltcTable = new Fw_Db_Table("prospect_list_tab_completed");
        $pltcTable->setWhere(
            'pltc_bsn_id = ' . $bsn_id .
            ' AND pltc_sp_id = ' . $pltc_id
        );

        if ($pltcTable->rowExists()) {
            $pltcTable->updateRow($pltcDetail);
        } else {
            $pltcTable->insertRow($pltcDetail);
        }
    }

    $redirectUrl = $_SERVER['REQUEST_URI'];
    header("Location: $redirectUrl");
    exit;
}

/*Lead Generation*/
$fwViewData['lead_template'] =  $_SERVER['DOCUMENT_ROOT'] . '/site/modules/prospect_list/frontend/lead_template.tpl';
$sql_lead = "SELECT * FROM lead_standard_procedure order by lsp_doc_sequence asc";
$data_lead = $fwDb->query($sql_lead);
$fwViewData['lead'] = $data_lead;

$pl_lead_completeTable = new Fw_Db_Table('prospect_list_tab_completed');
$pl_lead_completeTable->setWhere(" pltc_key = 'lead' AND pltc_bsn_id = $bsn_id ");
$fwViewData['lead_pl_complete'] = $pl_lead_completeTable->getAllRows();

/*Onboarding*/
$fwViewData['onboarding_template'] =  $_SERVER['DOCUMENT_ROOT'] . '/site/modules/prospect_list/frontend/onboarding_template.tpl';
$sql_onboarding = "SELECT * FROM onboarding_standard_procedure order by osp_doc_sequence asc ";
$data_onboarding = $fwDb->query($sql_onboarding);
$fwViewData['onboarding'] = $data_onboarding;

$pl_onboarding_completeTable = new Fw_Db_Table('prospect_list_tab_completed');
$pl_onboarding_completeTable->setWhere(" pltc_key = 'onboarding' AND pltc_bsn_id = $bsn_id ");
$fwViewData['onboarding_pl_complete'] = $pl_onboarding_completeTable->getAllRows();


/*Finance Template*/
$fwViewData['finance_template'] =  $_SERVER['DOCUMENT_ROOT'] . '/site/modules/prospect_list/frontend/finance_template.tpl';
$sql_finance = "SELECT * FROM prospect_list_financial_report where plfr_bsn_id = ".$bsn_id;
$data_finance = $fwDb->query($sql_finance);
$fwViewData['finance_list'] = $data_finance;


/*Invoices Template*/
$fwViewData['invoices_template'] =  $_SERVER['DOCUMENT_ROOT'] . '/site/modules/prospect_list/frontend/invoices_template.tpl';
$sql_invoices = "SELECT * FROM prospect_list_invoices_report where plir_bsn_id = ".$bsn_id;
$data_invoices = $fwDb->query($sql_invoices);
$fwViewData['invoices_list'] = $data_invoices;

// Save Paid/Settle Record
$plir_paid = $fwRequest->getParam('plir_paid', '');
if (!empty($plir_paid)) {
	$dt = date('d-m-Y');
	$user = $_SESSION['user']['user_name'];
	$key = array_keys($plir_paid);
	$ky = $key[0];

	$invDetail['plir_paid'] = $plir_paid[$ky];
	$invDetail['plir_paid_user'] = $user;
	$invDetail['plir_paid_date'] = $dt;

	$invTable = new Fw_Db_Table("prospect_list_invoices_report");
	$invTable->setWhere('plir_id = ' . $ky);
	$invDetailUpdate = $invTable->updateRow($invDetail);
	$redirectUrl = $_SERVER['REQUEST_URI'];
	header("Location: $redirectUrl");
	exit;
}
//End Paid/Settle Record