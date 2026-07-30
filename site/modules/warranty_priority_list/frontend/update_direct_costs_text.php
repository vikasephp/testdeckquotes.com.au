<?php
if (isset($_POST['notes']['wa_direct_costs_text'])) {
	
	$date = date('d-m-Y');
	$user = $_SESSION['user']['user_name'];
	
	$wa_id = intval($_POST['notes']['wa_id']);
    $wa_direct_costs_text = trim($_POST['notes']['wa_direct_costs_text']);

    $sql_1 = "UPDATE warranty_log SET wa_direct_costs_text = '".$wa_direct_costs_text."' WHERE wa_id = ".$wa_id;
	$dataT = $fwDb->queryOne($sql_1);
	
	$sql_2 = "UPDATE warranty_log SET wa_direct_costs_text_user = '".$user."' WHERE wa_id = ".$wa_id;
	$data_2 = $fwDb->queryOne($sql_2);
	
	$sql_3 = "UPDATE warranty_log SET wa_direct_costs_text_date = '".$date."' WHERE wa_id = ".$wa_id;
	$data_3 = $fwDb->queryOne($sql_3);

    exit;
}
