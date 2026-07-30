<?php

$tablesSurveyData = new Fw_Db_Table('survey_data');

$submit = $fwRequest->getParam('subAddDetail', '');
$r_id = $fwRequest->getParam('sur_respondent_id', '');

if (!empty($submit)) {

	$DataFile = isset($_FILES['surveyresponse']['tmp_name']) ? $_FILES['surveyresponse']['tmp_name'] : '';
	if (!empty($DataFile)) {
		$zip = new ZipArchive;
		$res = $zip->open($DataFile);
		if ($res === TRUE) {
			$zip->extractTo(BASE_DIR . 'zip/');
			$zip->close();

			$handle = fopen(BASE_DIR . 'zip/CSV/Sheet_1.csv', 'r');

			while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
				$row_count++;
				foreach ($data as $key => $value) {
					if ($value) {
						$data[$key] = $value;
					}
				}
				$rows[] = implode("|*|", $data);
			}
		}
		$row = 1;
		$fieldnames = explode("|*|", $rows[0]);
		unset($rows[0]);

		foreach ($rows as $k => $v) {
			if ($v) {
				$colvalues = explode("|*|", $v);
				$res_id = $colvalues[0];

				$var = 0;

				if ($res_id) {
					$tablesSurveyData->setWhere("res_column_value = " . $res_id);


					if (!$tablesSurveyData->rowExists()) {
						foreach ($fieldnames as $k => $v) {
							$uploadData['res_respondent_id'] = $res_id;
							$uploadData['res_column_name'] = $v;
							$uploadData['res_column_value'] = $colvalues[$var];
							$var++;
							$respondent_id = $tablesSurveyData->insertRow($uploadData);
						}
					}
				}
				$row++;
			}
		}

		Location(BASE_URL . $XFA['list']);
	}
}


if ($r_id > 0) {
	$tablesSurveyData->setWhere("sur_respondent_id = $r_id");
	$detail = $tablesSurveyData->getRow();
	$fwViewData['detail'] = $detail;
	$fwViewData['title'] = 'Edit Survey Response';
} else {
	$fwViewData['title'] = 'Import Responses';
}
