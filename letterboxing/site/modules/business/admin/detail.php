<?php
$table = new Fw_Db_Table($TABLE);
$tablestatus = new Fw_Db_Table('busness_status');
$tableintrest = new Fw_Db_Table('business_interest');
$submit = $fwRequest->getParam('subAddDetail', '');
	
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());

if(empty($detail['bsn_interest'])){$detail['bsn_interest'] = 0;}
if(empty($detail['bsn_readyforsale'])){$detail['bsn_readyforsale'] = 0;}
if(empty($detail['bsn_send_marketing_emails'])){$detail['bsn_send_marketing_emails'] = 0;}
if(empty($detail['bsn_disclosed_marketing'])){$detail['bsn_disclosed_marketing'] = 0;}
if(empty($detail['bsn_franchise'])){$detail['bsn_franchise'] = 0;}

	/*$detail['bsn_status_date'] = ymddate($detail['bsn_status_date']);
	$detail['bsn_status_sys_date'] = ymddate($detail['bsn_status_sys_date']);
	$detail['bsn_date_listed_date'] = ymddate($detail['bsn_date_listed_date']);
	$detail['bsn_cd_date_appraised_date'] = ymddate($detail['bsn_cd_date_appraised_date']);
	$detail['bsn_cd_planing_sell_date'] = ymddate($detail['bsn_cd_planing_sell_date']);
	$detail['bsn_marketing_date'] = ymddate($detail['bsn_marketing_date']);
	$detail['bsn_last_update_letter_date'] = ymddate($detail['bsn_last_update_letter_date']);*/

	
	/*$fwViewData['detail']['bsn_status_date']=$current_date;
	$fwViewData['detail']['bsn_status_sys_date']=$current_date;
	$fwViewData['detail']['bsn_date_listed_date']=$current_date;
	$fwViewData['detail']['bsn_cd_date_appraised_date']=$current_date;
	$fwViewData['detail']['bsn_marketing_date']=$current_date;
	$fwViewData['detail']['bsn_cd_planing_sell_date']=$current_date;
	$fwViewData['detail']['bsn_last_update_letter_date']=$current_date;*/
	

	
    $table_id = (int)$detail[$ID];

    unset($detail[$ID]);

	if(!empty($table_id))
	{
		$table->setWhere($ID." = ".$table_id);
		$table->updateRow($detail);
	}
	else
	{
		$table->insertRow($detail);
	}

   	 Location(BASE_URL . $XFA['list']);
}	

$table_id = (int)$fwRequest->getParam($ID, 0);

$tablestatus->setOrderBy('st_id'.' ASC');
$fwViewData['business_status']=$tablestatus->getAllRows();


$tableintrest->setOrderBy('bi_id'.' ASC');
$fwViewData['business_interest']=$tableintrest->getAllRows();

if ($table_id > 0)
{
	$table->setWhere("$ID = $table_id");
	$detail = $table->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
	
	$current_date = date('Y-m-d');
	$current_time = date('H:i');
 	
	$fwViewData['detail']['bsn_status_date']=$current_date;
	$fwViewData['detail']['bsn_status_sys_date']=$current_date;
	$fwViewData['detail']['bsn_date_listed_date']=$current_date;
	$fwViewData['detail']['bsn_cd_date_appraised_date']=$current_date;
	$fwViewData['detail']['bsn_marketing_date']=$current_date;
	$fwViewData['detail']['bsn_cd_planing_sell_date']=$current_date;
	$fwViewData['detail']['bsn_last_update_letter_date']=$current_date;
	
	
	
	$fwViewData['detail']['bsn_status_time']=$current_time;
	$fwViewData['detail']['bsn_status_sys_time']=$current_time;
	$fwViewData['detail']['bsn_date_listed_time']=$current_time;
	$fwViewData['detail']['bsn_cd_date_appraised_time']=$current_time;
	$fwViewData['detail']['bsn_marketing_time']=$current_time;
	$fwViewData['detail']['bsn_cd_planing_sell_time']=$current_time;
	$fwViewData['detail']['bsn_last_update_letter_time']=$current_time;
	

}