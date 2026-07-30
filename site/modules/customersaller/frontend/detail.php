<?php
$table = new Fw_Db_Table($TABLE);
$user_id = $_SESSION['user']['user_id'];
$tablebyerenquiry = new Fw_Db_Table('byer_enquiry');
$tablestatus = new Fw_Db_Table('customers_status');
$tableintrest = new Fw_Db_Table('customers_type');
$tableenquirysource = new Fw_Db_Table('enquirysource');
$tablesalenquiry = new Fw_Db_Table('buyer_business_for_sale');
$submit = $fwRequest->getParam('subAddDetail', '');

	$current_date = date('Y-m-d');
	$current_time = date('H:i');
	
	$user_id = $_SESSION['user']['user_id'];
	$user_name = $_SESSION['user']['user_name'];	
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());

if(empty($detail['bcust_isbuyer'])){$detail['bcust_isbuyer'] = 0;}
if(empty($detail['bcust_isseller'])){$detail['bcust_isseller'] = 0;}
if(empty($detail['bcust_misc_send_market_email'])){$detail['bcust_misc_send_market_email'] = 0;}
if(empty($detail['bcust_misc_logged_user'])){$detail['bcust_misc_logged_user'] = $user_name;}
if(empty($detail['be_answer_required'])){$detail['be_answer_required'] = 0;}

	/*$detail['bsn_status_date'] = ymddate($detail['bsn_status_date']);
	$detail['bsn_status_sys_date'] = ymddate($detail['bsn_status_sys_date']);
	$detail['bsn_date_listed_date'] = ymddate($detail['bsn_date_listed_date']);
	$detail['bsn_cd_date_appraised_date'] = ymddate($detail['bsn_cd_date_appraised_date']);
	$detail['bsn_cd_planing_sell_date'] = ymddate($detail['bsn_cd_planing_sell_date']);
	$detail['bsn_marketing_date'] = ymddate($detail['bsn_marketing_date']);
	$detail['bsn_last_update_letter_date'] = ymddate($detail['bsn_last_update_letter_date']);*/
	
	$detail = clean_query_for_insert($detail);

	if($_FILES['image'])
		{
		$docfile = $_FILES['image']['name'];
		$file_type = $_FILES['image']['type'];
	
	

				$valid_file_types = array('image/jpeg','image/gif','image/png');
			   
				if(in_array($file_type, $valid_file_types))
				{
					$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
					$src = $_FILES['image']['tmp_name'];
					$destination = BASE_DIR . 'files/images/'.$docfile;
					$detail['bcust_gendec_file']= $docfile;
				  
					if (!move_uploaded_file($src, $destination))
					{
						echo "Possible file upload attack";
						
					}
					else
					{
						chmod($destination, 0664);
					}
				
				}
		
		}

   $table_id = (int)$detail[$ID];
   $bus_id =(int)$detail['be_business_id']; 
   $bbfs_bus_id =(int)$detail['bbfs_bus_id']; 
   
    unset($detail[$ID]);

if(!empty($table_id))
	{
		$table->setWhere($ID." = ".$table_id);$table->updateRow($detail); 
			if($bus_id && empty($bbfs_bus_id))
				{
					$detail['be_customer_id'] = $table_id;
					$tablebyerenquiry->setWhere("be_customer_id =".$table_id." AND be_business_id =".$bus_id);
						if($tablebyerenquiry->rowExists())
							{
							$tablebyerenquiry->updateRow($detail);
							}
							else
							{
							$detail['be_user'] = $user_id;
							$tablebyerenquiry->insertRow($detail);
							}
							
		
				}
			if($bbfs_bus_id && empty($bus_id))
				{
					$detail['bbfs_cust_id'] = $table_id;
					$tablesalenquiry->setWhere("bbfs_cust_id =".$table_id." AND bbfs_bus_id  =".$bbfs_bus_id);
						if($tablesalenquiry->rowExists())
							{
							$tablesalenquiry->updateRow($detail);
							}
							else
							{
							$detail['bbfs_user'] = $user_id;
							$tablesalenquiry->insertRow($detail);
							}
							
		
				}
	Location(BASE_URL . $XFA['detail']."/bcust_id/".$table_id);
	}
	else{$new_cust = $table->insertRow($detail);
	$detail['be_customer_id'] = $new_cust;
	$detail['bbfs_cust_id'] = $new_cust;
	$tablebyerenquiry->insertRow($detail);
	Location(BASE_URL . $XFA['list']);}
		

    //Location(BASE_URL . $XFA['list']);
	 
}	

$table_id = (int)$fwRequest->getParam($ID, 0);

$tablestatus->setOrderBy('cs_id'.' ASC');
$fwViewData['customers_status']=$tablestatus->getAllRows();


$tableintrest->setOrderBy('ct_id'.' ASC');
$fwViewData['customers_type']=$tableintrest->getAllRows();

$tableenquirysource->setOrderBy('soe_id'.' ASC');
$fwViewData['enquiry_source']=$tableenquirysource->getAllRows();

if ($table_id > 0)
{
	$table->setWhere("$ID = $table_id");
	$detail = $table->getRow();
	$fwViewData['detail'] = clean_query_for_show($detail);
	
	$sql = "SELECT byer_enquiry.*, business.bsn_id, business.bsn_name, users.user_id,users.user_name  FROM byer_enquiry
				LEFT JOIN business ON byer_enquiry.be_business_id = business.bsn_id
				LEFT JOIN users ON byer_enquiry.be_user = users.user_id
				WHERE  byer_enquiry.be_customer_id = ".$table_id;
	
	$userData = $fwDb->query($sql);
	$fwViewData['list'] = $userData;
	//DB($fwViewData['list']);
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
	

	if(empty($fwViewData['detail']['be_ipc_date'])){$fwViewData['detail']['be_ipc_date']=$current_date;}
	if(empty($fwViewData['detail']['be_ipc_time'])){$fwViewData['detail']['be_ipc_time']=$current_time;}
	
	if(empty($fwViewData['detail']['be_created_date'])){$fwViewData['detail']['be_created_date']=$current_date;}
	if(empty($fwViewData['detail']['be_created_time'])){$fwViewData['detail']['be_created_time']=$current_time;}
	
	if(empty($fwViewData['detail']['be_easts_date'])){$fwViewData['detail']['be_easts_date']=$current_date;}
	if(empty($fwViewData['detail']['be_easts_time'])){$fwViewData['detail']['be_easts_time']=$current_time;}
	
}
else
{   $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
	

 	
	$fwViewData['detail']['bcust_misc_logged_date_date']=$current_date;	
	$fwViewData['detail']['bcust_misc_logged_date_time']=$current_time;	
	
	$fwViewData['detail']['bcust_gendec_sent_time']=$current_time;
	$fwViewData['detail']['bcust_gendec_signed_time']=$current_time;
	
	$fwViewData['detail']['bcust_gendec_signed_date']=$current_date;
	$fwViewData['detail']['bcust_gendec_sent_date']=$current_date;
	
	$fwViewData['detail']['be_ipc_date']=$current_date;
	$fwViewData['detail']['be_ipc_time']=$current_time;
	
	$fwViewData['detail']['be_created_date']=$current_date;
	$fwViewData['detail']['be_created_time']=$current_time;
	
	$fwViewData['detail']['be_easts_date']=$current_date;
	$fwViewData['detail']['be_easts_time']=$current_time;
}