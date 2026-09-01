<?php
$fwMainView = 'file:' . getcwd() . '/final_inspection_required.tpl';
$table = new Fw_Db_Table("certifier_structural_engineer");
$cse_id = $fwRequest->getParam('cse_id', '');
$bsn_id = $fwRequest->getParam('bsn_id', '');

$sql_1 = "select cse_project from  certifier_structural_engineer where cse_id = ".$cse_id;
$proj = $fwDb->queryOne($sql_1);
$fwViewData['proj_name'] = $proj['cse_project'];


$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

$sql_663 = "select doc_not_required , doc_file_name from document_check_list where doc_bsn_id = ".$bsn_id. " and  doc_name_id  = 663 ";
$fwViewData['data663'] = $fwDb->queryOne($sql_663);


$sql = "SELECT cd_doc_id, cd_include_supplier FROM certifier_documents";
$result = $fwDb->query($sql);


$docIncludeSupplier = array();

foreach($result as $k => $row)  {
    $docIncludeSupplier[$row['cd_doc_id']] = $row['cd_include_supplier'];
}

$fwViewData['docIncludeSupplier'] = $docIncludeSupplier;

if(!empty($savedrop)) {
	
	
	$detail = $fwRequest->getParam('flooting_insp', '');

	
	$table->setWhere("cse_id = ".$cse_id);
	$opr  = $table->updateRow($detail);
	$fwViewData['opr'] =  $opr;	
}

    $table->setWhere("cse_id = ".$cse_id);
	$detail = $table->getRow();
    $fwViewData['detail'] = $detail;
	
	
