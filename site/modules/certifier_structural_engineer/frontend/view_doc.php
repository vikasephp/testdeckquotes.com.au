<?php
$fwMainView = 'file:' . getcwd() . '/view_doc.tpl';
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


if(!empty($savedrop)) {	
	
	$detail = $fwRequest->getParam('slab_insp', ''); 
	
	$table->setWhere("cse_id = ".$cse_id);
	$opr  = $table->updateRow($detail);
	$fwViewData['opr'] =  $opr;	
}

    $table->setWhere("cse_id = ".$cse_id);
	$detail = $table->getRow();
    $fwViewData['detail'] = $detail;
	
	
$thisTable = new Fw_Db_Table("ss_required_doc");

$docdata = $thisTable->getAllRows(); 

foreach($docdata as $k=> $v)
{
	
	$sql_A = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$bsn_id. " and  doc_name_id  = ".$v['ss_doc_id'];
	$aaa = $fwDb->queryOne($sql_A);
	
	
	$docdata[$k]['doc_not_required'] = $aaa['doc_not_required'];
	$docdata[$k]['doc_file_name'] = $aaa['doc_file_name'];
}

$fwViewData['docdata'] = $docdata;
