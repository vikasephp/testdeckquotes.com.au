<?php
$fwMainView = 'file:' . getcwd() . '/view_edit_project.tpl';

$thisTable = new Fw_Db_Table('quote_builder_component');
$fwViewData['componentData'] = $thisTable->getAllRows(); 

$sql = "SELECT  bsn_id, bsn_name from business";
$fwViewData['projdetail'] = $fwDb->query($sql);

$table_qmr = new Fw_Db_Table('quote_management_report');
$fwViewData['qmrData'] = $table_qmr->getAllRows();

$submit = $fwRequest->getParam('subAddDetail', '');

if (!empty($submit)) {
    $detail = $fwRequest->getParam('qmr', array());
    $fwViewData['detail'] = $detail;

    $projectName = trim($detail['qm_project']);
    $components = $detail['components'] ?? [];

    if (!empty($projectName) && !empty($components)) {
        foreach ($components as $qb_id => $action) {
            if ((int)$action > 0 && !empty($qb_id)) {
                $qb_id_safe = (int)$qb_id;
                $action_safe = (int)$action;
                $projectNameSafe = addslashes(trim($projectName));
				
				//echo "<pre>"; print_r($_POST); echo "<br/>Project Name is ".$projectNameSafe; echo "<br/>qb_id_safe is ".$qb_id_safe; echo "<br/>action_safe ".$action_safe;  exit();

                // Check if record exists
                /* $existingRows = $table_qmr->getAllRows([
                    'qm_project' => $projectName,
                    'qm_component' => $qb_id
                ]); */
				
				$sql_check = "SELECT COUNT(*) as count FROM quote_management_report WHERE qm_project = '$projectNameSafe' AND qm_component = $qb_id_safe";
				$existingRows = $fwDb->queryOne($sql_check);
				$existingRows = is_array($existingRows) ? $existingRows['count'] : 0;
				
				//echo $existingRows; exit();

				//echo "<pre>"; print_r($existingRows); exit();
                if ($existingRows > 0) {
                    $whereClause = "qm_project = '$projectNameSafe' AND qm_component = $qb_id_safe";
					
					/* echo "<br/> WHERE clause: " . $whereClause;
					echo "<br/> Project: " . $projectNameSafe;
					echo "<br/> Component ID: " . $qb_id_safe;
					echo "<br/> Action: " . $action_safe;
					exit(); */
					
					$sql_update = "UPDATE quote_management_report SET qm_component_action = $action_safe WHERE qm_project = '$projectNameSafe' AND qm_component = $qb_id_safe";
					$fwDb -> queryOne($sql_update);
				
                    /* $table_qmr->updateRow(
                        ['qm_component_action' => $action_safe],
                        $whereClause
                    ); */
                } else {
                    $table_qmr->insertRow([
                        'qm_project' => $projectNameSafe,
                        'qm_component' => $qb_id_safe,
                        'qm_component_action' => $action_safe
                    ]);
                }

                $opr = true;
            }
        }
    }

    $fwViewData['opr'] = $opr ?? false;
    unset($_SESSION['selected_project']);
}

$selectedProject = $fwRequest->getParam('selected_project', '');
if (!empty($selectedProject)) {
    $_SESSION['selected_project'] = $selectedProject;
	$fwViewData['detail']['qm_project'] = $_SESSION['selected_project'];
	$fwViewData['project_get'] = $_SESSION['selected_project'];
}