<?php

$id = (int)$fwRequest->getParam('psre_id', '');
$value = $fwRequest->getparam('value', '');
$value = urldecode($value);

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if($id > 0){
	$sql_row = "select psre_bsn_id, psre_phone_number, psre_email_address from properties_sale_reports_enquiries where psre_id = ".$id;
	$row = $fwDb->queryOne($sql_row);

	$sql_1 = 'Update properties_sale_reports_enquiries set psre_interest = "'.$value.'" where psre_id = '.$id;	 
	$fwDb -> queryOne($sql_1);
	
	$sql_2 = 'Update properties_sale_reports_enquiries set psre_interest_user = "'.$user.'" where psre_id = '.$id;	 
	$fwDb -> queryOne($sql_2);
	
	$sql_3 = 'Update properties_sale_reports_enquiries set psre_interest_date = "'.$dt.'" where psre_id = '.$id;	 
	$fwDb -> queryOne($sql_3);

	if ($row && (trim($row['psre_phone_number']) !== '' || trim($row['psre_email_address']) !== '')) {
		$payload = array(
			'bsn_id' => (int)$row['psre_bsn_id'],
			'psre_phone_number' => $row['psre_phone_number'],
			'psre_email_address' => $row['psre_email_address'],
			'psre_interest' => $value,
		);

		$curl = curl_init();
		curl_setopt_array($curl, array(
			CURLOPT_URL => 'https://openhomeconnect.com.au/api/external/enquiries/interest',
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_CUSTOMREQUEST => 'PATCH',
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
	
	$sql_data_get = "select psre_interest_user, psre_interest_date from properties_sale_reports_enquiries where psre_id = ".$id;
	$data_get = $fwDb->queryOne($sql_data_get);
	
	echo $data_get['psre_interest_user']."<br/>".$data_get['psre_interest_date'];
	//echo json_encode($data_get);
}

exit();