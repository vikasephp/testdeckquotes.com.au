<?php
$fwMainView = 'file:' . getcwd() . '/add_supplier.tpl';


$thisTable = new Fw_Db_Table("pp_quote_builder");

$fwViewData['proceduredata'] = $thisTable->getAllRows();

$sql_c = "Select * from companies";
$fwViewData['compdetail'] = $fwDb->query($sql_c); 

$show_cont = $fwRequest->getParam('show_cont', '');
if($show_cont) {
	$suppliers = $fwRequest->getParam('supp', '');
	db($suppliers);
	$sql = "insert into supplier_temp  (st_supplier) value ('".$suppliers ."')";	 
	$fwDb -> queryOne($sql);
	exit;	
}
