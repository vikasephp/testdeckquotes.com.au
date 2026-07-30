<?php
$tablebusiness_sub_tasks = new Fw_Db_Table('busness_status_subtask');
$tabletaskproc = new Fw_Db_Table('busness_status_task_procedures');
$tableQA = new Fw_Db_Table('ps_que_ans');

$bst_id = $fwRequest->getParam('bst_id', 0);

$sql = "SELECT busness_status_task.*, positions.p_name, busness_status.st_name FROM busness_status_task INNER JOIN positions ON busness_status_task.bst_posid = positions.p_id INNER JOIN busness_status ON busness_status_task.bst_business_status_id = busness_status.st_id WHERE busness_status_task.bst_id = $bst_id ORDER BY busness_status_task.bst_order";
$searchData = $fwDb->query($sql);

$html = '';
foreach ($searchData as $k => $v) {

    $bst_id = $v['bst_id'];

    $tabletaskproc->setWhere("btp_bst_id =" . $bst_id);
    $lp =  $tabletaskproc->getRows();

    $linked_pro = '';
    foreach ($lp as $k1 => $v1) {
        $linked_pro .= $v1['btp_doc'];
        if ($v1 <> end($lp)) {
            $linked_pro .= ", ";
        }
    }

    $tableEmailLibrary = new Fw_Db_Table('emaillibrary');
    $tableEmailLibrary->setWhere("eml_link_uid  like '%$bst_id%'");
    $emaillinkDetail = $tableEmailLibrary->getRows();

    $linked_email = '';
    foreach ($emaillinkDetail as $k2 => $v2) {
        $linked_email .= $v2['eml_code'];
        if ($v2 <> end($emaillinkDetail)) {
            $linked_email .= ", ";
        }
    }

    $tablebusiness_sub_tasks->setWhere("bsst_bst_id = $bst_id");
    $subtask_detail = $tablebusiness_sub_tasks->getRows();

    $subtask = '';
    foreach ($subtask_detail as $k3 => $v3) {
        $subtask .= "* " . $v3['bsst_task_name'] . '<br><br>';
    }

    $html .= "<div style='font-family:Calibri !important; font-size:15px;'>";
    $html .= "<h1 align='center'> Task UID " . $v['bst_task_id'] . "</h1>";
    $html .= "<p><b>Task Type</b> : Project </p>";
    $html .= "<p><b>Position Responsible : </b>" . $v['p_name'] . "</p>";
    $html .= "<p><b>Project Status : </b>" . $v['st_name'] . "</p>";
    $html .= "<p><b>Task Name : </b>" . $v['bst_task_name'] . "</p>";
    $html .= "<p><b>Instruction :</b></p>";
    $html .= "<div style='border:1px solid;padding:7px;'>" . $v['bst_instruction'] . "</div>";
    $html .= "<p><b>Linked Procedure : </b>" . $linked_pro . "</p>";
    $html .= "<p><b>Email Linked : </b>" . $linked_email . "</p>";
    $html .= "<p><b>Sub Tasks : </b></p>";
    $html .= "<div style='border:1px solid;padding:7px;'>" . $subtask . "</div>";
    $html .= "<p><b>Video Link : </b>" . $v['bst_video_link'] . "</p>";
    $html .= "</div>";

    $tableQA->setWhere("ps_task_id  = " . $bst_id);
    $qaDetail = $tableQA->getRows();

    foreach ($qaDetail as $k4 => $v4) {
        $html .= "<strong>Question</strong>: " . $v4['ps_question'] . "<br>";
        $html .= "<strong>Answer</strong>: " . strip_tags($v4['ps_answer']) . "<br><br>";
    }

    $html .= "<br style='page-break-before:always'>";
}


header("Content-type: application/vnd.ms-word.doc");
header("Content-Disposition: attachment;Filename=TaskList.doc");
echo "<html>";
echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=Windows-1252\">";
echo "<body>";
echo $html;
echo "</body>";
echo "</html>";

// db($bst_id);

exit;