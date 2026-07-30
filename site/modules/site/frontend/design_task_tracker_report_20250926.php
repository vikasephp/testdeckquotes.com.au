<?php
require_once LIB_DIR . 'EmailClass.php';
$emailObj = new EmailClass;

$errorLog = [];

$sql = 'SELECT TDT.tdt_id, TDT.tdt_dt_id, TDT.tdt_task_desc, TDT.tdt_task_assignee, TDT.tdt_task_assigner, TDT.tdt_due_date, TDT.tdt_status, DT.dt_checklist_no FROM task_designer_tracker AS TDT LEFT JOIN designer_tracker AS DT ON DT.dt_id = TDT.tdt_dt_id WHERE TDT.tdt_status != "COMPLETE" AND DT.dt_checklist_no IS NOT NULL ORDER BY TDT.tdt_id DESC;';
$result = $fwDb->query($sql);

if(!empty($result)) {
    $checkListNos = [];
    foreach($result as $row) {
        $checkListNos[] = $row['dt_checklist_no'];
    }

    $bsnIDs = [];
    $sql = 'SELECT dpn_bsn_id, dpn_unique_id FROM document_proposal_name WHERE dpn_unique_id IN (' . implode(',', $checkListNos) . ')';
    $res = $fwDb->query($sql);
    foreach($res as $row) {
        $bsnIDs[$row['dpn_unique_id']] = $row['dpn_bsn_id'];
    }
    $sql = 'SELECT dpn_bsn_id, dpn_unique_id FROM document_renovation_name WHERE dpn_unique_id IN (' . implode(',', $checkListNos) . ')';
    $res = $fwDb->query($sql);
    foreach($res as $row) {
        $bsnIDs[$row['dpn_unique_id']] = $row['dpn_bsn_id'];
    }

    $bsnNames = [];
    $sql = 'SELECT bsn_id, bsn_name FROM business WHERE bsn_id IN (' . implode(',', $bsnIDs) . ')';
    $res = $fwDb->query($sql);
    foreach($res as $row) {
        $bsnNames[$row['bsn_id']] = $row['bsn_name'];
    }

    $query = "SELECT * FROM email_signature where es_id = 203";
    $signatureRes = $fwDb->queryOne($query);
    $tdtIDs = [];
    $html = '
        <table border="1" cellpadding="10" cellspacing="0" style="border-collapse: collapse">
            <thead>
                <tr>
                    <th>Project Address</th>
                    <th>Checklist<br>Number</th>
                    <th>Status</th>
                    <th>Due Date</th>
                    <th>Assigner</th>
                    <th>Assignee</th>
                    <th>Task ID</th>
                    <th>Task Description</th>
                    <th>Link to View<br>and Add<br>Comments</th>
                </tr>
            </thead>
            <tbody>
        ';
    foreach($result as $row) {
        $tdtIDs[] = $row['tdt_id'];
        $html .= '
                <tr>
                    <td>' . $bsnNames[$bsnIDs[$row['dt_checklist_no']]] . '</td>
                    <td>' . $row['dt_checklist_no'] . '</td>
                    <td>' . $row['tdt_status'] . '</td>
                    <td style="white-space: nowrap;">' . ( strtotime($row['tdt_due_date']) > 0 ? date('d-M-Y', strtotime($row['tdt_due_date'])) : '' ) . '</td>
                    <td>' . $row['tdt_task_assigner'] . '</td>
                    <td>' . $row['tdt_task_assignee'] . '</td>
                    <td>' . $row['tdt_id'] . '</td>
                    <td>' . $row['tdt_task_desc'] . '</td>
                    <td><a href="https://www.deckquotes.com.au/designer_tracker.view_comment/tc_task_id/' . $row['tdt_id'] . '/dt_id/' . $row['tdt_dt_id'] . '/tdt_dt_id/' . $row['tdt_dt_id'] . '" target="_blank">View</a></td>
                </tr>
        ';
    }
    $html .= '
            </tbody>
        </table>
        <p style="margin: 15px 0;">Kind Regards,<br>' . $signatureRes['es_name'] . '</p>';

    // db($html); die();
    
    $emailObj->subject = 'Design Task Tracker Report';
    $emailObj->message = $html;
    $emailObj->addFrom($signatureRes['es_reply_to'], $signatureRes['es_name']);
    // $emailObj->addTo('amans@ephpsolutions.com', 'Aman');
    // $emailObj->addTo('rahul@ephpsolutions.com', 'Rahul');
    $emailObj->addTo('designs@cgfb.com.au', 'Designs');
    $emailObj->addTo('ArchitectManager@cgfb.com.au', 'Architect Manager');
    $emailObj->addTo('DesignsandPlanning@cgfb.com.au', 'Designs And Planning');
    $emailObj->attachments = [];
    $response = $emailObj->sendEmail();
    $emailObj->logSendEmail($response, [
        'module_name' => 'designer_tracker.home',
        'table_name' => 'task_designer_tracker',
        'column_name' => 'tdt_id',
        'column_id' => implode(',', $tdtIDs),
    ]);
    if (!$response['success']) {
        $errorLog[] = [
            'to' => $emailObj->to,
            'subject' => $emailObj->subject,
            'error' => $response['message']
        ];
    }

    if (empty($errorLog)) {
        echo 'no error';
    } else {
        db($errorLog);
    }
}
else {
    echo 'no record';
}    

exit;