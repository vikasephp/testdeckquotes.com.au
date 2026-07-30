<?php
$fwMainView = 'file:' . getcwd() . '/include_suppliers_ss.tpl';
$table = new Fw_Db_Table('ss_required_doc');
$tableSupplier = new Fw_Db_Table('supplier_certifier');

$car_id = $fwRequest->getParam('car_id', '');

//$noContactAssigned = $fwRequest->getParam('noContactAssigned', '');
//$fwViewData['noContactAssigned'] = $noContactAssigned;


$sql2 = "SELECT   companies.co_id, companies.co_company_name from  companies";
$fwViewData['contactdetail'] = $fwDb->query($sql2);


$add_suppliers = $fwRequest->getParam('add_suppliers', '');
if (!empty($add_suppliers)) {
	$supplier = $fwRequest->getParam('supplier', '');

	$name2 = "";
	$email2 = "";

	$tableSupplier->setWhere("sa_car_id = " . $car_id);
	$tableSupplier->deleteRows();

	$range = "(";
	foreach ($supplier as $k => $v) {

		//db($k);
		$sql_3 = "Select companies.co_id, companies.co_company_name from companies where co_id = " . $k;
		$data = $fwDb->queryOne($sql_3);
		$name = "<a href = '" . BASE_URL . "certifier_structural_engineer.show-contacts/co_id/" . $k . "/car_id/" . $car_id . "' class='various'>" . $data['co_company_name'] . "</a>";
		$name2 .= $name . "<br>";

		$newData['sa_co_id'] = $data['co_id'];
		$newData['sa_car_id'] = $car_id;
		$newData['sa_supplier'] = $data['co_company_name'];
		$this_id = $tableSupplier->insertRow($newData);

		$range .= $k . ",";
	}

	$range .= "0)";


	$sqlUn = "delete from supplier_email_certifier where se_car_id = " . $car_id . " And se_co_id NOT IN " . $range;

	$temp =  $fwDb->queryOne($sqlUn);

	$detail['ss_include_supplier'] = $name2;
	
	if (trim(strip_tags($name2)) === '') {
		$detail['car_incl_supp_email'] = '';
	}

	$table->setWhere("ss_doc_id = " . $car_id);
	if ($table->rowExists()) {
		$this_id = $table->updateRow($detail);
	}


	$fwViewData['opr'] = "Saved...";
}

$sqlc = "SELECT ss_include_supplier from ss_required_doc where ss_doc_id = " . $car_id;
$comData = $fwDb->queryOne($sqlc);

$x = explode("<br>", $comData['ss_include_supplier']);

$incsup = [];
foreach ($x as $k2 => $v2) {
	preg_match('~>\K[^<>]*(?=<)~',  $v2, $str);
	$incsup[] = $str[0];
}
$fwViewData['incsup'] = $incsup;
