<?php

$final_list = [];
$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);

if($bsn_id > 0) {
    $sql = 'SELECT BST.bst_id, BST.bst_task_id, BST.bst_task_name, BST.bst_order, BST.bst_auto_email_text, BST.bst_auto_sms_text, BT.bt_task_status_id FROM busness_status_task AS BST INNER JOIN business_tasks AS BT ON BT.bt_task_id = BST.bst_id WHERE BST.bst_business_status_id = 5 AND BT.bt_bsn_id = ' . $bsn_id . ' AND BT.bt_task_not_required != 1 AND (bt_completed_date IS NULL OR bt_completed_date = "0000-00-00 00:00:00") ORDER BY BST.bst_order ASC';
    // db($sql);
    $result = $fwDb->query($sql);
    $busness_status_task = $result;
    $bstIDs = [];
    foreach($result as $row) {
        $bstIDs[] = $row['bst_task_id'];
    }

    $sql = 'SELECT COUNT(*) AS total, bts_task_id FROM business_tasks_sub WHERE bts_task_id IN (' . implode(',', $bstIDs) . ') AND bts_bsn_id = ' . $bsn_id . ' GROUP BY bts_task_id';
    $result = $fwDb->query($sql);
    // db($sql);
    $totalSubTasks = [];
    foreach($result as $row) {
        $totalSubTasks[$row['bts_task_id']] = $row['total'];
    }

    $sql = 'SELECT COUNT(*) AS total, bts_task_id FROM business_tasks_sub WHERE bts_task_id IN (' . implode(',', $bstIDs) . ') AND bts_bsn_id = ' . $bsn_id . ' AND bts_complete = 1 GROUP BY bts_task_id';
    $result = $fwDb->query($sql);
    // db($sql);
    $completedSubTasks = [];
    foreach($result as $row) {
        $completedSubTasks[$row['bts_task_id']] = $row['total'];
    }

    $sql = 'SELECT eml_id, eml_link_uid, eml_code FROM emaillibrary WHERE eml_link_uid != ""';
    $result = $fwDb->query($sql);
    // db($sql);
    // db($result);
    $emaillibrary = [];
    foreach($result as $row) {
        $eml_link_uid = $row['eml_link_uid'];
        foreach(explode(',', $eml_link_uid) as $num) {
            $num = (int)$num;
            if(in_array($num, $bstIDs)) {
                if(!isset($emaillibrary[$num])) {
                    $emaillibrary[$num] = [];
                }
                $emaillibrary[$num][] = [
                    'eml_id' => $row['eml_id'],
                    'eml_code' => $row['eml_code'],
                ];
            }
        }
    }

    $sql = 'SELECT * FROM busness_status_task_procedures WHERE btp_bst_id IN (' . implode(',', $bstIDs) . ')';
    $result = $fwDb->query($sql);
    $busness_status_task_procedures = [];
    foreach($result as $row) {
        if(!isset($busness_status_task_procedures[$row['btp_bst_id']])) {
            $busness_status_task_procedures[$row['btp_bst_id']] = [];
        }
        $busness_status_task_procedures[$row['btp_bst_id']][] = $row;
    }
    $sql = 'SELECT THD.dhd_link_pdf, THD.dhd_link_word, BSTM.btp_bst_id, BSTM.btp_doc_longtext FROM busness_status_task_msteam AS BSTM INNER JOIN template_hub_docs THD ON THD.dhd_dh_id = BSTM.btp_doc WHERE BSTM.btp_bst_id IN (' . implode(',', $bstIDs) . ')';
    $result = $fwDb->query($sql);
    $busness_status_task_msteam = [];
    foreach($result as $row) {
        if(!isset($busness_status_task_msteam[$row['btp_bst_id']])) {
            $busness_status_task_msteam[$row['btp_bst_id']] = [];
        }
        $busness_status_task_msteam[$row['btp_bst_id']][] = $row;
    }

    foreach($busness_status_task as $row) {
        $linkedEmails = '';
        if(isset($emaillibrary[$row['bst_task_id']])) {
            foreach($emaillibrary[$row['bst_task_id']] as $temp) {
                $linkedEmails .= ('<p style="margin: 0;"><a href="/emaillibrary.compose/eml_id/' . $temp['eml_id'] . '" target="_blank">' . $temp['eml_code'] . '</a></p>');
            }
        }
        $linkedMsteams = '';
        if(isset($busness_status_task_procedures[$row['bst_task_id']])) {
            foreach($busness_status_task_procedures[$row['bst_task_id']] as $temp) {
                $linkedMsteams .= ('<p style="margin: 0;"><a href="/files/template_documents_hub/' . $temp['btp_doc'] . '" target="_blank">' . $temp['btp_doc_longtext'] . '</a></p>');
            }
        }
        if(isset($busness_status_task_msteam[$row['bst_task_id']])) {
            $linkedMsteams .= '<p style="margin: 10px 0 0; font-weight: bold;">MsTeam Document Links</p>';
            foreach($busness_status_task_msteam[$row['bst_task_id']] as $temp) {
                if($temp['dhd_link_pdf']) {
                    $linkedMsteams .= ('<p style="margin: 0;"><a href="' . $temp['dhd_link_pdf'] . '" target="_blank">' . $temp['btp_doc_longtext'] . '-PDF</a></p>');
                }
                if($temp['dhd_link_word']) {
                    $linkedMsteams .= ('<p style="margin: 0;"><a href="' . $temp['dhd_link_word'] . '" target="_blank">' . $temp['btp_doc_longtext'] . '-Word</a></p>');
                }
            }
        }
        
        $auto = '<strong>Email: </strong>' . ($row['bst_auto_email_text'] == 1 ? 'Yes' : 'No');
        $auto .= '<br><strong>Text: </strong>' . ($row['bst_auto_sms_text'] == 1 ? 'Yes' : 'No');
            

        $final_list[] = [
            'uid' => $row['bst_task_id'],
            'seq' => $row['bst_order'],
            'total_subtasks' => $totalSubTasks[$row['bst_task_id']] ?? 0,
            'completed_subtasks' => $completedSubTasks[$row['bst_task_id']] ?? 0,
            'task_name' => $row['bst_task_name'],
            'linked_emails' => $linkedEmails,
            'linked_msteams' => $linkedMsteams,
            'auto' => $auto,
        ];
    }
}

$fwViewData['title'] = 'Project Details';
$fwViewData['final_list'] = $final_list;