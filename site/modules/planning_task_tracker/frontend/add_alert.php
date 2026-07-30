<?php
$fwMainView = 'file:' . getcwd() . '/add_alert.tpl';

$bsn_id = $fwRequest->getParam('bsn_id', 0);
$fwViewData['pca_bsn_id'] = $bsn_id;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    // $pca_id = $fwRequest->getParam('pca_id', '');
    // $fwViewData['pca_id'] = $pca_id;
    $detail = $fwRequest->getParam('record', array());
    $fwViewData['pca_bsn_id'] = $detail['pca_bsn_id'];
    $this_id = $fwViewData['pca_id'] = $detail['pca_id'];
    unset($detail['pca_id']);
    $table = new Fw_Db_Table('planning_client_alerts');
    if($this_id > 0){
        $table->setWhere("pca_id = $this_id");
        $opr = $table->updateRow($detail);
    }
    elseif($bsn_id > 0){
        $opr = $table->insertRow($detail);
    }
    
    $fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam('pca_id', 0);
if ($this_id > 0){
	$table = new Fw_Db_Table('planning_client_alerts');
	$table->setWhere("pca_id = $this_id");
	$detail = $table->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}