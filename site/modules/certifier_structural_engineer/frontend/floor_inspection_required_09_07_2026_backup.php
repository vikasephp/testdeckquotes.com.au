<?php
$fwMainView = 'file:' . getcwd() . '/floor_inspection_required.tpl';
$table = new Fw_Db_Table("certifier_structural_engineer");
$cse_id = $fwRequest->getParam('cse_id', '');
$bsn_id = $fwRequest->getParam('bsn_id', '');

$sql_1 = "select cse_project from  certifier_structural_engineer where cse_id = ".$cse_id;
$proj = $fwDb->queryOne($sql_1);
$fwViewData['proj_name'] = $proj['cse_project'];

$savedrop = $fwRequest->getParam('savedrop', '');

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

$sql_148 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$bsn_id. " and  	doc_name_id  = 148 ";
$fwViewData['data148'] = $fwDb->queryOne($sql_148);



$sql_235 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$bsn_id. " and  	doc_name_id  = 235 ";
$fwViewData['data235'] = $fwDb->queryOne($sql_235);

//db($fwViewData['data235']);

$sql = "SELECT cd_doc_id, cd_include_supplier FROM certifier_documents";
$result = $fwDb->query($sql);

$docIncludeSupplier = array();

foreach($result as $k => $row)  {
    $docIncludeSupplier[$row['cd_doc_id']] = $row['cd_include_supplier'];
}

$fwViewData['docIncludeSupplier'] = $docIncludeSupplier;

if(!empty($savedrop)) {
	
	
	$detail = $fwRequest->getParam('floor_frame', '');
	//$detail['cs_ch_user'] = $user; 
	//$detail['cs_ch_date'] = $dt; 
	
	$table->setWhere("cse_id = ".$cse_id);
	$opr  = $table->updateRow($detail);
	$fwViewData['opr'] =  $opr;	
}

    $table->setWhere("cse_id = ".$cse_id);
	$detail = $table->getRow();
    $fwViewData['detail'] = $detail;
	
	
