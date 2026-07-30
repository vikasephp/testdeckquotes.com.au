<?php
$table = new Fw_Db_Table($TABLE);
$tablestatus = new Fw_Db_Table('customers_status');
$tableintrest = new Fw_Db_Table('customers_type');
$submit = $fwRequest->getParam('subAddDetail', '');
	$user_id = $_SESSION['user']['user_id'];
	$user_name = $_SESSION['user']['user_name'];	
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());

if(empty($detail['bcust_isbuyer'])){$detail['bcust_isbuyer'] = 0;}
if(empty($detail['bcust_isseller'])){$detail['bcust_isseller'] = 0;}
if(empty($detail['bcust_misc_send_market_email'])){$detail['bcust_misc_send_market_email'] = 0;}
if(empty($detail['bcust_misc_logged_user'])){$detail['bcust_misc_logged_user'] = $user_name;}

	/*$detail['bsn_status_date'] = ymddate($detail['bsn_status_date']);
	$detail['bsn_status_sys_date'] = ymddate($detail['bsn_status_sys_date']);
	$detail['bsn_date_listed_date'] = ymddate($detail['bsn_date_listed_date']);
	$detail['bsn_cd_date_appraised_date'] = ymddate($detail['bsn_cd_date_appraised_date']);
	$detail['bsn_cd_planing_sell_date'] = ymddate($detail['bsn_cd_planing_sell_date']);
	$detail['bsn_marketing_date'] = ymddate($detail['bsn_marketing_date']);
	$detail['bsn_last_update_letter_date'] = ymddate($detail['bsn_last_update_letter_date']);*/
	
	$detail = clean_query_for_insert($detail);
	
   $table_id = (int)$detail[$ID];

    unset($detail[$ID]);

	if(!empty($table_id)){$table->setWhere($ID." = ".$table_id);$table->updateRow($detail);}else{$table->insertRow($detail);}

    Location(BASE_URL . $XFA['list']);
}	

$table_id = (int)$fwRequest->getParam($ID, 0);

$tablestatus->setOrderBy('cs_id'.' ASC');
$fwViewData['customers_status']=$tablestatus->getAllRows();


$tableintrest->setOrderBy('ct_id'.' ASC');
$fwViewData['customers_type']=$tableintrest->getAllRows();

if ($table_id > 0)
{
	$table->setWhere("$ID = $table_id");
	$detail = $table->getRow();
	$fwViewData['detail'] = clean_query_for_show($detail);
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
	
	$current_date = date('Y-m-d');
	$current_time = date('H:i');
 	
	$fwViewData['detail']['bcust_misc_logged_date_date']=$current_date;	
	
	$fwViewData['detail']['bcust_misc_logged_date_time']=$current_time;
	

}