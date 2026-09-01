<?php
$fwMainView = 'file:' . getcwd() . '/pier_inspection_required.tpl';
$table = new Fw_Db_Table("certifier_structural_engineer");
$cse_id = $fwRequest->getParam('cse_id', '');
$bsn_id = $fwRequest->getParam('bsn_id', '');
$fwViewData['bsn_id'] = $bsn_id;
$fwViewData['cse_id'] = $cse_id;

$sql_1 = "select cse_project from  certifier_structural_engineer where cse_id = ".$cse_id;
$proj = $fwDb->queryOne($sql_1);
$fwViewData['proj_name'] = $proj['cse_project'];

$savedrop = $fwRequest->getParam('savedrop', '');

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];


$sql_116 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$bsn_id. " and  	doc_name_id  = 116 ";
$fwViewData['data116'] = $fwDb->queryOne($sql_116);

$sql_235 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$bsn_id. " and  	doc_name_id  = 235 ";
$fwViewData['data235'] = $fwDb->queryOne($sql_235);


$sql = "SELECT cd_doc_id, cd_include_supplier FROM certifier_documents";
$result = $fwDb->query($sql);

//if (!$result) {
 //   die("Query failed: " . $fwDb->error);
//}

$docIncludeSupplier = array();

foreach($result as $k => $row)  {
    $docIncludeSupplier[$row['cd_doc_id']] = $row['cd_include_supplier'];
}

$fwViewData['docIncludeSupplier'] = $docIncludeSupplier;

$sql_dataSupplier116 = "SELECT sa_include_supplier FROM supplier_certifier where sa_bsn_id = ".$bsn_id." and sa_car_id = 116";
$data_116 = $fwDb->query($sql_dataSupplier116);
$fwViewData['dataSupplier116'] = $data_116;

$sql_dataSupplier235 = "SELECT sa_include_supplier FROM supplier_certifier where sa_bsn_id = ".$bsn_id." and sa_car_id = 235";
$data_235 = $fwDb->query($sql_dataSupplier235);
$fwViewData['dataSupplier235'] = $data_235;

if(!empty($savedrop)) {
	
	$detail = $fwRequest->getParam('pier_insp', '');
	
	$table->setWhere("cse_id = ".$cse_id);
	$opr  = $table->updateRow($detail);
	$fwViewData['opr'] =  $opr;	
}

    $table->setWhere("cse_id = ".$cse_id);
	$detail = $table->getRow();
    $fwViewData['detail'] = $detail;

require_once dirname(__FILE__) . '/cse_extra_docs.php';
$fwViewData['insp_type'] = 'pier';
$fwViewData['return_fuse'] = 'pier_inspection_required';
$fwViewData['docdata'] = cse_load_extra_docs($fwDb, $bsn_id, 'pier');
	
	
