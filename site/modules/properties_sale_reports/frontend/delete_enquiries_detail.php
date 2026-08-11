<?php
$this_id = (int)$fwRequest->getparam('psre_id', 0);
$bsn_id = (int)$fwRequest->getparam('bsn_id', 0);

if ($this_id > 0) {
	$thisTable = new Fw_Db_Table('properties_sale_reports_enquiries');
	$thisTable->setWhere("psre_id = $this_id and psre_bsn_id = $bsn_id");
	$row = $thisTable->getRow();

	$thisTable->setWhere("psre_id = $this_id and psre_bsn_id = $bsn_id");
	$thisTable->deleteRow();

	if ($row && (trim($row['psre_phone_number']) !== '' || trim($row['psre_email_address']) !== '')) {
		$apiBsnId = !empty($row['psre_bsn_id']) ? (int)$row['psre_bsn_id'] : $bsn_id;
		$payload = array(
			'bsn_id' => $apiBsnId,
			'psre_phone_number' => $row['psre_phone_number'],
			'psre_email_address' => $row['psre_email_address'],
		);

		$curl = curl_init();
		curl_setopt_array($curl, array(
			CURLOPT_URL => 'https://openhomeconnect.com.au/api/external/enquiries',
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_CUSTOMREQUEST => 'DELETE',
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
}

Location(BASE_URL . "properties_sale_reports.view_project/bsn_id/$bsn_id");
