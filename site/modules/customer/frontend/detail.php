<?php
$table = new Fw_Db_Table($TABLE);
$tableuser = new Fw_Db_Table('users');
$tableuser_logged = new Fw_Db_Table('user_logged');
$tablegroup = new Fw_Db_Table('users_groups');
$user_id = $_SESSION['user']['user_id'];
$tablebyerenquiry = new Fw_Db_Table('byer_enquiry');
$tablestatus = new Fw_Db_Table('customers_status');
$tableintrest = new Fw_Db_Table('customers_type');
$tableenquirysource = new Fw_Db_Table('enquirysource');
$tablesalenquiry = new Fw_Db_Table('buyer_business_for_sale');
$submit = $fwRequest->getParam('subAddDetail', '');
	$fwViewData['user_id'] = $user_id; 
	$fwViewData['user_name'] = $_SESSION['user']['user_name'];
	$current_date = date('d-m-Y');
	$current_time = date('H:i');
	
	$user_id = $_SESSION['user']['user_id'];
	$user_name = $_SESSION['user']['user_name'];
$fwViewData['buyer_enquiry'] = (int)$fwRequest->getParam('be_id', 0);	

$servername = "localhost";
$username = "testdeckquotes_livedb";
$password = "*5hB=^]3nbl8";
$dbname = "testdeckquotes_livedb";
$mysqli = new mysqli($servername, $username, $password, $dbname);

		
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());

	$detail['bcust_fname'] =  stripslashes($detail['bcust_fname']);
	$detail['bcust_lname'] =  stripslashes($detail['bcust_lname']);

	if(empty($detail['bcust_isbuyer'])){$detail['bcust_isbuyer'] = 0;}
	if(empty($detail['bcust_isseller'])){$detail['bcust_isseller'] = 0;}
	if(empty($detail['bcust_misc_send_market_email'])){$detail['bcust_misc_send_market_email'] = 0;}
	if(empty($detail['bcust_misc_logged_user'])){$detail['bcust_misc_logged_user'] = $user_name;}
	if(empty($detail['be_answer_required'])){$detail['be_answer_required'] = 0;}
	
	if(!empty($detail['bcust_misc_logged_date_date'])){$detail['bcust_misc_logged_date_date'] = changedate_y_m_d($detail['bcust_misc_logged_date_date']);}
	if(!empty($detail['bcust_gendec_sent_date'])){$detail['bcust_gendec_sent_date'] = changedate_y_m_d($detail['bcust_gendec_sent_date']);}
	if(!empty($detail['bcust_gendec_signed_date'])){$detail['bcust_gendec_signed_date'] = changedate_y_m_d($detail['bcust_gendec_signed_date']); $detail['bcust_gendec_signed_user_id'] = $user_id;}
	
	if(!empty($detail['bcust_misc_logged_date_time'])){$detail['bcust_misc_logged_date_time'] = changetime_h_m($detail['bcust_misc_logged_date_time']);}
	if(!empty($detail['bcust_gendec_sent_time'])){$detail['bcust_gendec_sent_time'] = changetime_h_m($detail['bcust_gendec_sent_time']);}
	if(!empty($detail['bcust_gendec_signed_time'])){$detail['bcust_gendec_signed_time'] = changetime_h_m($detail['bcust_gendec_signed_time']);}


	$detail = clean_query_for_insert($detail);

	if($detail['ul_date'] && $detail['bcust_id'])
		{
			
			$ulgdaat['ul_user_id'] = $detail['bcust_user_id'];
			$ulgdaat['ul_date'] = changedate_y_m_d($detail['ul_date']);
			$ulgdaat['ul_time'] = $detail['ul_time'];
			$ulgdaat['ul_group'] = 'Customers';	
			
			$tableuser_logged->setWhere("ul_user_id =".$ulgdaat['ul_user_id']); 
			 	if($tableuser_logged->rowExists())
					{
					unset($ulgdaat['ul_user_id']);
					$tableuser_logged->updateRow($ulgdaat);
					}else
					{
					$tableuser_logged->insertRow($ulgdaat);
					}	
		}
	
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
   $_SESSION['cust_id'] = $table_id;
    unset($detail[$ID]);

if($table_id > 0)
	{
	     $b_cust_id = $table_id;
		$bcust_fname= strtolower (preg_replace("/[^a-zA-Z0-9s]/", "", $detail['bcust_fname']));
		$table->setWhere($ID." = ".$table_id); 
		$curdata = $table->getRow();
		if($curdata['bcust_gendec_signed_user_id'] > 0){unset($detail['bcust_gendec_signed_user_id']);}

		$table->updateRow($detail);
		//update customer on construction website 
        $newUsername = $detail['bcust_fname'] ." " . $detail['bcust_lname'];
		$newEmail =  $detail['bcust_misc_email1'];
		$newPassword = $detail['bcust_misc_moble'];
		$id= $detail['bcust_user_id'];
		$newPhoneNumber =$detail['bcust_misc_moble'];

 
		//$updateResult =$mysqli->query($updateQuery);
//		$userIdsQuery = "SELECT user_id
//		                FROM wp_usermeta
//		                WHERE meta_key = 'gcone_customer_id'
//		                  AND meta_value = '$id'";
//
//		$userIdsResult = $mysqli->query($userIdsQuery);
//		$userIds = array();
//		while ($row = mysqli_fetch_assoc($userIdsResult)) {
//		    $userIds[] = $row['user_id'];
//		}
//		foreach ($userIds as $userId) {
//		    $updateQuery = "UPDATE wp_usermeta
//		                    SET meta_value = '" . $mysqli->real_escape_string($newPhoneNumber) . "'
//		                    WHERE user_id = $userId
//		                    AND meta_key = 'phone_number'";
//
//		  $mysqli->query($updateQuery);
//		}

		//end
             

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
	else{
	

	$table->setWhere("bcust_misc_email1 =".$detail['bcust_misc_email1']);
		if($table->rowExists())
		{
		$fwViewData['error_msg'] = "Email address already used.";
		}
		else
		{
	$tablename = "bus_customers";
	$next_increment = 0;
	$qShowStatus = "SHOW TABLE STATUS LIKE '$tablename'";
	//$qShowStatusResult = mysql_query($qShowStatus) or die ( "Query failed: " . mysql_error() . "<br/>" . $qShowStatus );
	
	$qShowStatusResult = mysqli_query($mysqli,$qShowStatus) or die ( "Query failed: " . mysqli_error() . "<br/>" . $qShowStatus );
	$row = mysqli_fetch_assoc($qShowStatusResult);
	
	$next_increment = $row['Auto_increment'];
	$detail['bcust_code'] = "#BUSENQU".$next_increment;
	
		$table->setWhere("bcust_misc_email1 = '".$detail['bcust_misc_email1']."'");
		
		if(!$table->rowExists())
		{
		$new_cust = $table->insertRow($detail);
		$userdata['user_name'] = $detail['bcust_fname'] ." " . $detail['bcust_lname'];
		$userdata['user_email'] = $detail['bcust_misc_email1'];
		$userdata['user_username'] = trim($detail['bcust_misc_email1']);
		$userdata['user_password'] = md5(generatePassword());
		
		$ins_id = $tableuser->insertRow($userdata);
//add customer on construction website 
		$newUsername = $detail['bcust_fname'] ." " . $detail['bcust_lname'];
		$newEmail =  $detail['bcust_misc_email1'];
		$newPassword = $detail['bcust_misc_moble'];
		$newDisplayName =$detail['bcust_fname'] ." " . $detail['bcust_lname'];

		$insertQuery = "INSERT INTO wp_users (user_login, user_pass, user_email, user_registered, display_name) VALUES ('$newUsername', MD5('$newPassword'), '$newEmail', NOW(), '$newDisplayName')";
		$result = $mysqli->query($insertQuery);
		$lastUserID = $mysqli->insert_id;
		$metaQuery1 = "INSERT INTO wp_usermeta (user_id, meta_key, meta_value) VALUES ($lastUserID, 'phone_number', '$newPassword')";
		$metaResult1 = $mysqli->query($metaQuery1);
		$metaQuery2 = "INSERT INTO wp_usermeta (user_id, meta_key, meta_value) VALUES ($lastUserID, 'gcone_customer_id', '$ins_id')";
		$metaResult2 = $mysqli->query($metaQuery2);
//end 
		$data2['user_id'] = $ins_id;
		$data2['group_id'] = 2;
		$tablegroup->insertRow($data2);
		
		$cusdata['bcust_user_id'] = $ins_id;
		$table->setWhere("bcust_id = ".$new_cust);
		$table->updateRow($cusdata);

		if($detail['ul_date'])
		{
			$ulgdaat['ul_user_id'] = $ins_id;
			$ulgdaat['ul_date'] = changedate_y_m_d($detail['ul_date']);
			$ulgdaat['ul_time'] = $detail['ul_time'];
			$ulgdaat['ul_group'] = 'Customers';	
			$tableuser_logged->insertRow($ulgdaat);

		}		
	if($detail['bcust_isbuyer'])
		{
		
		
						if(send_general_disclamer($detail['bcust_fname'], $detail['bcust_lname'], $detail['bcust_misc_email1']))
							{
								$table->setWhere("bcust_id = ".$new_cust);
								$gendisdata['bcust_gendec_sent_date'] = date('Y-m-d');
								$gendisdata['bcust_gendec_sent_time'] = date('H:i');
								$gendisdata['bcust_gendec_comments'] = "Auto sent, \nEmailed ".$detail['bcust_misc_email1'];
								$id = $table->updateRow($gendisdata);
							}
		
		}
		

	Location(BASE_URL . $XFA['detail']."/bcust_id/".$new_cust);
	}
	else
		{
		$fwViewData['error_msg'] = "Email address already used.";	
		}
		}
	}	 
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
	$curbuyersql = "SELECT ".$TABLE.".*, gduser.user_name as gduser_name FROM ".$TABLE." LEFT JOIN users as gduser ON ".$TABLE.".bcust_gendec_signed_user_id = gduser.user_id WHERE ".$TABLE.".bcust_id =".$table_id;
	//echo "<pre>"; print_r($curbuyersql); exit('Checking ID - NewDeckquote');
	$detail = $fwDb->queryOne($curbuyersql);

    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
	
	if(empty($fwViewData['detail']['be_ipc_date'])){$fwViewData['detail']['be_ipc_date']=$current_date;}
	if(empty($fwViewData['detail']['be_ipc_time'])){$fwViewData['detail']['be_ipc_time']=$current_time;}
	
	if(empty($fwViewData['detail']['be_created_date'])){$fwViewData['detail']['be_created_date']=$current_date;}
	if(empty($fwViewData['detail']['be_created_time'])){$fwViewData['detail']['be_created_time']=$current_time;}
	
	if(empty($fwViewData['detail']['be_easts_date'])){$fwViewData['detail']['be_easts_date']=$current_date;}
	if(empty($fwViewData['detail']['be_easts_time'])){$fwViewData['detail']['be_easts_time']=$current_time;}
	
	
	if(!empty($detail['bcust_misc_logged_date_date']) AND $detail['bcust_misc_logged_date_date']!=''){$detail['bcust_misc_logged_date_date']= changedate_d_m_Y($detail['bcust_misc_logged_date_date']);}
	if(!empty($detail['bcust_gendec_sent_date']) AND $detail['bcust_gendec_sent_date']!=0){$detail['bcust_gendec_sent_date']= changedate_d_m_Y($detail['bcust_gendec_sent_date']);}
	if(!empty($detail['bcust_gendec_signed_date']) AND $detail['bcust_gendec_signed_date']!=0){$detail['bcust_gendec_signed_date']= changedate_d_m_Y($detail['bcust_gendec_signed_date']);}
	
	if(!empty($detail['bcust_misc_logged_date_time']) AND $detail['bcust_misc_logged_date_time']!=0){$detail['bcust_misc_logged_date_time']= changetime_h_m($detail['bcust_misc_logged_date_time']);}
	if(!empty($detail['bcust_gendec_sent_time']) AND $detail['bcust_gendec_sent_time']!=0){$detail['bcust_gendec_sent_time']= changetime_h_m($detail['bcust_gendec_sent_time']);}
	if(!empty($detail['bcust_gendec_signed_time']) AND $detail['bcust_gendec_signed_time']!=0){$detail['bcust_gendec_signed_time']= changetime_h_m($detail['bcust_gendec_signed_time']);}
	
	
	$tableuser_logged->setWhere("ul_user_id = ".$detail['bcust_user_id']);
	$userlogdata = 	$tableuser_logged->getRow();	
	if($userlogdata)
		{
		$detail['ul_date'] = changedate_d_m_Y($userlogdata['ul_date']);
		$detail['ul_time'] = changetime_h_m($userlogdata['ul_time']);
		}
		
		
		$fwViewData['detail'] = clean_query_for_show($detail);
}
else
{   $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
	

 	
	$fwViewData['detail']['bcust_misc_logged_date_date']=$current_date;	
	$fwViewData['detail']['bcust_misc_logged_date_time']=$current_time;	
	
	$fwViewData['detail']['bcust_gendec_sent_time']=$current_time;
	//$fwViewData['detail']['bcust_gendec_signed_time']=$current_time;
	
	//$fwViewData['detail']['bcust_gendec_signed_date']=$current_date;
	$fwViewData['detail']['bcust_gendec_sent_date']=$current_date;
	
	$fwViewData['detail']['be_ipc_date']=$current_date;
	$fwViewData['detail']['be_ipc_time']=$current_time;
	
	$fwViewData['detail']['be_created_date']=$current_date;
	$fwViewData['detail']['be_created_time']=$current_time;
	
	$fwViewData['detail']['be_easts_date']=$current_date;
	$fwViewData['detail']['be_easts_time']=$current_time;
}
unset($_SESSION['attach']);
	//send_general_disclamer("Stephen", "Hock", "Stephen@gmail.com");
	//send_all_dossaire($table_id);
