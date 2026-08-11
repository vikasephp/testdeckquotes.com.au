<?php
$fwMainView = 'file:' . getcwd() . '/enquiries_detail.tpl';
$tableTask = new Fw_Db_Table('properties_sale_reports_enquiries');

$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);
$fwViewData['bsn_id'] = $bsn_id;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['psre_id'];
	unset($detail['psre_id']);
	$existingRow = null;

    if($this_id > 0)
	{
		unset($detail['psre_id']);
		$tableTask->setWhere("psre_id = $this_id");
		$existingRow = $tableTask->getRow();
		$tableTask->setWhere("psre_id = $this_id");
		$opr = $tableTask->updateRow($detail);   
	}
	else
	{
		$opr = $tableTask->insertRow($detail); 
	}

	// sync buyer in openhomeconnect api
	if ($opr && (trim($detail['psre_phone_number']) !== '' || trim($detail['psre_email_address']) !== '')) {
		$apiBsnId = !empty($detail['psre_bsn_id']) ? (int)$detail['psre_bsn_id'] : $bsn_id;
		$payload = array(
			'bsn_id' => $apiBsnId,
			'psre_enquiry_name' => $detail['psre_enquiry_name'],
			'psre_enquiry_name_last' => $detail['psre_enquiry_name_last'],
			'psre_phone_number' => $detail['psre_phone_number'],
			'psre_email_address' => $detail['psre_email_address'],
			'psre_date_of_enqury' => $detail['psre_date_of_enqury'],
			'psre_status' => 'Active', // default status is Active
		);

		if ($this_id > 0 && $existingRow) {
			$payload['psre_phone_number_old'] = $existingRow['psre_phone_number'];
			$payload['psre_email_address_old'] = $existingRow['psre_email_address'];
			$payload['psre_status'] = $existingRow['psre_status']; // keep the existing status
		}

		$curl = curl_init();
		curl_setopt_array($curl, array(
			CURLOPT_URL => 'https://openhomeconnect.com.au/api/external/enquiries',
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_POST => true,
			CURLOPT_POSTFIELDS => json_encode($payload),
			CURLOPT_HTTPHEADER => array(
				'Content-Type: application/json',
				'Accept: application/json',
				'X-Api-Key: b8661f2598a380835864b93616ce66a7',
			),
		));
		curl_exec($curl);
		curl_close($curl);
	}

	$fwViewData['opr'] = $opr;	
}

$this_id = (int)$fwRequest->getParam('psre_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('properties_sale_reports_enquiries');
	$tableTask->setWhere("psre_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit Enquiries Detail';
}
else
{
    $fwViewData['title'] = 'Add Enquiries Detail';
}	
