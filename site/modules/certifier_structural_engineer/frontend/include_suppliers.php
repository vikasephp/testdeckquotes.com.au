<?php
$fwMainView = 'file:' . getcwd() . '/include_suppliers.tpl';
$table = new Fw_Db_Table('certifier_documents');
$tableSupplier = new Fw_Db_Table('supplier_certifier');

$bsn_id = $fwRequest->getParam('bsn_id', '');
$fwViewData['bsn_id'] = $bsn_id;

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

	$tableSupplier->setWhere("sa_car_id = " . $car_id ." and sa_bsn_id = ".$bsn_id );
	$tableSupplier->deleteRows();

	$range = "(";
	foreach ($supplier as $k => $v) {

		//db($k);
		$name = $name2 = '';
		$sql_3 = "Select companies.co_id, companies.co_company_name from companies where co_id = " . $k;
		$data = $fwDb->queryOne($sql_3);
		$name = "<a href = '" . BASE_URL . "certifier_structural_engineer.show-contacts/co_id/" . $k . "/car_id/" . $car_id . "/bsn_id/".$bsn_id."' class='various'>" . $data['co_company_name'] . "</a>";
		$name2 .= $name . "<br>";

		$newData['sa_bsn_id'] = $bsn_id;
		$newData['sa_co_id'] = $data['co_id'];
		$newData['sa_car_id'] = $car_id;
		$newData['sa_supplier'] = $data['co_company_name'];
		$newData['sa_include_supplier'] = $name2;
		$this_id = $tableSupplier->insertRow($newData);

		$range .= $k . ",";
	}

	$range .= "0)";


	$sqlUn = "delete from supplier_email_certifier where se_car_id = " . $car_id . " And se_bsn_id = ".$bsn_id." And se_co_id NOT IN " . $range;

	$temp =  $fwDb->queryOne($sqlUn);

	$detail['cd_include_supplier'] = $name2;
	
	if (trim(strip_tags($name2)) === '') {
		$detail['car_incl_supp_email'] = '';
	}

	$table->setWhere("cd_doc_id = " . $car_id);
	if ($table->rowExists()) {
		$this_id = $table->updateRow($detail);
	}


	$fwViewData['opr'] = "Saved...";
}

//$sqlc = "SELECT cd_include_supplier from certifier_documents where cd_doc_id = " . $car_id;
$sqlc = "SELECT sa_supplier, sa_include_supplier FROM supplier_certifier where sa_car_id = ". $car_id . " and sa_bsn_id = ".$bsn_id;
$comData = $fwDb->query($sqlc);
$fwViewData['incsup'] = $comData;

//echo "<pre>"; print_r($comData); exit();

//$x = explode("<br>", $comData['cd_include_supplier']);
$x = explode("<br>", $comData['sa_include_supplier']);

$incsup = [];
foreach ($x as $k2 => $v2) {
	preg_match('~>\K[^<>]*(?=<)~',  $v2, $str);
	$incsup[] = $str[0];
}
//$fwViewData['incsup'] = $incsup;
