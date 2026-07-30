<?php
$table = new Fw_Db_Table('smtp_logins');

$submit = $fwRequest->getParam('save_user', '');


if(!empty($submit))
{
    $detail = $fwRequest->getParam('smtp', array());
		
	//$sql = "select s_otp from s3bucket where s_id = 1";
	//$otpm = $fwDb->queryOne($sql);
	
	$table->setWhere("sm_id = 1");
	$opr = $table->updateRow($detail);
	$fwViewData['opr'] = 'Smtp2Go User and Password Has Been Updated...';
		
		
		
	
	
}
