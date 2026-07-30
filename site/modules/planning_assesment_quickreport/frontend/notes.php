<?php
$fwMainView = 'file:' . getcwd() . '/notes.tpl';
$table = new Fw_Db_Table('business_sellers');
$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);
$fwViewData['bsn_id'] = $bsn_id;

$fwViewData['user_name'] = $_SESSION['user']['user_name'];
$fwViewData['current_datetime'] = date('d F Y g:i A');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('notes', array());
	$this_id = (int)$detail['bsn_id'];
	unset($detail['bsn_id']);
	
	
    if($bsn_id > 0)
    	{
      		 unset($detail['bsn_id']);
       		 $table->setWhere("bs_business_id = $bsn_id");
	     	 $opr = $table->updateRow($detail);   
    	}
	
	   // $fwViewData['opr'] = $opr;
}

//$this_id = (int)$fwRequest->getParam('pa_id', 0);
if ($bsn_id > 0)
{
	$table = new Fw_Db_Table('business_sellers');
	$table->setWhere("bs_business_id = $bsn_id");
	$detail = $table->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
