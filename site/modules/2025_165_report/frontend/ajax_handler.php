<?php
    $tableqa = new Fw_Db_Table($TABLE);
    $postedData = $_POST;
    $response = ['status' => false, 'errorList' => [], 'success' => true, 'action' => '', 'data' => []];
    if(empty($postedData['action'])){
        $response['success'] = false;
        $response['errorList'][] = 'Invalid method';
        echo json_encode($response);
        exit;
    }
    if ($postedData['action'] == 'updateBreachTest') {
        $record_id = $postedData['r_ID'];
        $detail['os2_breach_test'] = $postedData['os2_breach_test'];
        $tableqa->setWhere("$ID = $record_id");
		$opr = $tableqa->updateRow($detail);
        echo json_encode($response);
        exit;
    }