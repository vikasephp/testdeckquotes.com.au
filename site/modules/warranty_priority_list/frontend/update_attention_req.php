<?php

$id = $fwRequest->getParam('wa_id', '');
$value = $fwRequest->getparam('value', '');
//$value = str_replace('%20',' ',$value);

$date = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if(!empty($value))
{
	$sql = "Update warranty_log set wa_attention_req = '".$value."' where wa_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql_2 = "Update warranty_log set wa_attention_req_by = '".$user."' where wa_id = ".$id;	 
	$fwDb -> queryOne($sql_2);

	$sql_3 = "Update warranty_log set wa_attention_req_at = '".$date."' where wa_id = ".$id;	 
	$fwDb -> queryOne($sql_3);

	//$sql_get_data = "Select wa_attention_req_by, wa_attention_req_at from warranty_log where wa_id = ".$id;
	//$data_get = $fwDb->queryOne($sql_get_data);

	//echo $data_get['wa_attention_req_by']." "$data_get['wa_attention_req_at'];
}

exit;