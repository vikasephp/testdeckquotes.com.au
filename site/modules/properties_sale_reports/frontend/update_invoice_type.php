<?php

$primaryID = $_POST['primaryID'];
$column = $_POST['column'];
$value = $_POST['value'];

if (!empty($primaryID) && !empty($column) && !empty($column)){
	$sql_1 = "Update properties_sale_reports_invoices set $column = $value where psri_id = $primaryID";	
	echo $sql_1;
	$fwDb -> queryOne($sql_1);
}	
 exit;