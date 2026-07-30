<?php

$idw = $fwRequest->getParam('dpn_unique_id_w', '');
$ide = $fwRequest->getParam('dpn_unique_id_e', '');
$idg = $fwRequest->getParam('dpn_unique_id_g', '');
$ids = $fwRequest->getParam('dpn_unique_id_s', '');
$idt = $fwRequest->getParam('dpn_unique_id_t', '');
$idh = $fwRequest->getParam('dpn_unique_id_h', '');

$value = $fwRequest->getparam('value', '');
$value = str_replace('%20', ' ', $value);

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if (!empty($idw)) {
	$sql = "Update document_proposal_name set  dpn_water_ref  = '" . $value . "' where dpn_unique_id = " . $idw;
	$fwDb->queryOne($sql);

	$sql2 = "Update document_proposal_name set  dpn_water_ref_date  = '" . $dt . "' where dpn_unique_id = " . $idw;
	$fwDb->queryOne($sql2);

	$sql3 = "Update document_proposal_name set  dpn_water_ref_user  = '" . $user . "' where dpn_unique_id = " . $idw;
	$fwDb->queryOne($sql3);

	$sqlT = "select dpn_bsn_id, dpn_water_ref_date, dpn_water_ref_user from document_proposal_name where dpn_unique_id = " . $idw;
	$dataT = $fwDb->queryOne($sqlT);

	$output = $dataT['dpn_water_ref_date'] . "<br>" . $dataT['dpn_water_ref_user'];

	// $entityReferral = $fwDb->queryOne('SELECT er_id FROM entities_referral WHERE er_dc_uid = 627');
	// $updateEntityReferralStatus = $fwDb->queryOne('UPDATE checklist_entities_referral SET `status` = "' . $value . '" WHERE bsn_id = ' . $dataT['dpn_bsn_id'] . ' AND entites_referral_id = ' . $entityReferral['er_id'] . ';');

	//echo "Tana";
	echo $output;
}


if (!empty($ide)) {
	$sql = "Update document_proposal_name set  dpn_electric_ref  = '" . $value . "' where dpn_unique_id = " . $ide;
	$fwDb->queryOne($sql);

	$sql2 = "Update document_proposal_name set  dpn_electric_ref_date  = '" . $dt . "' where dpn_unique_id = " . $ide;
	$fwDb->queryOne($sql2);

	$sql3 = "Update document_proposal_name set  dpn_electric_ref_user  = '" . $user . "' where dpn_unique_id = " . $ide;
	$fwDb->queryOne($sql3);

	$sqlT = "select dpn_bsn_id, dpn_electric_ref_date, dpn_electric_ref_user from document_proposal_name where dpn_unique_id = " . $ide;
	$dataT = $fwDb->queryOne($sqlT);

	$output = $dataT['dpn_electric_ref_date'] . "<br>" . $dataT['dpn_electric_ref_user'];

	// $entityReferral = $fwDb->queryOne('SELECT er_id FROM entities_referral WHERE er_dc_uid = 628');
	// $updateEntityReferralStatus = $fwDb->queryOne('UPDATE checklist_entities_referral SET `status` = "' . $value . '" WHERE bsn_id = ' . $dataT['dpn_bsn_id'] . ' AND entites_referral_id = ' . $entityReferral['er_id'] . ';');
	//echo "Tana";
	echo $output;
}

if (!empty($idg)) {
	$sql = "Update document_proposal_name set  dpn_gas_ref  = '" . $value . "' where dpn_unique_id = " . $idg;
	$fwDb->queryOne($sql);

	$sql2 = "Update document_proposal_name set  dpn_gas_ref_date  = '" . $dt . "' where dpn_unique_id = " . $idg;
	$fwDb->queryOne($sql2);

	$sql3 = "Update document_proposal_name set  dpn_gas_ref_user  = '" . $user . "' where dpn_unique_id = " . $idg;
	$fwDb->queryOne($sql3);

	$sqlT = "select dpn_bsn_id, dpn_gas_ref_date, dpn_gas_ref_user from document_proposal_name where dpn_unique_id = " . $idg;
	$dataT = $fwDb->queryOne($sqlT);

	$output = $dataT['dpn_gas_ref_date'] . "<br>" . $dataT['dpn_gas_ref_user'];

	// $entityReferral = $fwDb->queryOne('SELECT er_id FROM entities_referral WHERE er_dc_uid = 629');
	// $updateEntityReferralStatus = $fwDb->queryOne('UPDATE checklist_entities_referral SET `status` = "' . $value . '" WHERE bsn_id = ' . $dataT['dpn_bsn_id'] . ' AND entites_referral_id = ' . $entityReferral['er_id'] . ';');
	//echo "Tana";
	echo $output;
}

if (!empty($ids)) {
	$sql = "Update document_proposal_name set   dpn_storm_ref  = '" . $value . "' where dpn_unique_id = " . $ids;
	$fwDb->queryOne($sql);

	$sql2 = "Update document_proposal_name set   dpn_storm_ref_date  = '" . $dt . "' where dpn_unique_id = " . $ids;
	$fwDb->queryOne($sql2);

	$sql3 = "Update document_proposal_name set   dpn_storm_ref_user  = '" . $user . "' where dpn_unique_id = " . $ids;
	$fwDb->queryOne($sql3);

	$sqlT = "select dpn_bsn_id, dpn_storm_ref_date, dpn_storm_ref_user from document_proposal_name where dpn_unique_id = " . $ids;
	$dataT = $fwDb->queryOne($sqlT);

	$output = $dataT['dpn_storm_ref_date'] . "<br>" . $dataT['dpn_storm_ref_user'];

	// $entityReferral = $fwDb->queryOne('SELECT er_id FROM entities_referral WHERE er_dc_uid = 630');
	// $updateEntityReferralStatus = $fwDb->queryOne('UPDATE checklist_entities_referral SET `status` = "' . $value . '" WHERE bsn_id = ' . $dataT['dpn_bsn_id'] . ' AND entites_referral_id = ' . $entityReferral['er_id'] . ';');
	//echo "Tana";
	echo $output;
}

if (!empty($idt)) {
	$sql = "Update document_proposal_name set   dpn_tree_ref  = '" . $value . "' where dpn_unique_id = " . $idt;
	$fwDb->queryOne($sql);

	$sql2 = "Update document_proposal_name set   dpn_tree_ref_date  = '" . $dt . "' where dpn_unique_id = " . $idt;
	$fwDb->queryOne($sql2);

	$sql3 = "Update document_proposal_name set   dpn_tree_ref_user  = '" . $user . "' where dpn_unique_id = " . $idt;
	$fwDb->queryOne($sql3);

	$sqlT = "select dpn_bsn_id, dpn_tree_ref_date, dpn_tree_ref_user from document_proposal_name where dpn_unique_id = " . $idt;
	$dataT = $fwDb->queryOne($sqlT);

	$output = $dataT['dpn_tree_ref_date'] . "<br>" . $dataT['dpn_tree_ref_user'];

	// $entityReferral = $fwDb->queryOne('SELECT er_id FROM entities_referral WHERE er_dc_uid = 382');
	// $updateEntityReferralStatus = $fwDb->queryOne('UPDATE checklist_entities_referral SET `status` = "' . $value . '" WHERE bsn_id = ' . $dataT['dpn_bsn_id'] . ' AND entites_referral_id = ' . $entityReferral['er_id'] . ';');
	//echo "Tana";
	echo $output;
}


if (!empty($idh)) {
	$sql = "Update document_proposal_name set   dpn_heritage_ref  = '" . $value . "' where dpn_unique_id = " . $idh;
	$fwDb->queryOne($sql);

	$sql2 = "Update document_proposal_name set   dpn_heritage_ref_date  = '" . $dt . "' where dpn_unique_id = " . $idh;
	$fwDb->queryOne($sql2);

	$sql3 = "Update document_proposal_name set   dpn_heritage_ref_user  = '" . $user . "' where dpn_unique_id = " . $idh;
	$fwDb->queryOne($sql3);

	$sqlT = "select dpn_bsn_id, dpn_heritage_ref_date, dpn_heritage_ref_user from document_proposal_name where dpn_unique_id = " . $idh;
	$dataT = $fwDb->queryOne($sqlT);

	$output = $dataT['dpn_heritage_ref_date'] . "<br>" . $dataT['dpn_heritage_ref_user'];

	// $entityReferral = $fwDb->queryOne('SELECT er_id FROM entities_referral WHERE er_dc_uid = 716');
	// $updateEntityReferralStatus = $fwDb->queryOne('UPDATE checklist_entities_referral SET `status` = "' . $value . '" WHERE bsn_id = ' . $dataT['dpn_bsn_id'] . ' AND entites_referral_id = ' . $entityReferral['er_id'] . ';');
	//echo "Tana";
	echo $output;
}


exit;
