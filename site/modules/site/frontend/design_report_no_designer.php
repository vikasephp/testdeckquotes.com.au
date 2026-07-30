<?php

/**
 * Send SMS to Json when no designer is assigned in https://www.deckquotes.com.au/design_report.home_active
 */

$query = "Select document_proposal_name.dpn_bsn_id, document_proposal_name.dpn_unique_id, business.bsn_address from document_proposal_name Left join business on business.bsn_id = document_proposal_name.dpn_bsn_id where document_proposal_name.dpn_dr_hide = 0 and (document_proposal_name.dpn_customer_designer = '' or document_proposal_name.dpn_customer_designer is null) ";
$data = $fwDb->query($query);

$username = "manojsoniephp";
$password = "jaimatadi108";

//echo "<pre>"; print_r($data); exit('checking');

if (!empty($data)) {
	
	$projects = [];
	foreach ($data as $row) {
		$bsnId = $row['dpn_bsn_id'];

		if (!isset($projects[$bsnId])) {
			$projects[$bsnId] = [
				'address' => $row['bsn_address'],
				'checklists' => []
			];
		}

		$projects[$bsnId]['checklists'][] = $row['dpn_unique_id'];
	}

	foreach ($projects as $project) {

		$checklistNumbers = implode(', ', $project['checklists']);

		$message = "Hi Jason, a new design agreement has been signed for a project [{$checklistNumbers}, {$project['address']}], but no designer has been assigned yet. Please review the Designs Active Report and allocate a designer at the earliest. Appreciate your prompt attention.";
		
		$type = "1-way";
		$senderid = "CGFB";
		//$to = "61485982524";
		$to = "61403386374";

		// Send SMS
		$url = "http://api.directsms.com.au/s3/http/send_message?" .
			   "username=" . urlencode($username) . "&" .
			   "password=" . urlencode($password) . "&" .
			   "message=" . urlencode($message) . "&" .
			   "type=" . urlencode($type) . "&" .
			   "senderid=" . urlencode($senderid) . "&" .
			   "to=" . urlencode($to);

		$output = file($url);

		print_r($output);
	}

    /*foreach ($data as $row) {
		$dpn_bsn_id = $row['dpn_bsn_id'];
		$dpn_unique_id = $row['dpn_unique_id'];
		$bsn_address = $row['bsn_address'];
		
		$message = "Hi Json, a new design agreement has been signed for a project - [Checklist No. {$dpn_unique_id} - {$bsn_address}], but no designer has been assigned yet. Please review the Designs Report and allocate a designer at the earliest. Appreciate your prompt attention.";

		$type = "1-way";
		$senderid = "CGFB";
		$to = "61485982524";

		$url = "http://api.directsms.com.au/s3/http/send_message?" .
			   "username=" . urlencode($username) . "&" .
			   "password=" . urlencode($password) . "&" .
			   "message=" . urlencode($message) . "&" .
			   "type=" . urlencode($type) . "&" .
			   "senderid=" . urlencode($senderid) . "&" .
			   "to=" . urlencode($to);

		$output = file($url);

		if ($output !== false) {
			$response = explode(':', $output[0]);
			print_r($response);
		}
	}*/
} else {
    exit;
}

exit;