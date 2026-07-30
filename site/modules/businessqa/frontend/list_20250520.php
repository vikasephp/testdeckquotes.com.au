<?php
//get the current limit
$memlimit = ini_get('memory_limit');
//set it to something else
ini_set("memory_limit", "2048M");
ini_set('max_execution_time', 0);
$pagenum = $fwRequest->getparam('pagenum', '');
$tablePages = new Fw_Db_Table($TABLE);

$submit = $fwRequest->getParam('search', '');
$orderby = $fwRequest->getParam('orderby', '');


$clear_search = $fwRequest->getParam('clear_search', '');
if(!empty($clear_search)) {
	unset($_SESSION['last_qandasql']);	
}

if ($orderby) {
    if ($orderby == "ASC") {
        $fwViewData['ord'] = "DESC";
    } else {
        $fwViewData['ord'] = "ASC";
    }
    $set_order = " business_qa.bqa_created_date " . $fwViewData['ord'];
    $_SESSION['ord'] = $fwViewData['ord'];
} elseif ($_SESSION['ord']) {
    $set_order = " business_qa.bqa_created_date " . $_SESSION['ord'];
    $fwViewData['ord'] = $_SESSION['ord'];
} else {
    $set_order = " business_qa.bqa_created_date DESC";
    $fwViewData['ord'] = "ASC";
}
if (!empty($submit)) {
    $detail = $fwRequest->getParam($TABLE, array());
    //db($detail);
    $where = " WHERE 1=1 and business.bsn_id > 0 ";
    $detail = clean_array($detail);
    if ($detail['bsn_name']) {
        $where .= " AND business.bsn_name LIKE '%" . $detail['bsn_name'] . "%'";
    }
    if ($detail['bcust_name']) {
        $where .= " AND bus_customers.bcust_fname LIKE '%" . $detail['bcust_name'] . "%' OR bus_customers.bcust_lname LIKE '%" . $detail['bcust_name'] . "%'";
    }
    if ($detail['p_name']) {
        $where .= " AND positions.p_name LIKE '%" . $detail['p_name'] . "%'";
    }
    if ($detail['qa_type']) {
        switch ($detail['qa_type']) {
            case "ANSWERED":
                $where .= " AND length(trim(business_qa.bqa_ans_plain)) >= 1 ";
                break;
            case "UNANSWERED":
                $where .= " AND length(trim(business_qa.bqa_ans_plain)) = 0";
                break;
            case "ALL":
                $where .= "";
                break;
            default:
                $where .= "";
                break;
        }
    }
    $qandasql = "SELECT (SELECT COUNT(*) FROM business_qa WHERE bqa_bsn_id = business.bsn_id) AS total_ques, business.bsn_id, business.bsn_name,
				 bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_lname, business_qa.bqa_id,
		     	 business_qa.bqa_unique_id, business_qa.bqa_bsn_id, business_qa.bqa_cust_id, business_qa.bqa_que, business_qa.bqa_ans, 
				 business_qa.bqa_ans_plain, business_qa.bqa_created_date, business_qa.bqa_ans_date,  business_qa.bqa_notes,
			     business_qa.bqa_status,  positions.p_name, positions.p_email, business_qa.bqa_attachment_ques_1, business_qa.bqa_from_pae,
				 business_qa.bqa_attachment_ques_2, business_qa.bqa_attachment_ques_3, business_qa.bqa_attachment_ques_4, business_qa.bqa_attachment_ques_5,
				 business_qa.bqa_attachment_ans_1, business_qa.bqa_attachment_ans_2, business_qa.bqa_attachment_ans_3, business_qa.bqa_attachment_ans_4, 
				 business_qa.bqa_attachment_ans_5, business_qa.show_in_planning_approval
			  	 FROM business_qa 
			 	 LEFT JOIN bus_customers ON bus_customers.bcust_id = business_qa.bqa_cust_id 
				 LEFT JOIN business ON business.bsn_id = business_qa.bqa_bsn_id 
				 Left Join positions on positions.p_id = business_qa.bqa_who
			" . $where;
			
    $fwViewData['detail'] = $detail;
    unset($_SESSION['last_qandasql']);
    unset($_SESSION['detail']);
    $_SESSION['last_qandasql'] = $qandasql;
    $_SESSION['detail'] = $detail;
} elseif ($_SESSION['last_qandasql']) {
    $qandasql = $_SESSION['last_qandasql'];
    $fwViewData['detail'] = $_SESSION['detail'];
} else {
    $qandasql = "SELECT (SELECT COUNT(*) FROM business_qa WHERE bqa_bsn_id = business.bsn_id) AS total_ques, business.bsn_id, business.bsn_name, 
	    		bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_lname, business_qa.bqa_id,
                business_qa.bqa_unique_id, business_qa.bqa_bsn_id, business_qa.bqa_cust_id, business_qa.bqa_que, business_qa.bqa_ans_plain, 
				business_qa.bqa_created_date, business_qa.bqa_ans, business_qa.bqa_ans_date, business_qa.bqa_notes,
			     business_qa.bqa_status,  positions.p_name, positions.p_email, business_qa.bqa_attachment_ques_1,  business_qa.bqa_from_pae,
				business_qa.bqa_attachment_ques_2, business_qa.bqa_attachment_ques_3, business_qa.bqa_attachment_ques_4, business_qa.bqa_attachment_ques_5, 
				business_qa.bqa_attachment_ans_1, business_qa.bqa_attachment_ans_2, business_qa.bqa_attachment_ans_3, business_qa.bqa_attachment_ans_4,
				business_qa.bqa_attachment_ans_5, business_qa.show_in_planning_approval	
				FROM business_qa 
				LEFT JOIN bus_customers ON bus_customers.bcust_id = business_qa.bqa_cust_id 
				LEFT JOIN business ON business.bsn_id = business_qa.bqa_bsn_id
				Left Join positions on positions.p_id = business_qa.bqa_who 
				where business.bsn_id > 0
			";
}
if ($qandasql) {
    $qandasql .= " ORDER BY " . $set_order;
}
if ($qandasql) {
    $userData = $fwDb->query($qandasql);
}
// echo $qandasql;
if ($submit == 'Export to XLS') {
    $fields = array("bsn_name", "bcust_fname", "bqa_que", "bqa_ans_plain", "bqa_created_date", "bqa_ans_date");
    $first_row = array("Business Name", "Customer Name", "Question", "Answer", "Question Date", "Answer Date");
    $csv_output .= implode("\t", $first_row);
    $csv_output .= "\n";
    foreach ($userData as $k => $v) {
        foreach ($v as $k2 => $v2) {
            if (in_array($k2, $fields)) {
                if ($k2 == 'bcust_fname') {
                    $csv_output .= trim(stripslashes($v['bcust_fname'])) . " " . trim(stripslashes($v['bcust_lname'])) . "\t";
                } else {
                    $v2 = ereg_replace("/\n\r|\r\n|\n|\r/", " ", $v2);
                    $v2 = preg_replace("/\t/", " ", $v2);
                    $csv_output .= trim(stripslashes($v2)) . "\t";
                }
            }
        }
        $csv_output .= "\n";
    }
    $filename = "export" . "_" . date("YmdHi", time()) . ".xls";
    header('Content-type: application/ms-excel');
    header('Content-Disposition: attachment; filename=' . $filename);
    echo $csv_output;
    exit;
}
$submit_export = $fwRequest->getParam('exportw', '');
if (!empty($submit_export)) {
    $html = '';
    $html .= "<table border='1' bordercolor='#999999' cellspacing='0' cellpadding='5'>";
    $html .= "<tr><th>PQAID</th><th>Business Name</th><th>Customer Name</th><th>Position Appointed</th><th>Question</th><th>Answer</th><th>Queestion Date</th><th>Answer Date</th><th>Notes</th></tr>";
    foreach ($userData as $k => $v) {
        $html .= "<tr>";
        $html .= "<td valign='top'>" . $v['bqa_unique_id'] . "</td>";
        $html .= "<td valign='top'>" . $v['bsn_name'] . "</td>";
        $html .= "<td valign='top'>" . $v['bcust_fname'] . '' . $v['bcust_lname'] . "</td>";
        $html .= "<td valign='top'>" . $v['p_name'] . '' . $v['bcust_lname'] . "</td>";
        $html .= "<td valign='top'>" . $v['bqa_que'] . "</td>";
        $html .= "<td valign='top'>" . $v['bqa_ans_plain'] . "</td>";
        $html .= "<td valign='top'>" . $v['bqa_created_date'] . "</td>";
        $html .= "<td valign='top'>" . $v['bqa_ans_date'] . "</td>";
        $html .= "<td valign='top'>" . $v['bqa_notes'] . "</td>";
        $html .= "</tr>";
    }
    $html .= "</table>";
    //header("Content-type: application/vnd.ms-word.doc");
    //header("Content-Disposition: attachment;Filename=TaskList.doc"); 
    header('Content-type: application/ms-excel');
    header("Content-Disposition: attachment;Filename=TaskList.xls");
    echo "<html>";
    echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=Windows-1252\">";
    echo "<body>";
    echo $html;
    echo "</body>";
    echo "</html>";
    exit;
}
if (!empty($userData)) {
    if (!(isset($pagenum))) {
        $pagenum = 1;
    }
    $rows = count($userData);
    $page_rows = 30;
    $last = ceil($rows / $page_rows);
    if ($pagenum <= 1) {
        $pagenum = 1;
    } elseif ($pagenum > $last) {
        $pagenum = $last;
    }
    $fwViewData['last'] = $last;
    $fwViewData['lastone'] = $last - 1;
    $fwViewData['lasttow'] = $last - 2;
    $fwViewData['pagenum'] = $pagenum;
    $fwViewData['lastcount'] = ($pagenum - 1) * $page_rows;
    $pagenatedatanext = $pagenum;
    $pagenatedataprev = $pagenum;
    for ($i = 0; $i < 9; $i++) {
        $paginate[$pagenatedatanext] = $pagenatedatanext;
        $pagenatedatanext++;
    }
    $fwViewData['paginatenext'] = $paginate;
    $pagenatedataprev = $pagenum;
    for ($i = 0; $i < 9; $i++) {
        $paginateprev[$pagenatedataprev] = $pagenatedataprev;
        $pagenatedataprev--;
    }
    $fwViewData['paginateprev'] = array_reverse($paginateprev);
    $max = 'limit ' . ($pagenum - 1) * $page_rows . ',' . $page_rows;
    $qandasql2 =  $qandasql . " " . $max;
    if ($qandasql2) {
        $fwViewData['list'] = $fwDb->query($qandasql2);
    }
}
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Project Q/A List";


//$bq = new Fw_Db_Table('business_qa');
//foreach($dataans as $v)
//{
//	$usql1 = "SELECT bqa_ans from business_qa where bqa_id = ".$v['bqa_id']; 
//	$udata1 = $fwDb->queryOne($usql1);
//	$udata1['bqa_ans_plain'] = trim(strip_tags($udata1['bqa_ans']));
//	$bq->setWhere("bqa_id=".$v['bqa_id']);
//		
//	$id= $bq->updateRow($udata1);	
//}

$sql = "SELECT  bsn_name from business";
$fwViewData['projdetail'] = $fwDb->query($sql);