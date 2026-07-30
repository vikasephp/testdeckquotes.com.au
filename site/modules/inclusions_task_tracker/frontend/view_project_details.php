<?php

$final_list = [];
$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);
$bsn_name = '';
// db($_SESSION);
if ($bsn_id > 0) {
    $sql = 'SELECT bsn_name FROM business WHERE bsn_id = ' . $bsn_id;
    $result = $fwDb->queryOne($sql);
    $bsn_name = $result['bsn_name'];
    $where = 'WHERE BST.bst_business_status_id = 5 AND BT.bt_bsn_id = ' . $bsn_id . ' AND BT.bt_task_status_id = 5';

    $show_all = $fwRequest->getParam('show_all', '');
    if ($show_all) {
        $_SESSION['show_all'] = $show_all;
    }

    $bt_id = (int)$fwRequest->getParam('bt_id', 0);
    $save_status = $fwRequest->getParam('save_status', '');
    $task_status = $fwRequest->getParam('task_status', '');
    if ($save_status && $bt_id > 0) {
        $this_table = new Fw_Db_Table('business_tasks');
        $this_table->setWhere('bt_id = ' . $bt_id);
        if (!empty($this_table->getRow())) {
            $data = [];
            if ($task_status == 'complete') {
                $data = [
                    'bt_complete' => 1,
                    'bt_task_not_required' => 0,
                    'bt_completed_date' => date('Y-m-d H:i:s'),
                    'bt_completed_by' => $_SESSION['user']['user_id'],
                ];
            } elseif ($task_status == 'not_required') {
                $data = [
                    'bt_complete' => 0,
                    'bt_task_not_required' => 1,
                    'bt_task_not_required_at' => date('Y-m-d H:i:s'),
                    'bt_task_not_required_by' => $_SESSION['user']['user_id']
                ];
            } else {
                $data = [
                    'bt_complete' => 0,
                    'bt_task_not_required' => 0,
                    'bt_task_not_completed_at' => date('Y-m-d H:i:s'),
                    'bt_task_not_completed_by' => $_SESSION['user']['user_id']
                ];
            }
            if (!empty($data)) {
                $this_table->updateRow($data);
            }
        }
    }

    $filter_keyword = $fwRequest->getParam('filter_keyword', '');
    $search_keyword = $fwRequest->getParam('search_keyword', '');
    if ($search_keyword && $filter_keyword) {
        $_SESSION['filter_keyword'] = $filter_keyword;
    }

    $clear_search = $fwRequest->getParam('clear_search', '');
    if ($clear_search) {
        unset($_SESSION['show_all']);
        unset($_SESSION['filter_keyword']);
    }

    if (isset($_SESSION['show_all'])) {
        $where .= '';
    } else {
        $where .= ' AND (bt_completed_date IS NULL OR bt_completed_date = "0000-00-00 00:00:00" OR bt_complete = 0)';
    }

    if (isset($_SESSION['filter_keyword'])) {
        $filter_keyword = $_SESSION['filter_keyword'];
        $fwViewData['filter_keyword'] = $filter_keyword;

        $where .= ' AND (BST.bst_task_name LIKE "%' . $filter_keyword . '%" OR BST.bst_task_id = "' . $filter_keyword . '")';
    }

    $sql = 'SELECT BST.bst_id, BST.bst_task_id, BST.bst_task_name, BST.bst_posid, BST.bst_order, BST.bst_auto_email_text, BST.bst_auto_sms_text, BT.bt_id, BT.bt_task_status_id, BT.bt_task_not_required, BT.bt_task_not_required_at, BT.bt_task_not_required_by, BT.bt_complete, BT.bt_completed_date, BT.bt_completed_by, BT.bt_task_not_completed_at, BT.bt_task_not_completed_by FROM busness_status_task AS BST INNER JOIN business_tasks AS BT ON BT.bt_task_id = BST.bst_id ' . $where . ' ORDER BY BST.bst_order ASC';
    $result = $fwDb->query($sql);
    $busness_status_task = $result;
    $bstIDs = [];
    foreach ($result as $row) {
        $bstIDs[] = $row['bst_task_id'];
    }

    $sql = 'SELECT user_id, user_name FROM users';
    $result = $fwDb->query($sql);
    $users = [];
    foreach ($result as $row) {
        $users[$row['user_id']] = $row['user_name'];
    }

    $sql = 'SELECT p_id, p_name FROM positions';
    $result = $fwDb->query($sql);
    $positions = [];
    foreach ($result as $row) {
        $positions[$row['p_id']] = $row['p_name'];
    }

    $sql = 'SELECT COUNT(*) AS total, bts_task_id FROM business_tasks_sub WHERE bts_task_id IN (' . implode(',', $bstIDs) . ') AND bts_bsn_id = ' . $bsn_id . ' GROUP BY bts_task_id';
    $result = $fwDb->query($sql);
    $totalSubTasks = [];
    foreach ($result as $row) {
        $totalSubTasks[$row['bts_task_id']] = $row['total'];
    }

    $sql = 'SELECT COUNT(*) AS total, bts_task_id FROM business_tasks_sub WHERE bts_task_id IN (' . implode(',', $bstIDs) . ') AND bts_bsn_id = ' . $bsn_id . ' AND bts_complete = 1 GROUP BY bts_task_id';
    $result = $fwDb->query($sql);
    $completedSubTasks = [];
    foreach ($result as $row) {
        $completedSubTasks[$row['bts_task_id']] = $row['total'];
    }

    $sql = 'SELECT eml_id, eml_link_uid, eml_code FROM emaillibrary WHERE eml_link_uid != ""';
    $result = $fwDb->query($sql);
    $emaillibrary = [];
    foreach ($result as $row) {
        $eml_link_uid = $row['eml_link_uid'];
        foreach (explode(',', $eml_link_uid) as $num) {
            $num = (int)$num;
            if (in_array($num, $bstIDs)) {
                if (!isset($emaillibrary[$num])) {
                    $emaillibrary[$num] = [];
                }
                $emaillibrary[$num][] = [
                    'eml_id' => $row['eml_id'],
                    'eml_code' => $row['eml_code'],
                ];
            }
        }
    }

    $sql = 'SELECT THD.dhd_link_pdf, THD.dhd_link_word, BSTM.btp_bst_id, BSTM.btp_doc_longtext FROM busness_status_task_msteam AS BSTM INNER JOIN template_hub_docs THD ON THD.dhd_dh_id = BSTM.btp_doc WHERE BSTM.btp_bst_id IN (' . implode(',', $bstIDs) . ')';
    $result = $fwDb->query($sql);
    $busness_status_task_msteam = [];
    foreach ($result as $row) {
        if (!isset($busness_status_task_msteam[$row['btp_bst_id']])) {
            $busness_status_task_msteam[$row['btp_bst_id']] = [];
        }
        $busness_status_task_msteam[$row['btp_bst_id']][] = $row;
    }

    $sql = 'SELECT ps_task_id, COUNT(*) AS total FROM ps_que_ans GROUP BY ps_task_id;';
    $result = $fwDb->query($sql);
    $ps_que_ans_total = [];
    foreach ($result as $row) {
        $ps_que_ans_total[$row['ps_task_id']] = $row['total'];
    }

    $counter = 1;
    foreach ($busness_status_task as $row) {
        $linkedEmails = '';
        if (isset($emaillibrary[$row['bst_task_id']])) {
            foreach ($emaillibrary[$row['bst_task_id']] as $temp) {
                $linkedEmails .= ('<p style="margin: 0;"><a href="/emaillibrary.compose/eml_id/' . $temp['eml_id'] . '" target="_blank">' . $temp['eml_code'] . '</a></p>');
            }
        }
        $linkedMsteams = '';
        if (isset($busness_status_task_msteam[$row['bst_task_id']])) {
            $linkedMsteams .= '<p style="margin: 0; font-weight: bold;">MsTeam Document Links</p>';
            foreach ($busness_status_task_msteam[$row['bst_task_id']] as $temp) {
                if ($temp['dhd_link_pdf']) {
                    $linkedMsteams .= ('<p style="margin: 0;"><a href="' . $temp['dhd_link_pdf'] . '" target="_blank">' . $temp['btp_doc_longtext'] . '-PDF</a></p>');
                }
                if ($temp['dhd_link_word']) {
                    $linkedMsteams .= ('<p style="margin: 0;"><a href="' . $temp['dhd_link_word'] . '" target="_blank">' . $temp['btp_doc_longtext'] . '-Word</a></p>');
                }
            }
        }

        $auto = '<strong>Email: </strong>' . ($row['bst_auto_email_text'] == 1 ? 'Yes' : 'No');
        $auto .= '<br><strong>Text: </strong>' . ($row['bst_auto_sms_text'] == 1 ? 'Yes' : 'No');

        $statusUserAndDate = '';
        $statusColor = 'red';
        if (isset($users[$row['bt_task_not_completed_by']])) {
            $statusUserAndDate .= ('<p>' . $users[$row['bt_task_not_completed_by']] . '</p>');
        }
        if (strtotime($row['bt_task_not_completed_at']) > 0) {
            $statusUserAndDate .= ('<p>' . date('d-M-Y', strtotime($row['bt_task_not_completed_at'])) . '</p>');
        }
        if ($row['bt_complete']) {
            $statusUserAndDate = '';
            $statusColor = 'green';
            if (isset($users[$row['bt_completed_by']])) {
                $statusUserAndDate .= ('<p>' . $users[$row['bt_completed_by']] . '</p>');
            }
            if (strtotime($row['bt_completed_date']) > 0) {
                $statusUserAndDate .= ('<p>' . date('d-M-Y', strtotime($row['bt_completed_date'])) . '</p>');
            }
        } elseif ($row['bt_task_not_required']) {
            $statusUserAndDate = '';
            $statusColor = 'gray';
            if (isset($users[$row['bt_task_not_required_by']])) {
                $statusUserAndDate .= ('<p>' . $users[$row['bt_task_not_required_by']] . '</p>');
            }
            if (strtotime($row['bt_task_not_required_at']) > 0) {
                $statusUserAndDate .= ('<p>' . date('d-M-Y', strtotime($row['bt_task_not_required_at'])) . '</p>');
            }
        }

        $final_list[] = [
            'bt_id' => $row['bt_id'],
            'status_color' => $statusColor,
            'status_user_and_date' => $statusUserAndDate,
            'is_completed' => $row['bt_complete'],
            'not_required' => $row['bt_task_not_required'],
            'uid' => $row['bst_task_id'],
            // 'seq' => $row['bst_order'],
            'seq' => $counter++,
            'total_subtasks' => $totalSubTasks[$row['bst_task_id']] ?? 0,
            'completed_subtasks' => $completedSubTasks[$row['bst_task_id']] ?? 0,
            'task_name' => $row['bst_task_name'],
            'position' => $positions[$row['bst_posid']],
            'linked_emails' => $linkedEmails,
            'linked_msteams' => $linkedMsteams,
            'total_ques' => $ps_que_ans_total[$row['bst_task_id']] ?? 0,
            'auto' => $auto,
        ];
    }
}

$fwViewData['bsn_id'] = $bsn_id;
$fwViewData['title'] = 'Project Details ' . $bsn_name;
$fwViewData['final_list'] = $final_list;
