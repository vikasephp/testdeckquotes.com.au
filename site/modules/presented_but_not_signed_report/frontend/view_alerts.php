<?php
$fwMainView = 'file:' . getcwd() . '/view_alerts.tpl';
$bsn_id = $fwRequest->getParam('bsn_id', '');

    $fwViewData['bsn_id'] = $bsn_id;

	$sql = "SELECT proposal_alert.* , users.user_name from proposal_alert
			Inner Join users on proposal_alert.be_user = users.user_id
			WHERE proposal_alert.be_business_id = ".$bsn_id;
	
    $proposalData = $fwDb->query($sql);
    $fwViewData['list'] = $proposalData;