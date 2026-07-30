<?php
$fwMainView = 'file:' . getcwd() . '/presheet_inspection_required.tpl';
$table = new Fw_Db_Table("certifier_structural_engineer");
$cse_id = $fwRequest->getParam('cse_id', '');
$bsn_id = $fwRequest->getParam('bsn_id', '');
$fwViewData['bsn_id'] = $bsn_id;

$sql_1 = "select cse_project from  certifier_structural_engineer where cse_id = ".$cse_id;
$proj = $fwDb->queryOne($sql_1);
$fwViewData['proj_name'] = $proj['cse_project'];

$savedrop = $fwRequest->getParam('savedrop', '');

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

$sql_261 = "select doc_not_required , doc_file_name from document_check_list where doc_bsn_id = ".$bsn_id. " and  	doc_name_id  = 261 ";
$fwViewData['data261'] = $fwDb->queryOne($sql_261);


$sql_289 = "select doc_not_required , doc_file_name from document_check_list where doc_bsn_id = ".$bsn_id. " and  	doc_name_id  = 289 ";
$fwViewData['data289'] = $fwDb->queryOne($sql_289);

$sql_155 = "select doc_not_required  , doc_file_name from document_check_list where doc_bsn_id = ".$bsn_id. " and  	doc_name_id  = 155 ";
$fwViewData['data155'] = $fwDb->queryOne($sql_155);


$sql_295 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$bsn_id. " and  	doc_name_id  = 295 ";
$fwViewData['data295'] = $fwDb->queryOne($sql_295);


$sql_739 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$bsn_id. " and  	doc_name_id  = 739 ";
$fwViewData['data739'] = $fwDb->queryOne($sql_739);


$sql_626 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$bsn_id. " and  	doc_name_id  = 626 ";
$fwViewData['data626'] = $fwDb->queryOne($sql_626);


$sql = "SELECT cd_doc_id, cd_include_supplier FROM certifier_documents";
$result = $fwDb->query($sql);


$docIncludeSupplier = array();
foreach($result as $k => $row)  {
    $docIncludeSupplier[$row['cd_doc_id']] = $row['cd_include_supplier'];
}
$fwViewData['docIncludeSupplier'] = $docIncludeSupplier;

$sql_dataSupplier261 = "SELECT sa_include_supplier FROM supplier_certifier where sa_bsn_id = ".$bsn_id." and sa_car_id = 261";
$data_261 = $fwDb->query($sql_dataSupplier261);
$fwViewData['dataSupplier261'] = $data_261;

$sql_dataSupplier289 = "SELECT sa_include_supplier FROM supplier_certifier where sa_bsn_id = ".$bsn_id." and sa_car_id = 289";
$data_289 = $fwDb->query($sql_dataSupplier289);
$fwViewData['dataSupplier289'] = $data_289;

$sql_dataSupplier155 = "SELECT sa_include_supplier FROM supplier_certifier where sa_bsn_id = ".$bsn_id." and sa_car_id = 155";
$data_155 = $fwDb->query($sql_dataSupplier155);
$fwViewData['dataSupplier155'] = $data_155;

$sql_dataSupplier295 = "SELECT sa_include_supplier FROM supplier_certifier where sa_bsn_id = ".$bsn_id." and sa_car_id = 295";
$data_295 = $fwDb->query($sql_dataSupplier295);
$fwViewData['dataSupplier295'] = $data_295;

$sql_dataSupplier739 = "SELECT sa_include_supplier FROM supplier_certifier where sa_bsn_id = ".$bsn_id." and sa_car_id = 739";
$data_739 = $fwDb->query($sql_dataSupplier739);
$fwViewData['dataSupplier739'] = $data_739;

$sql_dataSupplier626 = "SELECT sa_include_supplier FROM supplier_certifier where sa_bsn_id = ".$bsn_id." and sa_car_id = 626";
$data_626 = $fwDb->query($sql_dataSupplier626);
$fwViewData['dataSupplier626'] = $data_626;

if(!empty($savedrop)) {
	
	
	$detail = $fwRequest->getParam('flooting_insp', '');
	
	$table->setWhere("cse_id = ".$cse_id);
	$opr  = $table->updateRow($detail);
	$fwViewData['opr'] =  $opr;	
}

    $table->setWhere("cse_id = ".$cse_id);
	$detail = $table->getRow();
    $fwViewData['detail'] = $detail;
	
	
