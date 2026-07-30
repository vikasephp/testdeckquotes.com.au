<?php
$fwMainView = 'file:' . getcwd() . '/log_customer_action.tpl';

$wa_id  = (int)$fwRequest->getParam('wa_id', '');
$bsn_id = (int)$fwRequest->getParam('bsn_id', '');

$fwViewData['wa_id']  = $wa_id;
$fwViewData['bsn_id'] = $bsn_id;

$tableWLCA = new Fw_Db_Table('warranty_log_customer_action_required');
$tableWLCA->setWhere("wlcar_wa_id = $wa_id");
$fwViewData['wlca'] = $tableWLCA->getAllRows();

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $wlca_id        = (int)($_POST['wlca_id'] ?? 0);
    $wa_id_post     = (int)($_POST['wa_id'] ?? 0);
    $bsn_id_post    = (int)($_POST['bsn_id'] ?? 0);
    $action_required = isset($_POST['action_required']) && $_POST['action_required'] == 1 ? 1 : 0;

    if ($wlca_id && $wa_id_post && $bsn_id_post) {

        // Check if record already exists
        $check = $fwDb->query("
            SELECT COUNT(*) AS cnt
            FROM warranty_log_customer_action_required
            WHERE wlcar_wlca_id = $wlca_id AND wlcar_wa_id = $wa_id_post
        ");

        $row = $check[0] ?? ['cnt' => 0]; // Access first row
        $exists = (int)$row['cnt'];

        if ($action_required == 1 && $exists === 0) {
            // Insert new record
			$detail = [
				'wlcar_wa_id'   => $wa_id_post,
				'wlcar_bsn_id'  => $bsn_id_post,
				'wlcar_wlca_id' => $wlca_id
			];
			
			$tableWLCA->insertRow($detail);
        } elseif ($action_required == 0 && $exists > 0) {
            // Delete existing record
           /* $fwDb->query("DELETE FROM warranty_log_customer_action_required WHERE wlcar_wlca_id = $wlca_id AND wlcar_wa_id = $wa_id_post "); */
			
			$tableWLCA->setWhere("wlcar_wlca_id = $wlca_id AND wlcar_wa_id = $wa_id_post");
			$tableWLCA->deleteRow();
        }
    }

    // Redirect to avoid form resubmission
    header("Location: " . $_SERVER['REQUEST_URI']);
    exit;
}

$thisTable = new Fw_Db_Table("warranty_log_customer_action");
$fwViewData['typedata'] = $thisTable->getAllRows();
