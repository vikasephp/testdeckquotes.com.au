<?php
$bus_id = (int)$fwRequest->getparamget("bus_id", 0);
if ($bus_id > 0)
{
	$sql_1 = "DELETE FROM business WHERE bsn_id = $bus_id";
	$sql_2 = "DELETE FROM business_sellers WHERE bs_business_id = $bus_id";
	$sql_3 = "DELETE FROM business_tasks WHERE bt_bsn_id = $bus_id";
	$sql_4 = "DELETE FROM document_check_list WHERE doc_bsn_id = $bus_id";
	$sql_5 = "DELETE FROM business_file WHERE bf_bsn_id = $bus_id";
	$sql_6 = "DELETE FROM business_documents WHERE bd_bsi_id = $bus_id";
	$sql_7 = "DELETE FROM business_enquiry WHERE buse_bsn_id = $bus_id";
	$sql_8 = "DELETE FROM buyer_business_for_sale FROM bbfs_bus_id = $bus_id";
	$sql_9 = "DELETE FROM byer_enquiry WHERE be_business_id = $bus_id";
	
	mysql_query($sql_1);
	mysql_query($sql_2);
	mysql_query($sql_3);
	mysql_query($sql_4);
	mysql_query($sql_5);
	mysql_query($sql_6);
	mysql_query($sql_7);
	mysql_query($sql_8);
	mysql_query($sql_9);

	Location(BASE_URL . $XFA['detail']."/delete_msg/1");
}
