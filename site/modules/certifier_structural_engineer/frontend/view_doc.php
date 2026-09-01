<?php
$fwMainView = 'file:' . getcwd() . '/view_doc.tpl';
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


if(!empty($savedrop)) {	
	
	$detail = $fwRequest->getParam('slab_insp', ''); 
	
	$table->setWhere("cse_id = ".$cse_id);
	$opr  = $table->updateRow($detail);
	$fwViewData['opr'] =  $opr;	
}

    $table->setWhere("cse_id = ".$cse_id);
	$detail = $table->getRow();
    $fwViewData['detail'] = $detail;
	
	
require_once dirname(__FILE__) . '/cse_extra_docs.php';
$fwViewData['insp_type'] = 'se_presheet';
$fwViewData['return_fuse'] = 'view_doc';
$fwViewData['docdata'] = cse_load_extra_docs($fwDb, $bsn_id, 'se_presheet');
