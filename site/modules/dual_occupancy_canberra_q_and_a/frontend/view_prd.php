<?php
$fwMainView = 'file:' . getcwd() . '/view_prd.tpl';

$thisTable = new Fw_Db_Table("dual_occupancy_canberra_qanda");


$previewPublicRankData = array();
if (isset($_SESSION['previewPublicRankData'])) {
    $previewPublicRankData = $_SESSION['previewPublicRankData'];
}

$fwViewData['previewPublicRankData'] = $previewPublicRankData;

$subAddDetail = $fwRequest->getParam('subAddDetail', 0);

if ($subAddDetail && !empty($_SESSION['previewPublicRankData'])) {

    foreach ($_SESSION['previewPublicRankData'] as $row) {

		$docqaId = (int)str_replace('QAIDDO', '', $row['docqa_id']);
        $newRank = trim($row['new_public_rank']);

        if ($docqaId <= 0 || $newRank == '') {
            continue;
        }

        $updateData = array(
            'docqa_public_rank' => $newRank
        );

        $thisTable->setWhere("docqa_id = ".$docqaId);
        $thisTable->updateRow($updateData);
    }

    unset($_SESSION['previewPublicRankData']);
    $fwViewData['opr'] = 1;
}