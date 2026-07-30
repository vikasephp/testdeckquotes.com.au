<?php
if (isset($_POST['notes']['wa_why_not_resp_expl'])) {
	
	$date = date('d-m-Y');
	$user = $_SESSION['user']['user_name'];
	
	$wa_id = intval($_POST['notes']['wa_id']);
    $wa_why_not_resp_expl = trim($_POST['notes']['wa_why_not_resp_expl']);

    $sql_1 = "UPDATE warranty_log SET wa_why_not_resp_expl = '".$wa_why_not_resp_expl."' WHERE wa_id = ".$wa_id;
	$dataT = $fwDb->queryOne($sql_1);
	
	$sql_2 = "Update warranty_log set wa_why_not_resp_expl_user = '".$user."' where wa_id = ".$wa_id;	 
	$fwDb -> queryOne($sql_2);

	$sql_3 = "Update warranty_log set wa_why_not_resp_expl_date = '".$date."' where wa_id = ".$wa_id;	 
	$fwDb -> queryOne($sql_3);

    exit;
}
